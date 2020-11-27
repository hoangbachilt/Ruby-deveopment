import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);
const state = {};

const getters = {
  isAuthenticated: state => !!state.token,
  authStatus: state => state.status
};

export default new Vuex.Store({
  state,
  getters
});
