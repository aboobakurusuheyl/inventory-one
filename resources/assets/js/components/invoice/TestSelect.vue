
<div id="app">
  <div>{{ $data.optionArr }}</div>
  <template v-for="(user_option,index) in optionArr">
  <select2 class="applySelect2" v-bind:id="'opt_select_'+index" on-change="print" v-model="user_option.id">
      <template v-for="option in options">
        <option v-bind:value="option.id">{{option.value}}</option>
      </template>
  </select2> <input type="text" v-model="user_option.price"> <span style="cursor:pointer;color:red;" v-on:click="deleteOption(index)">delete</span><br/>
  </template><br/>
  <div><span style="cursor:pointer;" v-on:click="addOption">+add options</span></div>
  <br/>
  <div><span style="cursor:pointer;" v-on:click="getAll">Get All</span></div>
</div>
<script type="text/x-template" id="select2-template">
  <select>
    <slot></slot>
  </select>
</script>
<script>
Vue.component('select2', {
  props: ['options', 'value'],
  template: '#select2-template',
  mounted: function () {
    var vm = this
    $(this.$el)
      .val(this.value)
      // init select2
      .select2({ data: this.options })
      // emit event on change.
      .on('change', function () {
        vm.$emit('input', this.value)
      })
  },
  watch: {
    value: function (value) {
      // update value
      $(this.$el).val(value)
    },
    options: function (options) {
      // update options
      $(this.$el).select2({ data: options })
    }
  },
  destroyed: function () {
    $(this.$el).off().select2('destroy')
  }
})

var vm = new Vue({
  el: "#app",
  data: {
    optionArr: [{id:1,price:100},{id:2,price:200}],
  	options: [{id:1,value:'option1'},{id:2,value:'option2'},{id:3,value:'option3'}]
  },
  mounted() {
  	console.log("help!!!!");
  	$("#opt_select_0,#opt_select_1").select2();
  },
  methods: {
  	addOption: function(){
    	var index = Object.keys(this.optionArr).length;
    	this.optionArr.push({id:'',price:''});
      setTimeout(function(){
        $("#opt_select_"+index).select2();
      },100);      
    },
    deleteOption: function(index){
    	this.optionArr.splice(index, 1);
    },
    getAll: function(){
    	console.log(this.optionArr);
    }
  }
});


</script>