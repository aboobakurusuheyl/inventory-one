<template>
	<div class="row">
				
		    <div class="modal fade" id="viewPayment" tabindex="-1" role="dialog" ref="vuemodal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">

           

                        <div class="modal-header">
                            <h4 class="modal-title" id="CreatePayment">Payment on Invoice No : {{ id }}  <br> Customer : {{ invoice.customer.customer_name }} </h4>
                        </div>
                        <div class="modal-body">
                      
                           <div class="table-responsive">
                           	  <table class="table table-bordered table-condensed">
                           	  	<thead>
                           	  		<tr>
                           	  			<th>Date</th>
                           	  			<th>Amount</th>
                           	  			<th>Payment In</th>
                           	  			<th>Info</th>
                           	  			<th>Receive By</th>
                           	  			<th>Action</th>
                           	  		</tr>

                           	  		 
                           	  	</thead>

                           	  	<tbody>
                           	  		<tr v-for="payment in payments">
                           	  		  <td>{{ payment.date }}</td>	
                           	  		  <td>{{ payment.amount }}</td>	
                           	  		  <td>{{ payment.paid_in }}</td>	
                           	  		  <td>{{ payment.bank_information }}</td>	
                           	  		  <td>{{ payment.user.name }}</td>	
                           	  		  <td>
                                     <button @click="deletePayment(payment.id)" type="button" class="btn bg-pink btn-circle waves-effect waves-circle waves-float">
                                         <i class="material-icons">delete</i>
                                     </button> </td>	
                           	  		</tr>

                           	  	</tbody> 
                           	  </table>
                           </div>

                           <div class="row">
                           	<div class="col-md-4">
                               <div class="form-group">
                               	<p>Total Payble</p>
                               	<input type="text" name="" disabled="" :value="invoice.total_amount">
                               </div>   

                               <div class="form-group">
                               	<p>Total Paid</p>
                               	<input type="text" name="" disabled="" :value="totalAmount">
                               </div> 

                               <div class="form-group">
                               	<p>Current Due</p>
                               	<input type="text" name="" disabled="" :value="invoice.total_amount-totalAmount">
                               </div>
                                
                             
                           	</div>
                           </div>

                         
                        </div>
                        <div class="modal-footer">
                            <button @click="closeModal" type="button" class="btn btn-danger waves-effect" data-dismiss="modal">CLOSE</button>
                        </div>

                    </div>
                </div>
            </div>
	</div>
</template>

<script>

   import {EventBus} from '../../vue-asset';
   import mixin from '../../mixin.js';
export default{
    
    name : 'view-payment',
    mixins : [mixin],

	data(){

		return { 
            
            id : '',  

            invoice :	{
            id	: '',
            user_id	: '',
            customer_id	: '',
            total_amount : 0,
            paid_amount : 0,

            customer : {
            id : '',
            customer_name : '',
              },
            },


			payments : [],
			total_paid : 0,
		}
	},

	created(){
     
    var  _this = this;

     EventBus.$on('view-payment',function(id){
       _this.id = id;
       _this.getPayment(id);

     });
      
	},


	mounted() {
    
     var _this = this;
      $("#viewPayment").on('hidden.bs.modal', function(){
          
          _this.closeModal()
      });  
	},

	methods : {

     getPayment(id){

       axios.get(base_url+'payment/'+id)
       .then(response => {
            
         this.payments = response.data.payment;  
         this.invoice = response.data.invoice;  

       })

       .catch(error => {
        
        console.log(error);

       });	


     },

             deletePayment(id){

             Swal({
                 title: 'Are you sure?',
                 text: "You won't be able to revert this!",
                 type: 'warning',
                 showCancelButton: true,
                 confirmButtonColor: '#3085d6',
                 cancelButtonColor: '#d33',
                 confirmButtonText: 'Yes, delete it!'
             },() => {
             }).then((result) => {
                 if (result.value) {

                     axios.delete(base_url+'payment/'+id)
                     .then(res => {
                         this.getPayment(this.id);
                         this.successALert(res.data);
                     })


                 }
             })       


         },

         closeModal(){
            
            EventBus.$emit('invoice-created',1);
          
         }

	},

	computed : {

	totalAmount(){
      let sum = 0;
      this.payments.forEach(function(item) {
         sum += item.amount;
      });

     return sum;

 	    },
	}



}	

</script>