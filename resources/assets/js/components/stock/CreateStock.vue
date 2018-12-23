<template>
	
	<div class="wrap">
		
		<div class="modal fade" id="create-stock" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="defaultModalLabel">Stock In</h4>
					</div>
					<div class="modal-body">
						<div class="alert alert-danger" v-if="errors">
							<ul>
								<li v-for="error in errors">{{ error[0] }}</li>
							</ul>
						</div>
						<form>
							<div class="row">
								<div class="col-md-6">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">palette</i>
										</span>
										<div class="form-line">
											<select class="form-control show-tick" v-model="stock.product">
												<option value="">Select Product</option>

												 <option v-for="(value,index) in products" :value="value.id">{{ value.product_name }}</option>
											</select>
										</div>
									</div>
								</div>        

								<div class="col-md-6">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">line_style</i>
										</span>
										<div class="form-line">
											<input type="text" class="form-control date" placeholder="stock note" v-model="stock.vendor">
										</div>
									</div>
								</div>	

								<div class="col-md-6">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">line_style</i>
										</span>
										<div class="form-line">
											<input type="text" class="form-control date" placeholder="Quantity " v-model="stock.quantity">
										</div>
									</div>
								</div>		


								<div class="col-md-6">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">line_style</i>
										</span>
										<div class="form-line">
											<input type="text" class="form-control date" placeholder="Buying Price" v-model="stock.buying_price">
										</div>
									</div>
								</div>		

								<div class="col-md-6">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">line_style</i>
										</span>
										<div class="form-line">
											<input type="text" class="form-control date" placeholder="Selling Price" v-model="stock.selling_price">
										</div>
									</div>
								</div>	




								</div>

						
						</form>

					</div>
					<div class="modal-footer">
						<br>
						<button @click="createStock" type="button" class="btn btn-success waves-effect">SAVE</button>
						<button type="button" class="btn btn-default waves-effect" data-dismiss="modal">CLOSE</button>
					</div>
				</div>
			</div>
		</div>

	</div>

</template>

<script>

	import {EventBus} from '../../vue-asset';


	export default {

		props:['vendor','products'],

		data(){

			return {
			  stock : {

					product : '',
					vendor : '',
					quantity : 0,
					buying_price : 0,
					selling_price :0,
					chalan_no : '',

				},

				errors : null 


			}

		},

		methods : {


			createStock(){

				axios.post(base_url+'stock',this.stock)

				.then(response => {

					$('#create-stock').modal('hide');

					this.stock = {'product':'','vendor':'','quantity':0,'buying_price':0,'selling_price':0,'chalan_no':''};

					this.errors = null;
					EventBus.$emit('stock-created',response.data);

					// this.showMessage(response.data);

					this.successALert(response.data);

				})
				.catch(err => {

					if(err.response){

						this.errors = err.response.data.errors;
					}

				})

			},

			successALert(data){

				Swal({
					position: 'top-end',
					type: data.status,
					title: data.message,
					showConfirmButton: false,
					timer: 1500
				})
			}



		},

  // end of method section 


  created(){


  },




}



</script>