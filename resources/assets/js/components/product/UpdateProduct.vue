<template>

	<div class="col-md-12">
				<div class="modal fade" id="update-product" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="defaultModalLabel">Update product Information</h4>
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
											<select class="form-control" v-model="product.category">
												<option value="">Select Category</option>

												<option v-for="(value,index) in cat" :value="value.id" :selected="product.id === value.id">{{ value.name }}</option>
											</select>
										</div>
									</div>
								</div> 

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
						<button @click="updateProduct(product.id)" type="button" class="btn btn-success waves-effect">Update</button>
						<button @click="closeModal()" type="button" class="btn btn-default waves-effect" data-dismiss="modal">CLOSE</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</template>

<script>

import {EventBus} from '../../vue-asset';

	
export default{

 props:['cat'],	
 
 name : 'update-product',

 data(){
   
   return{
      
      product : {
         
         id : 1,
         name : '',
         details : '',

      },

      errors : null

   }

 },

 created(){

 	let vm = this;

 	EventBus.$on('product-edit',function(id){
    
     vm.product.id = id;

     vm.editProduct(id);

     $('#update-product').modal('show');
     
 	});

 	 $('#update-product').on('hidden.bs.modal', function(){
            vm.closeModal();
            });



 },

 methods : {

 


   editProduct(id){
    
    axios.get(base_url+'product/'+id+'/edit')

     .then(response => {
      
       
       this.product = {
       	id:response.data.id,
       	name:response.data.product_name,
       	details:response.data.details,
       }

     })

   },
    updateProduct(id){
        
        axios.put(base_url+'product/'+id,this.product)
        .then(res => {
         
          if(res.data.status == 'success'){
          
               this.successALert(res.data);
              EventBus.$emit('product-created',1);
              this.closeModal();
              $('#update-product').modal('hide');
            }



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
			},

   closeModal(){

   	this.errors = null;
    this.product = {'id':0,'name':'','details':''};
    EventBus.$emit('product-created',1);
   }			




 }

}	



</script>