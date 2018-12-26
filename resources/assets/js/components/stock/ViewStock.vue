<template>
    <div class="wrap">
    <!--    <div class="row">
            
            filtering element 
        </div> -->
              <div class="body">

                <div class="row">
                    <div class="col-md-4">
                     	<select class="form-control show-tick" data-live-serach="true" @change="getData(1)" v-model="product">
								<option value="">Filter By Product</option>

							 <option v-for="(vd,index) in products" :value="vd.id">{{ vd.product_name  }}</option>
						</select>
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
                                        <th>Product Name</th>
                                        <th>Initial Stock</th>
                                        <th>Current Stock</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(value,index) in stocks.data">
                                        <td>{{ value.product.product_name }}</td>
                                        <td>{{ value.stock_quantity }}</td>
                                        <td>{{ value.current_quantity }}</td>
                                        <td>
                              
                                <button @click="viewStock(value.product_id)" type="button" class="btn bg-blue btn-circle waves-effect waves-circle waves-float">
                                    <i class="material-icons">remove_red_eye</i>
                                </button>

                                  <button @click="deleteStock(value.product_id)" type="button" class="btn bg-pink btn-circle waves-effect waves-circle waves-float">
                                    <i class="material-icons">delete</i>
                                </button>       

                            </td>
                                    </tr>
                            
                                </tbody>
                            </table>


                   </div>
                     
                             <div class="row">
            <div class="text-center col-md-12" v-if="stocks.last_page > 1">
                <ul class="pagination">
                    <li :class="[ ((stocks.current_page == 1) ? 'disabled' : '') ]">
                         <a :href="'?page='+stocks.current_page" @click.prevent="pageClicked(stocks.current_page-1)" aria-label="Previous" v-if="stocks.current_page != 1">
                             <span aria-hidden="true">«</span>
                         </a>
                        <a v-else>
                            <span  aria-hidden="true">«</span>
                        </a>
                    </li>
                    <li v-for="pageNo in range(paginateLoop, numberOfPage)"
                        :class="[ ((stocks.current_page == pageNo) ? 'active' : '') ]">
                        <a :href="'?page='+pageNo" @click.prevent="pageClicked(pageNo)">{{ pageNo }}</a>
                    </li>
                    <li :class="[ ((stocks.current_page == stocks.last_page) ? 'disabled' : '') ]" >
                        <a  :href="'?page='+stocks.current_page" @click.prevent="pageClicked(stocks.current_page+1)" aria-label="Next" v-if="stocks.current_page != stocks.last_page">
                            <span aria-hidden="true">»</span>
                        </a>
                        <a v-else>
                            <span  aria-hidden="true">»</span>
                        </a>
                    </li>
                </ul>
            </div>
</div>  


<!--  <div class="row">
    <update-product></update-product>
 </div> -->



         </div>
    </div>
</template>

<script>
    
    import {EventBus} from '../../vue-asset';

    // import UpdateProduct from './UpdateProduct.vue'

    export default{

    	props:['products'],

        // components : {
           
        //     'update-product' : UpdateProduct

        // },

        data(){
          
          return {

            stocks : [],
            name : '',
            product: '',

          }
          

        },
        created(){
          
         var _this = this; 
         this.getData();

        EventBus.$on('stock-created', function () {
            window.history.pushState({}, null, location.pathname);
            _this.getData();
        });

        },

        methods : {
        
         getData(page = 1){
          
          axios.get(base_url+"stock-list?page="+page+"&product="+this.product)
          .then(response => {
           
           // console.log(response.data);

           this.stocks = response.data;

          }).catch(error => {

            console.log(error);
          })

         },

         // edit vendor 

         ViewStock(id){

           EventBus.$emit('stock-view',id);

         },

        showMessage(data){
            if(data.status == 'success'){
                toastr.success(data.message,'Success Alert',{timeOut:500});
            }else{
                toastr.error(data.message,'Error Alert',{timeOut:500});
            }
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

         // delete vendor 

         deleteStock(id){

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

                    axios.delete(base_url+'stock/'+id)
                    .then(res => {

                     EventBus.$emit('stock-created',1);
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
                let stocks = this.stocks;
                if(stocks.last_page > 11){
                    if((stocks.last_page - 5) <= stocks.current_page){
                        return stocks.last_page - 10;
                    }
                    if(stocks.current_page > 6){
                        return stocks.current_page - 5;
                    }
                }
                return 1;
            },
            numberOfPage(){
                if(this.stocks.last_page < 11){
                    return this.stocks.last_page;
                }else{
                    return 11;
                }
            }


        }
         
    }
        
        
        
        

</script>