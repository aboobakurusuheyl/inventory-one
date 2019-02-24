<template>
  <div class="wrap">

    <div class="body">
      <div class="row">
        <div class="col-md-4">
          <input
            type="text"
            class="form-control"
            v-on:keyup="getData"
            placeholder="Serach By Name"
            name
            v-model="name"
          >
        </div>
        <div class="col-md-4">
          <input
            type="text"
            class="form-control"
            v-on:keyup="getData"
            placeholder="Serach By Email"
            name
            v-model="email"
          >
        </div>
        <div class="col-md-4"></div>
      </div>

      <div class="table-responsive">
        <table class="table table-condensed table-hover">
          <thead>
            <tr>
              <th>Name</th>
              <th>Email</th>
              <th>Role</th>
              <th>Edit</th>
              <th>Delete</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(value,index) in users.data" v-bind:key="index">
              <td>{{ value.name }}</td>
              <td>{{ value.email }}</td>
              <td>{{ value.role.role_name }}</td>
              <td>
                <button
                  @click="editUser(value.id)"
                  type="button"
                  class="btn bg-blue btn-circle waves-effect waves-circle waves-float"
                >
                  <i class="material-icons">edit</i>
                </button>
              </td>

              <td>
                <button
                  @click="deleteUser(value.id)"
                  type="button"
                  class="btn bg-pink btn-circle waves-effect waves-circle waves-float"
                >
                  <i class="material-icons">delete</i>
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="row">
        <div class="text-center col-md-12" v-if="users.last_page > 1">
          <ul class="pagination">
            <li :class="[ ((users.current_page == 1) ? 'disabled' : '') ]">
              <a
                :href="'?page='+users.current_page"
                @click.prevent="pageClicked(users.current_page-1)"
                aria-label="Previous"
                v-if="users.current_page != 1"
              >
                <span aria-hidden="true">«</span>
              </a>
              <a v-else>
                <span aria-hidden="true">«</span>
              </a>
            </li>
            <li
              v-for="pageNo in range(paginateLoop, numberOfPage)"
              :class="[ ((users.current_page == pageNo) ? 'active' : '') ]"
            >
              <a :href="'?page='+pageNo" @click.prevent="pageClicked(pageNo)">{{ pageNo }}</a>
            </li>
            <li :class="[ ((users.current_page == users.last_page) ? 'disabled' : '') ]">
              <a
                :href="'?page='+users.current_page"
                @click.prevent="pageClicked(users.current_page+1)"
                aria-label="Next"
                v-if="users.current_page != users.last_page"
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
        <update-user></update-user>
      </div>
    </div>
  </div>
</template>

<script>
import { EventBus } from "../../vue-asset";
import mixin from "../../mixin";

import UpdateUser from "./UpdateUser.vue";

export default {
  mixins: [mixin],

  components: {
    "update-user": UpdateUser
  },

  data() {
    return {
      users: [],
      name: "",
      email: ""
    };
  },
  created() {
    var _this = this;
    this.getData();

    EventBus.$on("user-created", function() {
      _this.getData();
    });
  },

  methods: {
    getData(page = 1) {
      axios
        .get(
          base_url +
            "user-list?page=" +
            page +
            "&name=" +
            this.name +
            "&email=" +
            this.email
        )
        .then(response => {
          this.users = response.data;
        })
        .catch(error => {
          console.log(error);
        });
    },

    // edit vendor

    editUser(id) {
      EventBus.$emit("user-edit", id);
    },

    // delete user

    deleteUser(id) {
      Swal(
        {
          title: "Are you sure?",
          text: "You won't be able to revert this!",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Yes, delete it!"
        },
        () => {}
      ).then(result => {
        if (result.value) {
          axios.delete(base_url + "user/" + id).then(res => {
            EventBus.$emit("user-created", 1);
            this.successAlert(res.data);
          });
        }
      });
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
      let users = this.users;
      if (users.last_page > 11) {
        if (users.last_page - 5 <= users.current_page) {
          return users.last_page - 10;
        }
        if (users.current_page > 6) {
          return users.current_page - 5;
        }
      }
      return 1;
    },
    numberOfPage() {
      if (this.users.last_page < 11) {
        return this.users.last_page;
      } else {
        return 11;
      }
    }
  }
};
</script>