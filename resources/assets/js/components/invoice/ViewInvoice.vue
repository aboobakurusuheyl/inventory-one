<template>
    <div class="wrap">
    <!--    <div class="row">
            
            filtering element 
        </div> -->
        <div class="body">

             <!--  	 <div class="row">
                  <edit-stock :categorys="categorys" :vendors="vendors"></edit-stock>
                  <update-qty></update-qty>
              </div> -->

              <update-invoice :categorys="categorys" :customers="customers"></update-invoice>

              <div class="row">
                  <div class="col-md-4">
                      <input type="text" class="form-control" v-on:keyup="getData(1)"  v-model="invoice_id" placeholder="Search By Invoice Number">
                  </div>
                  <div class="col-md-4">
                      <select class="form-control show-tick" data-live-serach="true" @change="getData(1)" v-model="customer_id">
                          <option value="">All Customer</option>

                          <option v-for="(customer,index) in customers" :value="customer.id">{{ customer.customer_name  }}</option>
                      </select>
                  </div>
                  <div class="col-md-4">
                     <!--      <select class="form-control show-tick" data-live-serach="true" @change="getData(1)" v-model="vendor">
                                <option value="">All Vendor</option>

                             <option v-for="(vd,index) in vendors" :value="vd.id">{{ vd.name  }}</option>
                         </select> -->
                     </div>



                 </div>

                 <div class="table-responsive">

                     <table class="table table-condensed table-hover table-bordered">
                         <thead>
                             <tr>
                                 <th>Invoice</th>
                                 <th>Date</th>
                                 <th>Customer</th>
                                 <th>Total Amount</th>
                                 <th>Paid</th>
                                 <th>Due</th>
                                 <th>Sold By</th>
                                 <th>Action</th>
                             </tr>
                         </thead>
                         <tbody>
                             <tr v-for="(value,index) in invoices.data">
                                 <td>{{ value.id }}</td>
                                 <td>{{ value.sell_date | moment('LL') }}</td>
                                 <td>{{ value.customer.customer_name }}</td>
                                 <td>{{ value.total_amount }}</td>
                                 <td>{{ value.paid_amount }}</td>
                                 <td>{{ value.total_amount - value.paid_amount }}</td>
                                 <td>{{ value.user.name }}</td>

                                 <td>

                                     <a :href="url+value.id" target="_blank" type="button" class="btn bg-blue btn-circle waves-effect waves-circle waves-float">
                                         <i class="material-icons">print</i>
                                     </a>

                                     <button @click="editInvoice(value.id)" type="button" class="btn bg-blue btn-circle waves-effect waves-circle waves-float">
                                         <i class="material-icons">edit</i>
                                     </button>

                                     <button @click="deleteInvoice(value.id)" type="button" class="btn bg-pink btn-circle waves-effect waves-circle waves-float">
                                         <i class="material-icons">delete</i>
                                     </button>       

                                 </td>

                             </tr>

                         </tbody>

                     </table>

                 </div>

                 <div class="row">
                     <div class="text-center col-md-12" v-if="invoices.last_page > 1">
                         <ul class="pagination">
                             <li :class="[ ((invoices.current_page == 1) ? 'disabled' : '') ]">
                                 <a :href="'?page='+invoices.current_page" @click.prevent="pageClicked(invoices.current_page-1)" aria-label="Previous" v-if="invoices.current_page != 1">
                                     <span aria-hidden="true">«</span>
                                 </a>
                                 <a v-else>
                                     <span  aria-hidden="true">«</span>
                                 </a>
                             </li>
                             <li v-for="pageNo in range(paginateLoop, numberOfPage)"
                             :class="[ ((invoices.current_page == pageNo) ? 'active' : '') ]">
                             <a :href="'?page='+pageNo" @click.prevent="pageClicked(pageNo)">{{ pageNo }}</a>
                         </li>
                         <li :class="[ ((invoices.current_page == invoices.last_page) ? 'disabled' : '') ]" >
                             <a  :href="'?page='+invoices.current_page" @click.prevent="pageClicked(invoices.current_page+1)" aria-label="Next" v-if="invoices.current_page != invoices.last_page">
                                 <span aria-hidden="true">»</span>
                             </a>
                             <a v-else>
                                 <span  aria-hidden="true">»</span>
                             </a>
                         </li>
                     </ul>
                 </div>
             </div>  






         </div>
     </div>
 </template>

 <script>

     import {EventBus} from '../../vue-asset';
     import mixin from '../../mixin.js';

    import UpdateInvoice from './UpdateInvoice.vue';
    // import UpdateQuantity from './UpdateQuantity.vue';
    

    export default{

        props: ['categorys','customers'],

        mixins:[mixin],

        components : {

        //     'edit-stock' : editStock,
            'update-invoice' : UpdateInvoice,

        },

        data(){

            return {

                invoice_id : '',
                customer_id : '',
                start_date : '',
                end_date : '',
                invoices : [],

                url : base_url+'invoice/',

            }


        },
        created(){


           // this.hello();

           var _this = this; 
           this.getData();

           EventBus.$on('invoice-created', function () {
               _this.getData();
           });

       },

       methods : {

           getData(page = 1){

               axios.get(base_url+"invoice-list?page="+page+"&customer_id="+this.customer_id+"&invoice_id="+this.invoice_id+"&start_date="+this.end_date+"&end_date="+this.start_date).then(response =>
                {
                      this.invoices = response.data;

                }).catch(error =>
                {

                      console.log(error);
                })
                             },


         // edit vendor 

           editInvoice(id){

             EventBus.$emit('edit-invoice',id);

                          },


         // delete vendor 


         deleteInvoice(id){

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

                     axios.delete(base_url+'invoice/'+id)
                     .then(res => {

                         EventBus.$emit('invoice-created',1);

                         this.successALert(res.data);

                     })


                 }
             })       


         },

         range(start, count) {
             return Array.apply(0, Array(count))
             .map(function (element, index){
                 return index + start;
             });
         },


         pageClicked(pageNo){
             var vm = this;
             vm.getData(pageNo);
         },

     },

     computed: {

         paginateLoop(){
             let invoices = this.invoices;
             if(invoices.last_page > 11){
                 if((invoices.last_page - 5) <= invoices.current_page){
                     return invoices.last_page - 10;
                 }
                 if(invoices.current_page > 6){
                     return invoices.current_page - 5;
                 }
             }
             return 1;
         },
         numberOfPage(){
             if(this.invoices.last_page < 11){
                 return this.invoices.last_page;
             }else{
                 return 11;
             }
         }


     },



 }





</script>