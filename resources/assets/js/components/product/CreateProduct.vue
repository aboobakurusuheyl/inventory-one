<template>
	
	<div class="wrap">
		
		<div class="modal fade" id="create-product" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="defaultModalLabel">Product Information</h4>
					</div>
					<div class="modal-body">
						<div class="alert alert-danger" v-if="errors">
							<ul>
								<li v-for="error in errors">{{ error[0] }}</li>
							</ul>
						</div>
						<form>
							<div class="row">
								<div class="col-md-12">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">palette</i>
										</span>
										<div class="form-line">
											<input type="text" class="form-control date" placeholder="product Name" v-model="product.name">
										</div>
									</div>
								</div>        

								<div class="col-md-12">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">line_style</i>
										</span>
										<div class="form-line">
											<input type="text" class="form-control date" placeholder="product note" v-model="product.details">
										</div>
									</div>
								</div>


								</div>

						
						</form>

					</div>
					<div class="modal-footer">
						<br>
						<button @click="createProduct" type="button" class="btn btn-success waves-effect">SAVE</button>
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

		data(){

			return {

				product : {

					name : '',
					details : '',

				},

				errors : null 


			}

		},

		methods : {


			createProduct(){

				axios.post(base_url+'product',this.product)

				.then(response => {

					$('#create-product').modal('hide');

					this.product = {'name':'','details':''};
					this.errors = null;
					EventBus.$emit('product-created',response.data);

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