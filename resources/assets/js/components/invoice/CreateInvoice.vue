<template>
	 
	      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	      	     <h2 v-if="!invoice_state">
                          	 <button  @click="showInvoice" type="button" class="btn btn-primary">
                                <i class="glyphicon glyphicon-plus"></i> New Invoice
                             </button>
                          </h2>
                    <div v-show="invoice_state" class="card">
                        <div class="header">
                           <h2 class="pull-left">
                                Create Invoice
                          
                            </h2> 

                            <h2 class="pull-right">
                                   <a href="" @click.prevent="showInvoice" class="btn bg-red btn-circle waves-effect waves-circle waves-float">
                                    <i class="material-icons">close</i>
                                </a> 
                          
                            </h2>
                        </div>

                        <div  class="body">
                        	
                        	<form>
                        		
                        	<div class="row">
                        		<div class="col-md-4">
                        			<!-- <p>Customer</p> -->
                        		  	<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">person</i>
										</span>
										<div class="form-line">
											<select class="form-control" v-model="invoice.customer_type">
												<option value="">Select Customer</option>
												<option value="1">From Database</option>
												<option value="2">New Customer</option>
											</select>
										</div>
									</div>
                        		</div>	


                        		<div class="col-md-4" v-if="invoice.customer_type == 1">
                        			<!-- <p>Customer</p> -->
                        		  	<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">person</i>
										</span>
										<div class="form-line">
											<select class="form-control" v-model="invoice.customer_id">
												<option value="">Customer List</option>

												<option v-for="customer in customers" :value="customer.id">{{ customer.customer_name }}</option>
								                
											</select>
										</div>
									</div>
                        		</div>
                        	</div>

                        	<div class="row" v-if="invoice.customer_type == 2">
                        		<div class="col-md-6">

                        			<div class="input-group">
                        					<span class="input-group-addon">
										<i class="material-icons">person</i>
									</span>
										<div class="form-line">
									     <input type="text" name="" class="form-control" placeholder="Customer Name" v-model="invoice.customer_name">
										</div>
                        			</div>
                        		
                        		</div>	

                        		<div class="col-md-6">
                        			<div class="input-group">
                        						<span class="input-group-addon">
										<i class="material-icons">email</i>
									</span>
										<div class="form-line">
									     <input type="text" name="" class="form-control" placeholder="Customer Email" v-model="invoice.customer_email">
										</div>
                        			</div>
                        	
                        		</div>		

                        		<div class="col-md-6">
                        			<div class="input-group">
                        						<span class="input-group-addon">
										<i class="material-icons">phone</i>
									</span>
										<div class="form-line">
									     <input type="text" name="" class="form-control" placeholder="Customer Phone No:" v-model="invoice.customer_phone">
										</div>
                        			</div>
                        	
                        		</div>		

                        		<div class="col-md-6">
                        			<div class="input-group">
                        			<span class="input-group-addon">
										<i class="material-icons">note</i>
									</span>
										<div class="form-line">
									    <textarea rows="1" class="form-control no-resize auto-growth" placeholder="Customer Address" v-model="invoice.customer_address"></textarea>
										</div>
                        			</div>
                        		
                        		</div>
                        	</div>

                        	<div class="row">
                        		
                        		  		<div class="col-md-4">
                        			<p>Invoice Number</p>
                        		  	<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">person</i>
										</span>
										<div class="form-line">
									     <input class="form-control" type="text" disabled name="" v-model="invoice.invoice_no">
										</div>
									</div>
                        		</div>	
      		
                        		  		

                        		  <div class="col-md-4">
                        			<p>Invoice Date</p>
                        		  	<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">person</i>
										</span>
										<div class="form-line">
									     <input class="form-control" type="text"  name="" v-model="invoice.invoice_date">
										</div>
									</div>
                        		</div>	

                        	</div>


                        	<!-- main invoice part  -->
                              
                              <div class="row">
                              	<div class="table-responsive">
                              		
                              		<table class="table table-bordered">

                              			<thead class="bg-teal">
                              			 <tr>
                              				<th>#</th>
                              				<th>Category</th>
                              				<th>Product</th>
                              				<th>Chalan</th>
                              				<th>QTY</th>
                              				<th>Price</th>
                              				<th>Discount</th>
                              				<th>Discount By</th>
                              				<th>Total</th>
                              			</tr>
                              			</thead>
                              		
                                        <tbody>
                                         
                                         <tr v-for="(vl,index) in invoice.product">
                                         	<td>
                                 <a href="" @click.prevent="removeItem(index)" class="btn bg-red btn-circle waves-effect waves-circle waves-float">
                                    <i class="material-icons">delete</i>
                                </a>       
                                         	</td>
                              				<td>
                              					<select class="form-control" v-model="invoice.product[index].category" @change="findProduct(index)">
                              						<option value="">Select Category</option>
                              						<option v-for="(value,index) in categorys" :value="value.id">{{ value.name }}</option>
                              					</select>
                              				</td>	

                              				<td>
                              					<select class="form-control" v-model="invoice.product[index].product_id" @change="findStock(index)">
                              						<option value="">Select Product</option>

                              						<option v-for="pr in vl.products" :value="pr.id">{{ pr.product_name }}</option>
              
                              					</select>
                              				</td>

                              				<td>
                              					<select class="form-control" v-model="invoice.product[index].chalan_id" @change="findStockDetails(index)">
                              					   <option value="">Select Chalan</option>
                              					   <option v-for="ch in vl.stocks" :value="ch.id">{{
                              					   ch.chalan_no  }}. qty({{ ch.current_quantity }})</option>
                              					</select>
                              				</td>		

                              				<td>
                              					<input class="form-control" type="number" name="" v-model="invoice.product[index].quantity" placeholder="QTY">
                              				</td>

                              				<td>
                              					<input class="form-control" type="text" name="" v-model="invoice.product[index].price"
                              					placeholder="price" value="" >
                              				</td>	

                              				<td>
                              					<input class="form-control" type="text" name="" 
                              					v-model="invoice.product[index].discount" placeholder="Discount">
                              				</td>	

                              				<td>
                              				<select class="form-control" v-model="invoice.product[index].discount_type">
                              					   <option value="1">Amount</option>
                              					   <option value="2">%</option>
                              				</select>
                              				</td>	

                              				<!-- for getting discount amount  -->

                              				<input type="hidden" :value="vl.discount_amount = discount(invoice.product[index].discount_type,invoice.product[index].discount,vl.price)">

                              				<td>
                              					<input class="form-control" type="text" name="" placeholder="Total" disabled="" :value="vl.total_price = vl.quantity * vl.price - vl.discount_amount">
                              				</td>
                              				
                              			</tr>
                                        </tbody>
                          


                              		</table>
                                    
                              	</div>
                              	<div class="row">
                              		<div class="col-md-12">
                              		<a href="" @click.prevent="addmore" class="btn bg-teal">+ Add More</a>	
                              		</div>
                              		
                              	</div>
                              </div>

                        	<!-- main invoice part  -->

                        	</form>
                        

                        </div>

                    

                    </div>
                </div>

