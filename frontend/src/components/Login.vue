<template>
  <div class="vue-tempalte">
    <div>
      <button v-for="entry in languages" :key="entry.title" @click="changeLocale(entry.language)">
        <flag :iso="entry.flag" v-bind:squared="false" />
        {{entry.title}}
      </button>
    </div>
  <form v-on:submit.prevent="handleSubmit">
    <h3>{{ $t("login") }}</h3>
      <p v-if="errors.length">
        <b>Please correct the following error(s):</b>
          <ul>
            <li v-for="error in errors" :key="error.id">{{ error }}</li>
          </ul>
      </p>
    <div class="form-group">
      <label>{{ $t("email") }}</label>
        <input type="email" v-model="email" class="form-control form-control-lg" required />
    </div>
      <div class="form-group">
        <label>{{ $t("password") }}</label>
        <input type="password" v-model="password" class="form-control form-control-lg" required />
      </div>
      <button type="submit" class="btn btn-dark btn-lg btn-block">{{ $t("login") }}</button>
      <p class="forgot-password text-right mt-2 mb-4">
      <div class="social-icons">
        <ul>
          <li v-for="id in ids" :key="id.type">{{ id.class }}</li>
        </ul>
      </div>
    </form>
  </div>
</template>

<script>
import axios from "axios";
import router from "../router";
import i18n from "@/plugins/i18n";
export default {
  data() {
    return {
      ids: [
        {
          href: "#",
          class: "facebook"
        },
        {
          href: "#",
          class: "twitter"
        },
        {
          href: "#",
          class: "google"
        }
      ],
      email: "",
      password: "",
      errors: [],
      languages: [
        { flag: "us", language: "en", title: "English" },
        { flag: "es", language: "vi", title: "Tiếng Việt" }
      ]
    };
  },
  methods: {
    handleSubmit() {
      axios
        .post("/signin", {
          email: this.email,
          password: this.password
        })
        .then(response => {
          this.users = response.data;
          localStorage.setItem('token', response.data.token);
          router.push("transaction");
        })
        .catch(errors => {
          this.errors.push(errors.response.data.error);
        })
    },
    changeLocale(locale) {
      i18n.locale = locale;
    },
  }
};
</script>



