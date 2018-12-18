<template>
  <div class="container">
    <div class="row">
      <div class="col-md-8 mr-auto ml-auto">
        <h3>All Data</h3>
       <ul class="list-group">
        <li v-for="data in json_d" class="list-group-item">{{ data.title }}</li>
      </ul>
    </div>
  </div>
</div>
</template>

<script>
import {EventBus} from '../vue-asset';
export default {

  data(){

   return { 

     name : 'shakhawat hossain sabbir',

     json_d : []

   }

 },

 created(){

   this.getData()

 },

 methods : {


   getData(){

     axios.get('https://jsonplaceholder.typicode.com/todos')
     .then(response => 

      this.json_d = response.data


      ).catch(err  => 

      console.log(err)
      )

    }


  }


}
</script>
