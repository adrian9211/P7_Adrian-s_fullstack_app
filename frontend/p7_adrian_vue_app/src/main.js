import Vue from "vue";
import VueRouter from "vue-router";

import App from "./App.vue";
import Create from "./components/AddProduct.vue";
import Edit from "./components/EditProduct.vue";
import Index from "./components/ProductList.vue";

import { BootstrapVue, IconsPlugin } from "bootstrap-vue";

// Import Bootstrap an BootstrapVue CSS files (order is important)
import "bootstrap/dist/css/bootstrap.css";
import "bootstrap-vue/dist/bootstrap-vue.css";

// Make BootstrapVue available throughout your project
Vue.use(BootstrapVue);
// Optionally install the BootstrapVue icon components plugin
Vue.use(IconsPlugin);

Vue.use(VueRouter);

Vue.config.productionTip = false;

const routes = [
  {
    name: "Create",
    path: "/create",
    component: Create
  },
  {
    name: "Edit",
    path: "/edit/:id",
    component: Edit
  },
  {
    name: "Index",
    path: "/",
    component: Index
  }
];

const router = new VueRouter({ mode: "history", routes: routes });

new Vue({
  // init router
  router,
  render: h => h(App)
}).$mount("#app");
