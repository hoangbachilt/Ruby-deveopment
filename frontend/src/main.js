  import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import axios from "axios";
import i18n from "@/plugins/i18n";
import FlagIcon from "vue-flag-icon";

axios.defaults.baseURL = process.env.AXIOS_URL_BASE

Vue.use(FlagIcon);
Vue.config.productionTip = false;

new Vue({
  router,
  i18n,
  store,
  render: h => h(App)
}).$mount("#app");
