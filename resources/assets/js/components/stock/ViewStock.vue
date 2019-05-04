<template>
    <div class="wrap">
    <!--    <div class="row">
            
            filtering element 
        </div> -->
              <div class="body">

              	 <div class="row">
                  <edit-stock :categorys="categorys" :vendors="vendors"></edit-stock>
                  <update-qty></update-qty>
                  </div>

                <div class="row">
                    <div class="col-md-4">
                     	<select class="form-control select2"
                          data-live-serach="true"
                           @change="getProduct()"    
                           v-model="category"
                           v-select="category"
                           >
								<option value="">All Category</option>

							 <option v-for="(cat,index) in categorys" :value="cat.id">{{ cat.name  }}</option>
						</select>
                    </div>
                    <div class="col-md-4">
                      <select class="form-control select2"
                       data-live-serach="true"
                        @change="getData(1)"
                         v-model="product"
                         v-select="product"
                         >
                                <option value="">All Product</option>

                             <option v-for="(pd,index) in products" :value="pd.id">{{ pd.product_name  }}</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                          <select class="form-control select2"
                           data-live-serach="true"
                            @change="getData(1)"
                             v-model="vendor"
                             v-select="vendor"
                             >
                                <option value="">All Vendor</option>

                             <option v-for="(vd,index) in vendors" :value="vd.id">{{ vd.name  }}</option>
                        </select>
                    </div>

                

                </div>

                <div class="loading" v-if="isLoading">
                    <h2 style="text-align:center">Loading.......</h2>
                </div>

                <div class="table-responsive" v-else>
                            
                            <table class="table table-condensed table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Vendor</th>
                                        <th>Chalan</th>
                                        <th>Initial Stock</th>
                                        <th>Current Stock</th>
                                        <th>Buying Price</th>
                                        <th>Selling Price</th>
                                        <th>Entry By</th>
                                        <th>Entry Date</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(value,index) in stocks.data">
                                        <td>{{ value.product.product_name }}</td>
                                        <td>{{ value.vendor.name }}</td>
                                        <td>{{ value.chalan_no }}</td>
                                        <td>{{ value.stock_quantity }}</td>
                                        <td>{{ value.stock_quantity-value.sold_qty }}</td>
                                        <td>{{ value.buying_price }}</td>
                                        <td>{{ value.selling_price }}</td>
                                        <td>{{ value.user.name }}</td>
                                        <td>{{ value.created_at | moment('LL') }}</td>         
                                        <td>
                              
                                <button @click="editQty(value.id,value.category_id)" type="button" class="btn bg-blue btn-circle waves-effect waves-circle waves-float">
                                    <i class="material-icons">add</i>
                                </button>   

                                <button @click="editStock(value.id,value.category_id)" type="button" class="btn bg-blue btn-circle waves-effect waves-circle waves-float">
                                    <i class="material-icons">edit</i>
                                </button>

                                  <button @click="deleteStock(value.id)" type="button" class="btn bg-pink btn-circle waves-effect waves-circle waves-float">
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






         </div>
    </div>
</template>

<script>
    
    import {EventBus} from '../../vue-asset';
    import mixin from '../../mixin.js';
    import MomentMixin from '../../moment_mixin.js';

    import editStock from './editStock.vue';
    import UpdateQuantity from './UpdateQuantity.vue';
    

    export default{

    	props:['categorys','vendors'],

        mixins:[mixin,MomentMixin],

        components : {
           
            'edit-stock' : editStock,
            'update-qty' : UpdateQuantity,

        },

        data(){
          
          return {

            stocks : [],
            name : '',
            product: '',
            category: '',
            vendor: '',
            products : [],
            isLoading : true,

          }
          

        },
        created(){


           // this.hello();
          
         var _this = this; 
         this.getData();

        EventBus.$on('stock-created', function () {
            window.history.pushState({}, null, location.pathname);
            _this.getData();
        });

        },

        methods : {
        
         getData(page = 1){
          this.isLoading = true;
          axios.get(base_url+"stock-list?page="+page+"&product="+this.product+"&category="+this.category+"&vendor="+this.vendor)
          .then(response => {
           
           // console.log(response.data);

           this.stocks = response.data;
           this.isLoading = false;

          }).catch(error => {

            console.log(error);
          })

         },


         getProduct(){
           
              if(this.category === ''){

               this.products = [];

                this.product = '';

                }
                else{
              this.products = [];
               axios.get(base_url+'category/product/'+this.category)
              .then(response => {
               
                this.products = response.data;

              })

                }

            this.getData(1);    
         },

         // edit vendor 

        editStock(id,category_id){

           EventBus.$emit('edit-stock',id,category_id);

         },

         editQty(id){

           EventBus.$emit('edit-qty',id);

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
                      
                      this.successALert(res.data);

                    })

              
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


        },


         
    }
        
        
        
        

</script>