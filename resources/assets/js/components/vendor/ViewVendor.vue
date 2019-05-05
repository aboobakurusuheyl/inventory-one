<template>
    <div class="wrap">
    <!--    <div class="row">
            
            filtering element 
        </div> -->
              <div class="body">

                <div class="row">
                    <div class="col-md-4">
                        <input type="text" class="form-control" v-on:keyup="getData" placeholder="Name" name="" v-model="name">
                    </div>
                    <div class="col-md-4">
                        <input type="text" class="form-control" v-on:keyup="getData" placeholder="Email" name="" v-model="email">
                    </div>
                    <div class="col-md-4">
                        <input type="text" class="form-control" v-on:keyup="getData" placeholder="Phone" name="" v-model="phone">
                    </div>
                </div>

                <div class="table-responsive">
                            
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
                                    <tr v-for="(value,index) in vendors.data">
                                        <td>{{ value.name }}</td>
                                        <td>{{ value.email }}</td>
                                        <td>{{ value.phone }}</td>
                                        <td>{{ value.address }}</td>
                                        <td>
                              
                                <button @click="editVendor(value.id)" type="button" class="btn bg-blue btn-circle waves-effect waves-circle waves-float">
                                    <i class="material-icons">edit</i>
                                </button>

                                  <button @click="deleteVendor(value.id)" type="button" class="btn bg-pink btn-circle waves-effect waves-circle waves-float">
                                    <i class="material-icons">delete</i>
                                </button>       

                            </td>
                                    </tr>
                            
                                </tbody>
                            </table>


                   </div>
                     
                             <div class="row">
            <div class="text-center col-md-12" v-if="vendors.last_page > 1">
                <ul class="pagination">
                    <li :class="[ ((vendors.current_page == 1) ? 'disabled' : '') ]">
                         <a :href="'?page='+vendors.current_page" @click.prevent="pageClicked(vendors.current_page-1)" aria-label="Previous" v-if="vendors.current_page != 1">
                             <span aria-hidden="true">«</span>
                         </a>
                        <a v-else>
                            <span  aria-hidden="true">«</span>
                        </a>
                    </li>
                    <li v-for="pageNo in range(paginateLoop, numberOfPage)"
                        :class="[ ((vendors.current_page == pageNo) ? 'active' : '') ]">
                        <a :href="'?page='+pageNo" @click.prevent="pageClicked(pageNo)">{{ pageNo }}</a>
                    </li>
                    <li :class="[ ((vendors.current_page == vendors.last_page) ? 'disabled' : '') ]" >
                        <a  :href="'?page='+vendors.current_page" @click.prevent="pageClicked(vendors.current_page+1)" aria-label="Next" v-if="vendors.current_page != vendors.last_page">
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
    <update-vendor></update-vendor>
 </div>



         </div>
    </div>
</template>

<script>
    
    import {EventBus} from '../../vue-asset';

    import mixin from '../../mixin';

    import UpdateVendor from './UpdateVendor.vue'



    export default{

        mixins : [mixin],

        components : {
           
            'update-vendor' : UpdateVendor

        },

        data(){
          
          return {

            vendors : [],
            name : '',
            email : '',
            phone : '',

          }
          

        },
        created(){
          
         var _this = this; 
         this.getData();

        EventBus.$on('vendor-created', function () {
            window.history.pushState({}, null, location.pathname);
            _this.getData();
        });

        },

        methods : {
        
         getData(page = 1){
          
          axios.get(base_url+"vendor-list?page="+page+"&name="+this.name+"&email="+this.email+"&phone="+this.phone)
          .then(response => {
           
           // console.log(response.data);

           this.vendors = response.data;

          }).catch(error => {

            console.log(error);
          })

         },

         // edit vendor 

         editVendor(id){

           EventBus.$emit('vendor-edit',id);

         },

  

         // delete vendor 

         deleteVendor(id){

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

                    axios.delete(base_url+'supplier/'+id)
                    .then(res => {

                     EventBus.$emit('vendor-created',1);
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
                let vendors = this.vendors;
                if(vendors.last_page > 11){
                    if((vendors.last_page - 5) <= vendors.current_page){
                        return vendors.last_page - 10;
                    }
                    if(vendors.current_page > 6){
                        return vendors.current_page - 5;
                    }
                }
                return 1;
            },
            numberOfPage(){
                if(this.vendors.last_page < 11){
                    return this.vendors.last_page;
                }else{
                    return 11;
                }
            }


        }
         
    }
        
        
        
        

</script>