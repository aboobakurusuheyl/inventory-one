require('./vue-asset');
Vue.component('create-product', require('./components/product/CreateProduct.vue'));
Vue.component('view-product', require('./components/product/ViewProduct.vue'));

// select change 

// Vue.directive('select', {
//     twoWay: true,
//     bind: function (el, binding, vnode) {
//       $(el).select2().on("select2:select", (e) => {
//         // v-model looks for
//         //  - an event named "change"
//         //  - a value with property path "$event.target.value"
//         el.dispatchEvent(new Event('change', { target: e.target }));
//       });
//     },
//   });

var app = new Vue({

    el: '#belontory'
});
