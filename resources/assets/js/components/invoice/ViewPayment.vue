<template>
	<div class="row">
		
	</div>
</template>

<script>

    import {EventBus} from '../../vue-asset';
    import mixin from '../../mixin.js';
export default{
    
    name : 'view-payment',
    mixins : [mixin],

	data(){

		return { 
           
			payments : [],
		}
	},

	created(){
     
    var  _this = this;

     EventBus.$on('view-payment',function(id){

       _this.getPayment(id);

     });
      
	},

	methods : {
     
     getPayment(id){

       axios.get(base_url+'payment/'+id)
       .then(response => {
            
         this.payments = response.data;  

       })

       .catch(error => {
        
        console.log(error);

       });	


     }

	}



}	

</script>