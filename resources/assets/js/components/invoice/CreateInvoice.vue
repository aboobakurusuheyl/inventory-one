<template>
	 
	      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	      	     <h2 v-if="!invoice_state">
                          	 <button  @click="showInvoice" type="button" class="btn btn-primary">
                                <i class="glyphicon glyphicon-plus"></i> New Invoice
                             </button>
                          </h2>
                    <div v-show="invoice_state" class="card">
                        <div class="header">
                           <h2>
                                Create Invoice
                          
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


                        	<!-- main invoice part  -->
                              
                              <div class="row">
                              	<div class="table-responsive">
                              		
                              		<table class="table table-bordered">

                              			<thead>
                              			 <tr>
                              				<th>#</th>
                              				<th>Category</th>
                              				<th>Product</th>
                              				<th>Chalan</th>
                              				<th>QTY</th>
                              				<th>Price</th>
                              				<th>Discount</th>
                              				<th>Total</th>
                              			</tr>
                              			</thead>
                              		
                                        <tbody>
                                         
                                         <tr v-for="(vl,index) in invoice.product">
                                         	<td>
                                         	<a href="" class="btn btn-sm btn-danger">
                                    <i class="material-icons">delete</i>
                                       </a>       
                                         	</td>
                              				<td>
                              					<select class="form-control">
                              						<option value="">Select Category</option>
                              						<option v-for="value in categorys" :value="value.id">{{ value.name }}</option>
                              					</select>
                              				</td>	

                              				<td>
                              					<select class="form-control">
                              						<option value="">Select Product</option>
                              					<!-- 	<option v-for="value in categorys" :value="value.id">{{ value.name }}</option> -->
                              					</select>
                              				</td>

                              				<td>
                              					<select class="form-control">
                              						<option value="">Select Chalan</option>
                              					<!-- 	<option v-for="value in categorys" :value="value.id">{{ value.name }}</option> -->
                              					</select>
                              				</td>		

                              				<td>
                              					<input class="form-control" type="number" name="" placeholder="QTY">
                              				</td>

                              				<td>
                              					<input class="form-control" type="text" name="" placeholder="price">
                              				</td>	

                              				<td>
                              					<input class="form-control" type="text" name="" placeholder="Discount">
                              				</td>	

                              				<td>
                              					<input class="form-control" type="text" name="" placeholder="Total">
                              				</td>
                              				
                              			</tr>
                                        </tbody>
                          


                              		</table>
                                    
                              	</div>
                              	<div class="row">
                              		<div class="col-md-12">
                              		<a href="" @click.prevent="addmore" class="btn btn-success">Add More</a>	
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
               customer_type : '',
               customer_id : '',
               customer_name : '',
               customer_email: '',
               customer_phone : '',
               customer_address : '',
               
               product : [
                   {category : '',product : '' },
               ],

              },

              invoice_state : false,

               errors : null
			}

		},

		methods : {




			createVendor(){

				axios.post(base_url+'invoice',)

				.then(response => {
					EventBus.$emit('invoice-created',response.data);
					this.successALert(response.data);
				})
				.catch(err => {

					if(err.response){

						this.errors = err.response.data.errors;
					}

				})

			},

			showInvoice(){

				this.invoice_state = !this.invoice_state;
			},

			addmore(){

				this.invoice.product.push({category:'',product:''});
			}



		},

  // end of method section 


  created(){

     console.log('invoice page created');
  },




}





</script>