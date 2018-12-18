<template>
	<div class="wrap">
	<!-- 	<div class="row">
			
			filtering element 
		</div> -->
		      <div class="body table-responsive">
                        	
                            <table class="table table-condensed table-hover">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Address</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="vendor in vendors">
                                        <td>{{ vendor.name }}</td>
                                        <td>{{ vendor.email }}</td>
                                        <td>{{ vendor.phone }}</td>
                                        <td>{{ vendor.address }}</td>
                                        <td>
                                        	<button type="button" class="btn bg-pink btn-circle waves-effect waves-circle waves-float">
                                    <i class="material-icons">delete</i>
                                </button>     	

                                <button type="button" class="btn bg-blue btn-circle waves-effect waves-circle waves-float">
                                    <i class="material-icons">edit</i>
                                </button>
                            </td>
                                    </tr>
                            
                                </tbody>
                            </table>
                        </div>
	</div>
</template>

<script>
	
	import {EventBus} from '../../vue-asset';

	export default{

        data(){
          
          return {

            vendors : []

          }
          

        },
        created(){
          
         this.getData();

        },

        methods : {
        
         getData(){
          
          axios.get(base_url+'vendor-list')
          .then(response => {
           
           // console.log(response.data);

           this.vendors = response.data;

          }).catch(error => {

          	console.log(error);
          })

         }

        }
         
	}
        
        
        

</script>