<template>
  <div id="users">
    <div v-for="user in users" :key="user.id">
      <p>{{user.name}} is my {{user.name}}</p>
    </div>
  </div>
</template>
<script>
import axios from "axios";
export default {
  data() {
    return {
      users: [],
      name: [],
      errors: []
    };
  },
  created() {
    axios
      .get("http://localhost:3000/users")
      .then(response => {
        this.users = response.data;
      })
      .catch(e => {
        this.error.push(e);
      });
  }
};
</script>
