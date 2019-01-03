<template>
         <div class="wrap">
                <div v-if="isActive" class="table-responsive">
                            
                            <table class="table table-condensed table-hover">
                                <thead>
                                    <tr>
                                        <th>Chalan No</th>
                                        <th>Product</th>
                                        <th>Vendor</th>
                                        <th>Entry By</th>
                                        <th>Initial Stock</th>
                                        <th>Current Stock</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(value,index) in chalanStock.data">
                                        <td>{{ value.chalan_no }}</td>
                                        <td>{{ value.product.product_name }}</td>
                                        <td>{{ value.vendor.name }}</td>
                                        <td>{{ value.user.name }}</td>
                                        <td>{{ value.stock_quantity }}</td>
                                        <td>{{ value.current_quantity }}</td>
                                        <td>
                              
                            <!--     <button @click="viewStock(value.product_id)" type="button" class="btn bg-blue btn-circle waves-effect waves-circle waves-float">
                                    <i class="material-icons">remove_red_eye</i>
                                </button>
 -->
                                  <button @click="deleteChalan(value.id)" type="button" class="btn bg-pink btn-circle waves-effect waves-circle waves-float">
                                    <i class="material-icons">delete</i>
                                </button>       

                            </td>
                                    </tr>
                            
                                </tbody>
                            </table>


                   </div>	 
                   </div>	 



</template>



<script>
 
 import {EventBus} from '../../vue-asset'
	
 export default{
   

   data(){

   	 return{
      
      isActive : false,

      product_id : 0,

      chalanStock : [],


      
   	 }


   },

   	created(){

      var vm = this;
       
       EventBus.$on('stock-chalan',function(id){
         

         vm.product_id = id;
         vm.GetChalan(id);
         vm.isActive = true;


         

       });

   	 },

   	 methods : {
        
        GetChalan(product_id){

           axios.get(base_url+'chalan-list/chalan/'+product_id)
           .then(res => {
              
              this.chalanStock = res.data;

           })

        },
        deleteChalan(id){


        }
   	 	
   	 }

 }

</script>