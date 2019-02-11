<template>

	<div class="row">

			<div class="col-md-4">
			<div class="input-group">
			<div class="form-line">
			   <select class="form-control" name="type" required="" v-model="report_type">
			   	 <option :value="''">Chose Report Type *</option>
			   	 <option :value="'stock'">Stock Report</option>
			   	 <option :value="'sell'">Sell Report</option>
			   	 <option :value="'profit'">Profit Report</option>
			   	 <option :value="'due'">Due Report</option>
			   	 <option :value="'invoice'">Invoice Report</option>
			   </select>
			</div>
			</div>
		</div>

		<div class="col-md-4">
			<div class="input-group">
			<div class="form-line">
				<vuejs-datepicker :required="true" :placeholder="'Date To *'" :name="'start_date'" :input-class="'form-control'"></vuejs-datepicker>
			</div>
			</div>
		</div>	

		<div class="col-md-4">
			<div class="input-group">
			<div class="form-line">
				<vuejs-datepicker :required="true" :placeholder="'Date From *'" :name="'end_date'" :input-class="'form-control'"></vuejs-datepicker>
			</div>
			</div>
		</div>	


		<div class="col-md-4" v-if="!isEnable">
			<div class="input-group">
			<div class="form-line">
			 <select class="form-control" name="category_id" v-model="category_id" v-on:change="findProduct">
			 	<option value="">Chose Category (optional)</option>
			 	<option v-for="value in category" :value="value.id">{{ value.name }}</option>
			 </select>
			</div>
			</div>
		</div>	

		<div class="col-md-4" v-if="!isEnable">
			<div class="input-group">
			<div class="form-line">
			 <select class="form-control" name="product_id" v-model="product_id" v-on:change="findStock">
			 	<option value="">Chose Product (optional)</option>
			 	<option v-for="pr in product" :value="pr.id">{{ pr.product_name }}</option>
			 </select>
			</div>
			</div>
		</div>	


		<div class="col-md-4" v-if="!isEnable">
			<div class="input-group">
			<div class="form-line">
			 <select class="form-control" name="stock_id" v-model="chalan_id">
			 	<option value="">Chose Chalan (optional)</option>
			 	<option v-for="ch in chalan" :value="ch.id">{{ ch.chalan_no }}</option>
			 </select>
			</div>
			</div>
		</div>

		<div class="col-md-4" v-if="!isEnable">
			<div class="input-group">
			<div class="form-line">
			 <select class="form-control" name="vendor_id" >
			 	<option value="">Chose Vendor (optional)</option>
			 	<option v-for="vn in chalan" :value="vn.id">{{ vn.name }}</option>
			 </select>
			</div>
			</div>
		</div>		


		<div class="col-md-4">
			<div class="input-group">
			<div class="form-line">
			 <select class="form-control" name="customer_id" >
			 	<option value="">Customer (optional)</option>
			 	<option v-for="cs in customer" :value="cs.id">{{ cs.customer_name }}</option>
			 </select>
			</div>
			</div>
		</div>		


		<div class="col-md-4">
			<div class="input-group">
			<div class="form-line">
			 <select class="form-control" name="user_id" >
			 	<option value="">Chose Stock Entire / Seller (optional)</option>
			 	<option v-for="us in user" :value="us.id">{{ us.name }}</option>
			 </select>
			</div>
			</div>
		</div>

	
	</div>
	
</template>


<script>
  
  import {EventBus} from '../../vue-asset';	
  import Datepicker from 'vuejs-datepicker';

	export default{
       props : ['category','user','customer'],
       components : {
         
         'vuejs-datepicker' : Datepicker,
        
       },

       data(){
          
          return {

           report_type : '', 
           category_id : '',
           product_id : '',
           chalan_id : '',

           product : [],
           chalan : [],



          }

       },

       methods: {

       	       findProduct(){ 

               axios.get(base_url+'category/product/'+this.category_id)
              .then(response => {
               
                this.product = response.data;

              })
		  	},


		  	findStock(){

               axios.get(base_url+'chalan-list/chalan/'+this.product_id)
              .then(response => {
               
                this.chalan = response.data;

              })

		  

		  	},



       },

     computed:{
      isEnable(){
      return this.report_type === 'invoice' || this.report_type === 'due';

      }
     }

	}

</script>