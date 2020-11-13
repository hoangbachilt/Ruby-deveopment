<template>
  <div class="vue-tempalte">
    <div>
      <button v-for="entry in languages" :key="entry.title" @click="changeLocale(entry.language)">
        <flag :iso="entry.flag" v-bind:squared="false" />
        {{entry.title}}
      </button>
    </div>
      <h3>{{ $t("signup") }}</h3>

     <p v-if="errors.length">
    <b>Please correct the following error(s):</b>
    <ul>
      <li v-for="error in errors" :key="error.id">{{ error }}</li>
    </ul>
  </p>
    <form v-on:submit.prevent="handleSubmit" method="post">
      <div class="form-group">
        <label>{{ $t("fullname") }}</label>
        <input type="text" v-model="name" class="form-control form-control-lg" />
        <span class="invalid-feedback"></span>
      </div>

      <div class="form-group">
        <label>{{ $t("email") }}</label>
        <input type="email" v-model="email" class="form-control form-control-lg" />
      </div>

      <div class="form-group">
        <label>{{ $t("password") }}</label>
        <input type="password" v-model="password" class="form-control form-control-lg" />
      </div>

      <button type="submit" class="btn btn-dark btn-lg btn-block">{{ $t("signup") }}</button>

      <p class="forgot-password text-right">
        Already registered
        <router-link :to="{name: 'login'}">sign in?</router-link>
      </p>
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
      name: "",
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
        .post("http://localhost:3000/signup", {
          name: this.name,
          email: this.email,
          password: this.password
        })
        .then(response => {
          this.users = response.data;
          router.push("login");
        })
        .catch(e => {
          this.errors = JSON.parse(e.response.data.message);
          this.errors.push(e);
        });
    },
    changeLocale(locale) {
      i18n.locale = locale;
    }
  }
};
</script>
