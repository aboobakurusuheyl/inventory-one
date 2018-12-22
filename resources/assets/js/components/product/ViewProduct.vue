<template>
    <div class="wrap">
    <!--    <div class="row">
            
            filtering element 
        </div> -->
              <div class="body">

                <div class="row">
                    <div class="col-md-4">
                        <input type="text" class="form-control" v-on:keyup="getData" placeholder="Serach By Name" name="" v-model="name">
                    </div>
                    <div class="col-md-4">
                    
                    </div>
                    <div class="col-md-4">
                
                    </div>
                </div>

                <div class="table-responsive">
                            
                            <table class="table table-condensed table-hover">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>details</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(value,index) in products.data">
                                        <td>{{ value.product_name }}</td>
                                        <td>{{ value.details }}</td>
                                        <td>
                              
                                <button @click="editProduct(value.id)" type="button" class="btn bg-blue btn-circle waves-effect waves-circle waves-float">
                                    <i class="material-icons">edit</i>
                                </button>

                                  <button @click="deleteProduct(value.id)" type="button" class="btn bg-pink btn-circle waves-effect waves-circle waves-float">
                                    <i class="material-icons">delete</i>
                                </button>       

                            </td>
                                    </tr>
                            
                                </tbody>
                            </table>


                   </div>
                     
                             <div class="row">
            <div class="text-center col-md-12" v-if="products.last_page > 1">
                <ul class="pagination">
                    <li :class="[ ((products.current_page == 1) ? 'disabled' : '') ]">
                         <a :href="'?page='+products.current_page" @click.prevent="pageClicked(products.current_page-1)" aria-label="Previous" v-if="products.current_page != 1">
                             <span aria-hidden="true">«</span>
                         </a>
                        <a v-else>
                            <span  aria-hidden="true">«</span>
                        </a>
                    </li>
                    <li v-for="pageNo in range(paginateLoop, numberOfPage)"
                        :class="[ ((products.current_page == pageNo) ? 'active' : '') ]">
                        <a :href="'?page='+pageNo" @click.prevent="pageClicked(pageNo)">{{ pageNo }}</a>
                    </li>
                    <li :class="[ ((products.current_page == products.last_page) ? 'disabled' : '') ]" >
                        <a  :href="'?page='+products.current_page" @click.prevent="pageClicked(products.current_page+1)" aria-label="Next" v-if="products.current_page != products.last_page">
                            <span aria-hidden="true">»</span>
                        </a>
                        <a v-else>
                            <span  aria-hidden="true">»</span>
                        </a>
                    </li>
                </ul>
            </div>
</div>  


 <div class="row">
    <update-product></update-product>
 </div>



         </div>
    </div>
</template>

<script>
    
    import {EventBus} from '../../vue-asset';

    import UpdateProduct from './UpdateProduct.vue'

    export default{

        components : {
           
            'update-product' : UpdateProduct

        },

        data(){
          
          return {

            products : [],
            name : '',

          }
          

        },
        created(){
          
         var _this = this; 
         this.getData();

        EventBus.$on('product-created', function () {
            window.history.pushState({}, null, location.pathname);
            _this.getData();
        });

        },

        methods : {
        
         getData(page = 1){
          
          axios.get(base_url+"product-list?page="+page+"&name="+this.name)
          .then(response => {
           
           // console.log(response.data);

           this.products = response.data;

          }).catch(error => {

            console.log(error);
          })

         },

         // edit vendor 

         editProduct(id){

           EventBus.$emit('product-edit',id);

         },

        showMessage(data){
            if(data.status == 'success'){
                toastr.success(data.message,'Success Alert',{timeOut:500});
            }else{
                toastr.error(data.message,'Error Alert',{timeOut:500});
            }
        },

         // delete vendor 

         deleteProduct(id){

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

                    axios.delete(base_url+'product/'+id)
                    .then(res => {

                     EventBus.$emit('product-created',1);
                    })

                     Swal(
                         'Deleted!',
                         'Your Product has been deleted.',
                         'success'
                         )
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
                let products = this.products;
                if(products.last_page > 11){
                    if((products.last_page - 5) <= products.current_page){
                        return products.last_page - 10;
                    }
                    if(products.current_page > 6){
                        return products.current_page - 5;
                    }
                }
                return 1;
            },
            numberOfPage(){
                if(this.products.last_page < 11){
                    return this.products.last_page;
                }else{
                    return 11;
                }
            }


        }
         
    }
        
        
        
        

</script>