
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
        <div class="col-md-4"></div>
        <div class="col-md-4"></div>
      </div>
     <div class="row" v-if="isLoading">
      <h2 style="text-align:center">Loading......</h2>
     </div>
      <div class="table-responsive"  v-else>
        <table class="table table-condensed table-hover">
          <thead>
            <tr>
              <th>Name</th>
              <th>Edit</th>
              <th>Delete</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(value,index) in categorys.data">
              <td>{{ value.name }}</td>
              <td>
                <button
                  @click="editCategory(value.id)"
                  type="button"
                  class="btn bg-blue btn-circle waves-effect waves-circle waves-float"
                >
                  <i class="material-icons">edit</i>
                </button>
              </td>

              <td>
                <button
                  @click="deleteCategory(value.id)"
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
        <div class="text-center col-md-12" v-if="categorys.last_page > 1">
          <ul class="pagination">
            <li :class="[ ((categorys.current_page == 1) ? 'disabled' : '') ]">
              <a
                :href="'?page='+categorys.current_page"
                @click.prevent="pageClicked(categorys.current_page-1)"
                aria-label="Previous"
                v-if="categorys.current_page != 1"
              >
                <span aria-hidden="true">«</span>
              </a>
              <a v-else>
                <span aria-hidden="true">«</span>
              </a>
            </li>
            <li
              v-for="pageNo in range(paginateLoop, numberOfPage)"
              :class="[ ((categorys.current_page == pageNo) ? 'active' : '') ]"
            >
              <a :href="'?page='+pageNo" @click.prevent="pageClicked(pageNo)">{{ pageNo }}</a>
            </li>
            <li :class="[ ((categorys.current_page == categorys.last_page) ? 'disabled' : '') ]">
              <a
                :href="'?page='+categorys.current_page"
                @click.prevent="pageClicked(categorys.current_page+1)"
                aria-label="Next"
                v-if="categorys.current_page != categorys.last_page"
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
        <update-category></update-category>
      </div>
    </div>
  </div>
</template>

<script>
import { EventBus } from "../../vue-asset";
import mixin from "../../mixin";

import Updatecategory from "./Updatecategory.vue";

export default {
  mixins: [mixin],

  components: {
    "update-category": Updatecategory
  },

  data() {
    return {
      categorys: [],
      name: "",
      isLoading: true,
    };
  },
  created() {
    var _this = this;
    this.getData();

    EventBus.$on("category-created", function() {
      window.history.pushState({}, null, location.pathname);
      _this.getData();
    });
  },

  methods: {
    getData(page = 1) {
		this.isLoading = true;
      axios.get(base_url + "category-list?page=" + page + "&name=" + this.name)
        .then(response => {
		  this.categorys = response.data;
		  this.isLoading = false;
		  
        })
        .catch(error => {
          console.log(error);
        });
    },

    // edit vendor

    editCategory(id) {
      EventBus.$emit("category-edit", id);
    },

    showMessage(data) {
      if (data.status == "success") {
        toastr.success(data.message, "Success Alert", { timeOut: 500 });
      } else {
        toastr.error(data.message, "Error Alert", { timeOut: 500 });
      }
    },

    // delete vendor

    deleteCategory(id) {
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
          axios.delete(base_url + "category/" + id).then(res => {
            EventBus.$emit("category-created", 1);
            this.successALert(res.data);
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
      let categorys = this.categorys;
      if (categorys.last_page > 11) {
        if (categorys.last_page - 5 <= categorys.current_page) {
          return categorys.last_page - 10;
        }
        if (categorys.current_page > 6) {
          return categorys.current_page - 5;
        }
      }
      return 1;
    },
    numberOfPage() {
      if (this.categorys.last_page < 11) {
        return this.categorys.last_page;
      } else {
        return 11;
      }
    }
  }
};
</script>