<template>
  <div id="transaction">
    <table class="table">
      <tr>
        <th>ID</th>
        <th>Login Time</th>
        <th>Logout Time</th>
      </tr>
      <tr v-for="(transaction, index) in transactions" :key="index">
        <td>{{ index + 1 }}</td>
        <td>{{ transaction.login_time }}</td>
        <td>{{ transaction.logout_time }}</td>
      </tr>
    </table>

    <button
      type="button"
      class="button button-brand btn-lg mb-5 mb-lg-2"
      @click="
        update(id);
        logout();
      "
    >
      logout
    </button>
  </div>
</template>
<script>
import axios from "axios";
import router from "../router";
import authHeader from "@/services/auth-header";
export default {
  data() {
    return {
      transactions: [],
      token: "",
      id: "",
      errors: []
    };
  },
  created() {
    axios
      .get("/transactions", { headers: authHeader() })
      .then(response => {
        this.transactions = response.data;
        this.id = response.data.slice(-1)[0].id;
      })
      .catch(e => {
        this.errors.push(e);
      });
  },
  methods: {
    update(id) {
      axios.put(`/transactions/${id}`, {},{ headers: authHeader() });
    },
    logout() {
      localStorage.removeItem("token");
      router.push("login");
    }
  }
};
</script>
