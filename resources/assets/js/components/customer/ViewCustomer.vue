<template>
  <div class="wrap">
    <div class="body">
      <div class="row">
        <div class="col-md-4">
          <input
            type="text"
            class="form-control"
            v-on:keyup="getData()"
            placeholder="Serach By Name"
           name=""
            v-model="name"
          >
        </div>
        <div class="col-md-4">
          <input
            type="text"
            class="form-control"
            v-on:keyup="getData()"
            placeholder="Serach By Email"
            name=""
            v-model="email"
           >
        </div>
        <div class="col-md-4">
              <input
            type="text"
            class="form-control"
            v-on:keyup="getData()"
            placeholder="Serach By phone"
            name=""
            v-model="phone"
              >
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
              <th>Purchaced Amount</th>
              <th>Paid Amount</th>
              <th>Due</th>
              <th>Edit</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(value,index) in customers.data" v-bind:key="index">
              <td>{{ value.customer_name }}</td>
              <td>{{ value.email }}</td>
              <td>{{ value.phone }}</td>
              <td>{{ value.address }}</td>
              <td>{{ value.total_amount }}</td>
              <td>{{ value.total_paid_amount }}</td>
              <td>{{ value.total_amount-value.total_paid_amount }}</td>
              <td>
                <button
                  @click="editcustomer(value.id)"
                  type="button"
                  class="btn bg-blue btn-circle waves-effect waves-circle waves-float"
                >
                  <i class="material-icons">edit</i>
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="row">
        <div class="text-center col-md-12" v-if="customers.last_page > 1">
          <ul class="pagination">
            <li :class="[ ((customers.current_page == 1) ? 'disabled' : '') ]">
              <a
                :href="'?page='+customers.current_page"
                @click.prevent="pageClicked(customers.current_page-1)"
                aria-label="Previous"
                v-if="customers.current_page != 1"
              >
                <span aria-hidden="true">«</span>
              </a>
              <a v-else>
                <span aria-hidden="true">«</span>
              </a>
            </li>
            <li
              v-for="pageNo in range(paginateLoop, numberOfPage)"
              :class="[ ((customers.current_page == pageNo) ? 'active' : '') ]"
            >
              <a :href="'?page='+pageNo" @click.prevent="pageClicked(pageNo)">{{ pageNo }}</a>
            </li>
            <li :class="[ ((customers.current_page == customers.last_page) ? 'disabled' : '') ]">
              <a
                :href="'?page='+customers.current_page"
                @click.prevent="pageClicked(customers.current_page+1)"
                aria-label="Next"
                v-if="customers.current_page != customers.last_page"
              >
                <span aria-hidden="true">»</span>
              </a>
              <a v-else>
                <span aria-hidden="true">»</span>
              </a>
            </li>
          </ul>
        </div>
      </div>

      <div class="row">
        <update-customer></update-customer>
      </div>
    </div>
  </div>
</template>

<script>
import { EventBus } from "../../vue-asset";
import mixin from "../../mixin";

import UpdateCustomer from "./UpdateCustomer.vue";

export default {
  mixins: [mixin],

  components: {
    "update-customer": UpdateCustomer
  },

  data() {
    return {
      customers: [],
      name: "",
      email: "",
      phone: ""
    };
  },
  created() {
    var _this = this;
    this.getData();

    EventBus.$on("customer-created", function() {
      _this.getData();
    });
  },

  methods: {
    getData(page = 1) {
      axios
        .get(
          base_url +
            "customer-list?page="+
            page+
            "&name=" +
            this.name +
            "&email=" +
            this.email +
            "&phone=" +
            this.phone
        )
        .then(response => {
          // console.log(response.data);

          this.customers = response.data;
        })
        .catch(error => {
          console.log(error);
        });
    },

    // edit vendor

    editcustomer(id) {
      EventBus.$emit("customer-edit", id);
    },

    showMessage(data) {
      if (data.status == "success") {
        toastr.success(data.message, "Success Alert", { timeOut: 500 });
      } else {
        toastr.error(data.message, "Error Alert", { timeOut: 500 });
      }
    },

    range(start, count) {
      return Array.apply(0, Array(count)).map(function(element, index) {
        return index + start;
      });
    },
    pageClicked(pageNo) {
      var vm = this;
      vm.getData(pageNo);
    }
  },

  computed: {
    paginateLoop() {
      let customers = this.customers;
      if (customers.last_page > 11) {
        if (customers.last_page - 5 <= customers.current_page) {
          return customers.last_page - 10;
        }
        if (customers.current_page > 6) {
          return customers.current_page - 5;
        }
      }
      return 1;
    },
    numberOfPage() {
      if (this.customers.last_page < 11) {
        return this.customers.last_page;
      } else {
        return 11;
      }
    }
  }
};
</script>