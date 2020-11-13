<template>
  <div class="container">
    <div class="row">
      <div v-for="image_url in image_urls" :key="image_url" class="col-sm">
        <img class="image" :src="image_url" />
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
      id: this.$route.params.id,
      image_urls: [],
      errors: []
    };
  },
  created() {
    axios
      .get(`/folders/${this.id}`, { headers: authHeader() })
      .then(response => {
        this.image_urls = response.data;
      })
      .catch(e => {
        this.errors.push(e);
      });
  }
};
</script>

<style lang="scss">
.image {
  width: 150px;
  heigh: 150px;
}
</style>
