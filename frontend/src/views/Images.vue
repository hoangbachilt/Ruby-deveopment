<template>
  <button @click="upLoad">{{ $t("btn_upload") }}</button>
</template>

<script>
import router from "../router/index.js";

export default {
  methods: {
    upLoad() {
      router.push("Upload");
    }
  }
};
</script>
