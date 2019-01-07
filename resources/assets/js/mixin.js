// import {EventBus} from './vue-asset';
import moment from 'moment';
export default{


   created(){
     
     // this.hello();

   },

   methods : {

   
      successALert(data){
           
           console.log(data)
				Swal({
					position: 'top-end',
					type: data.status,
					title: data.message,
					showConfirmButton: false,
					timer: 1500
				})
			},
   },

 filters: {
  moment: function (date,format) {
    return moment(date).format(format);
  }
}

}