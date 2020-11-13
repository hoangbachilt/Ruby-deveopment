<template>
  <div class="vue-tempalte">
    <div>
      <button v-for="entry in languages" :key="entry.title" @click="changeLocale(entry.language)">
        <flag :iso="entry.flag" v-bind:squared="false" />
        {{entry.title}}
      </button>
    </div>
    <form>
      <h3>{{ $t("forgot_password") }}</h3>

      <div class="form-group">
        <label>Email</label>
        <input type="email" class="form-control form-control-lg" />
      </div>

      <button type="submit" class="btn btn-dark btn-lg btn-block">{{ $t("reset_password") }}</button>
    </form>
  </div>
</template>

<script>
import i18n from "@/plugins/i18n";
export default {
  data() {
    return {
      languages: [
        { flag: "us", language: "en", title: "English" },
        { flag: "es", language: "vi", title: "Tiếng Việt" }
      ]
    };
  },
  methods: {
    changeLocale(locale) {
      i18n.locale = locale;
    }
  }
};
</script>