</template>

<script>

	import {EventBus} from '../../vue-asset';

	import mixin from '../../mixin';


	export default {

        props: ['categorys','customers'], 
		mixins : [mixin],

		data(){

			return {
              
              invoice : { 
               invoice_no : '',
               customer_type : '',
               customer_id : '',
               customer_name : '',
               customer_email: '',
               customer_phone : '',
               customer_address : '',
               invoice_date : '',
               total_discount : 0,
               total_amount : 0,
               
               product : [
                   {
                   	category : '',
                   	product_id : '',
                   	chalan: '',
                   	chalan_id: '',
                   	quantity : 0,
                   	price : 0,
                    total_price : 0 ,
                    discount : 0 ,
                    discount_type : '1',
                    discount_amount : 0,
                    products : [],
                    stocks : [],
                   }
               ],



              },

              invoice_state : false,

               errors : null
			}

		},

		created(){

  	      
        },

		methods : {
              
           findProduct(index){ 

		  	 if(this.invoice.product[index].category === ''){

               this.invoice.product[index].products = [];

		  	  }
		  	  else{
              
               axios.get(base_url+'category/product/'+this.invoice.product[index].category)
              .then(response => {
               
                this.invoice.product[index].products = response.data;
                this.invoice.product[index].stocks = [];

              })

		  	  }
		  	},


		  	findStock(index){
             
            if(this.invoice.product[index].product_id === ''){

               this.invoice.product[index].stocks = [];

		  	  }
		  	  else{
              
               axios.get(base_url+'chalan-list/chalan/'+this.invoice.product[index].product_id)
              .then(response => {
               
                this.invoice.product[index].stocks = response.data;

              })

		  	  }


		  	},

		  	findStockDetails(index){   
         
		    if(this.invoice.product[index].chalan_id === ''){

                this.invoice.product[index].quantity = 0;
                this.invoice.product[index].price = 0;
                this.invoice.product[index].discount = 0;

		  	  }
		  	  else{
              
               axios.get(base_url+'stock/'+this.invoice.product[index].chalan_id)
              .then(response => {
               
                this.invoice.product[index].quantity = 1;
                this.invoice.product[index].price = response.data.selling_price;
                this.invoice.product[index].discount = response.data.discount;

              })

		  	  }		  	
		  	},

			showInvoice(){

				this.invoice_state = !this.invoice_state;
               // $("html, body").animate({ scrollTop: 0 }, 800);
				  
				  axios.get(base_url+'get/invoice/number')
				  .then(response => {
                     
                     this.invoice.invoice_no = response.data;

				  })

				
				window.scrollTo(0, top);
			},

			addmore(){

				this.invoice.product.push({ 
			        category : '',
                   	product_id : '',
                   	chalan: '',
                   	chalan_id: '',
                   	quantity : 0,
                   	price : 0,
                    total_price : 0 ,
                    discount : 0 ,
                    discount_type : '1',
                    discount_amount : 0,
                    products : [],
                    stocks : [],
                     });
			},

			removeItem(index){
                
                  var _this = this;
                if(_this.invoice.product.length > 1){
                    _this.invoice.product.splice(index, 1);
                    // _this.totalPrice(index);
                }

			},

			resetForm(){


			},

			discount(type,discount,main_amount){


				if(type === '2'){

					return ((discount/100)*main_amount);
				}

				else{
                    
                    return discount;

				}




			}





		},

  // end of method section 


 computed : {
    
      // discount(index){
          
      //     if(this.invoice.product[index].disount_type == '2'){
           
      //      return ((this.invoice.product[index].discount / 100) * this.invoice.product[index].total_price); 
    
      //     }
      //     else{

      //     	return  this.invoice.product[index].discount;

      //     }

      // },

    
  },






}





</script>