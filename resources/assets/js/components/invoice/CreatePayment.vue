<template>
	
	<div class="wrap">
		
		    <div class="modal fade" id="smallModal" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">

                    		<div class="alert alert-danger" v-if="errors">
							<ul>
								<li v-for="error in errors">{{ error[0] }}</li>
							</ul>
						</div>

                    	<form @submit.prevent="Payment()">
                        <div class="modal-header">
                            <h4 class="modal-title" id="CreatePayment">Payment on Invoice No. : {{ payment.id }}</h4>
                        </div>
                        <div class="modal-body">
                      
                           	  <div class="form-inline">
                           	  	<p>Date</p>
                           	  	<input style="width: 100%;" type="text" class="form-control" name="" placeholder="Date:YYYY-MM-DD" v-model="payment.payment_date">
                           	  </div>

                           	  <div class="form-inline" style="margin-top: 10px;">
                           	  	<p>Amount</p>
                           	  	<input style="width: 100%;" type="text" class="form-control" name="" placeholder="Amount" v-model="payment.payment_amount">
                           	  </div>

                           	  <div class="form-inline" style="margin-top: 10px;">
                           	  	<p>Paid In</p>
                           	  	 <select class="form-control" style="width: 100%;" v-model="payment.payment_in">
                           	  	 	<option :value="'cash'">Cash</option>
                           	  	 	<option :value="'bank'">Bank</option>
                           	  	 </select>
                           	  </div>

                           	  <div class="form-inline" style="margin-top: 10px;" v-if="payment.payment_in === 'bank' ">
                           	  	<p>Bank Info</p>
                           	  	<textarea placeholder="Bank Information" style="width: 100%;" v-model="payment.bank_info"></textarea>
                           	  </div>
                         
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn bg-teal waves-effect">Save</button>
                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
                        </div>

                     </form>
                    </div>
                </div>
            </div>
	</div>

</template>

<script type="text/javascript">
   
    import {EventBus} from '../../vue-asset';
    import mixin from '../../mixin.js';

  export default{
     
     name : 'create-payment',
     mixins : [mixin],

     data() {

     	return {
          
          payment : {

          	 id : '',
          	 payment_amount : 0,
          	 payment_date : '',
          	 payment_in : 'cash',
          	 bank_info : '',
          },

          errors : null,


         
     	}
     },



     created(){
      
       let vm = this;
      EventBus.$on('create-payment',function(id){
           
           vm.payment.id = id;
    

      });

     },

     methods : {


     	Payment(){

          axios.post(base_url+'payment',this.payment)
          .then(response => {
            
            this.successALert(response.data);
            this.resetForm();

           $('#smallModal').modal('hide');
           
            EventBus.$emit('invoice-created',1);

          })
          .catch(error => {
             
              if(error.response.status == 422){
            this.errors = error.response.data.errors;

           Swal( "Oops" ,  "please fill the form by correct data!" ,  "error" );
            }
          else{
            this.successALert(error);
           }


          });

     	},

     	resetForm(){

              
          this.payment = {

          	 id : '',
          	 payment_amount : 0,
          	 payment_date : '',
          	 payment_in : 'cash',
          	 bank_info : '',
          }
     	},


     }

  }	 


</script>