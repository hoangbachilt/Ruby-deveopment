<template>
  <div class="container">
    <div class="row">
      <div v-for="folder in folders" :key="folder.id" class="col-sm">
        <router-link :to="{ name: 'folder', params: { id: folder.id } }">{{
          folder.name
        }}</router-link>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import authHeader from "@/services/auth-header";

export default {
  data() {
    return {
      folders: [],
      errors: []
    };
  },
  created() {
    axios
      .get("/folders", { headers: authHeader() })
      .then(response => {
        this.folders = response.data;
      })
      .catch(e => {
        this.errors.push(e);
      });
  }
};
</script>
