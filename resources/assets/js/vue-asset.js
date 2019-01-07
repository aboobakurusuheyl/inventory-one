
window.axios = require('axios');

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';


let token = document.head.querySelector('meta[name="csrf-token"]');

if (token) {
    window.axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content;
} else {
    console.error('CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token');
}

import Swal from 'sweetalert2';

window.Swal = Swal;

// import VueMoment from 'vue-moment';
// Vue.use(VueMoment, {
//     moment,
// })

// import mixin from './mixin.js';

// Vue.mixin(mixin);



window.Vue = require('vue');
export const EventBus = new Vue();