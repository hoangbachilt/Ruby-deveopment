import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import "bootstrap/dist/css/bootstrap.min.css";
import "@/assets/css/main.css";
import axios from "axios";
import i18n from "@/plugins/i18n";
import FlagIcon from "vue-flag-icon";
import paginate from "vuejs-paginate";

axios.defaults.baseURL = process.env.VUE_APP_AXIOS_URL_BASE;
Vue.use(FlagIcon);
Vue.config.productionTip = false;
Vue.component("paginate", paginate);

new Vue({
  router,
  i18n,
  store,
  render: h => h(App)
}).$mount("#app");
