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
                     
         <pagination :pageData="vendors"></pagination> 


 <div class="row">
    <update-vendor></update-vendor>
 </div>



         </div>
    </div>
</template>

<script>
    
    import {EventBus} from '../../vue-asset';

    import mixin from '../../mixin';

    import UpdateVendor from './UpdateVendor.vue';

    import Pagination from '../pagination/pagination.vue';



    export default{

        mixins : [mixin],

        components : {
           
            'update-vendor' : UpdateVendor,
            'pagination' : Pagination,

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

                    axios.get(base_url+'supplier/delete/'+id)
                    .then(res => {

                     EventBus.$emit('vendor-created',1);
                     this.successALert(res.data);
                    })

                 
                 }
             })       
            
         },

          pageClicked(pageNo){
                var vm = this;
                vm.getData(pageNo);
            },

        },

        computed: {

        }
         
    }
        
        
        
        

</script>