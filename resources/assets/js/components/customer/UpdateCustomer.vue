<template>
  <div class="wrap">
    <div class="modal fade" id="update-customer" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="defaultModalLabel">Add Customer</h4>
          </div>
          <div class="modal-body">
            <div class="alert alert-danger" v-if="errors">
              <ul>
                <li v-for="error in errors">{{ error[0] }}</li>
              </ul>
            </div>
            <form>
              <div class="row">
                <div class="col-md-6">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">account_circle</i>
                    </span>
                    <div class="form-line">
                      <input
                        type="text"
                        class="form-control date"
                        placeholder="Customer Name"
                        v-model="customer.customer_name"
                      >
                    </div>
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">email</i>
                    </span>
                    <div class="form-line">
                      <input
                        type="text"
                        class="form-control date"
                        placeholder="Customer Email"
                        v-model="customer.email"
                      >
                    </div>
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">phone</i>
                    </span>
                    <div class="form-line">
                      <input
                        type="text"
                        class="form-control date"
                        placeholder="Customer Phone"
                        v-model="customer.phone"
                      >
                    </div>
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">note</i>
                    </span>
                    <div class="form-line">
                      <textarea
                        rows="1"
                        class="form-control no-resize auto-growth"
                        placeholder="Customer Address"
                        v-model="customer.address"
                      ></textarea>
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <br>
            <button @click="updateCustomer" type="button" class="btn btn-success waves-effect">update</button>
            <button  @click="resetForm()" type="button" class="btn btn-default waves-effect" data-dismiss="modal">CLOSE</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { EventBus } from "../../vue-asset";
import mixin from "../../mixin";

export default {
  name : 'update-customer',  
  mixins: [mixin],

  data() {
    return {
      customer: {
        id : "",  
        customer_name: "",
        email: "",
        phone: "",
        address: ""
      },

      errors: null
    };
  },

  
  created(){

      var _this = this;
       
     EventBus.$on('customer-edit',function(id){
       
       _this.customer.id = id;

       _this.getEditData(id);

       $('#update-customer').modal('show');


 
     });

      $('#update-customer').on('hidden.bs.modal', function(){
            _this.resetForm();
        });

  },

  methods: {
    
    getEditData(id){
     
     axios.get(base_url+'customer/'+id+'/edit')

     .then(response => {
      
       
           this.customer = {
            id : response.data.id,   
            customer_name: response.data.customer_name,
            email: response.data.email,
            phone: response.data.phone,
            address: response.data.address,
          };

     })

    },

    updateCustomer() {
        axios.post(base_url + "customer/update/"+this.customer.id, this.customer)

        .then(response => {
          $("#update-customer").modal("hide");
          this.resetForm();
          EventBus.$emit("customer-created",1);
          this.successALert(response.data);
        })
        .catch(err => {
          if (err.response) {
            this.errors = err.response.data.errors;
          }
        });
    },

     resetForm(){
    
          this.customer = {
            id: '',
            customer_name: '',
            email: '',
            phone: '',
            address: '',
          };
          this.errors = null; 

  },

  },

 

  // end of method section

};
</script>