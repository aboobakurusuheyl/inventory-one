<template>
	
	<div class="wrap">
		
		<div class="modal fade" id="create-user" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
					<form @submit.prevent="createuser">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="defaultModalLabel">Add User</h4>
					</div>
					<div class="modal-body">
						<div class="alert alert-danger" v-if="errors">
							<ul>
								<li v-for="error in errors">{{ error[0] }}</li>
							</ul>
						</div>
					
							<div class="row">
								<div class="col-md-6">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">palette</i>
										</span>
										<div class="form-line">
											<input type="text" class="form-control date" placeholder="User Name" v-model="user.name">
										</div>
									</div>
								</div>	

								<div class="col-md-6">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">palette</i>
										</span>
										<div class="form-line">
											<input type="email" class="form-control date" placeholder="User Email" v-model="user.email">
										</div>
									</div>
								</div>  	

								<div class="col-md-6">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">palette</i>
										</span>
										<div class="form-line">
											<input type="password" class="form-control date" placeholder="Enter Password" v-model="user.password">
										</div>
									</div>
								</div> 


								<div class="col-md-6">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">palette</i>
										</span>
										<div class="form-line">
											<input type="password" class="form-control date" placeholder="Confirm Password" v-model="user.confirm_password">
										</div>
									</div>
								</div> 		


								<div class="col-md-6">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">palette</i>
										</span>
										<div class="form-line">
										<select class="form-control" v-model="user.role">
											<option value="">Select Role</option>
										</select>
										</div>
									</div>
								</div>        


								</div>

				

					</div>
					<div class="modal-footer">
						<br>
						<button  type="submit" class="btn btn-success waves-effect">SAVE</button>
						<button type="button" class="btn btn-default waves-effect" data-dismiss="modal">CLOSE</button>
					</div>
				</div>
			</form>
			</div>
		</div>

	</div>

</template>

<script>

	import {EventBus} from '../../vue-asset';
	import mixin from '../../mixin';


	export default {
     
      mixins : [mixin],
     
		data(){

			return {

				user : {

					name : '',
					email : '',
					password : '',
					confirm_password : '',
					role : '',

				},

				errors : null 


			}

		},

		methods : {


			createuser(){

				axios.post(base_url+'user',this.user)

				.then(response => {

					$('#create-user').modal('hide');

					this.user = {'name':'','details':''};
					this.errors = null;
					EventBus.$emit('user-created',response.data);

					// this.showMessage(response.data);

					this.successALert(response.data);

				})
				.catch(err => {

					if(err.response){

						this.errors = err.response.data.errors;
					}

				})

			},

		},

  // end of method section 


  created(){


  },




}



</script>