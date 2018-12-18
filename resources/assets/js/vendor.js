require('./vue-asset');

Vue.component('vendor-component', require('./components/VendorComponent.vue'));
Vue.component('create-vendor', require('./components/vendor/CreateVendor.vue'));
Vue.component('view-vendor', require('./components/vendor/ViewVendor.vue'));

var app = new Vue({
    el: '#belontory'
});
