// import {EventBus} from './vue-asset';
import moment from 'moment';
export default{


   created(){
     
     // this.hello();

   },

   methods : {

  
   },

 filters: {
  moment: function (date,format) {
    return moment(date).format(format);
  }

},






}