<template>
  <div>
    <div
      v-for="entry in languages"
      :key="entry.title"
      @click="changeLocale(entry.language)"
    >
      <button>
        <flag :iso="entry.flag" v-bind:squared="false" />
        {{ entry.title }}
      </button>
    </div>
    <div v-for="error in errors" :key="error">
      {{ error.message }}
    </div>
    <h2>{{ $t("add_image") }}</h2>
    <form enctype="multipart/form-data">
      <p>{{ $t("title") }}:</p>
      <input v-model="title" />

      <p>{{ $t("select_folder") }}</p>
      <select v-model="folder_id">
        <option v-for="folder in folders" :key="folder.id" :value="folder.id">
          {{ folder.name }}
        </option>
      </select>

      <p>{{ $t("picture") }} :</p>
      <input type="file" ref="inputFile" @change="uploadFile" />

      <button @click.prevent="createItem">{{ $t("create_image") }}</button>
    </form>
  </div>
</template>

<script>
import axios from "axios";
import i18n from "@/plugins/i18n";
import authHeader from "@/services/auth-header";

export default {
  data() {
    return {
      title: "",
      inputPicture: null,
      folder_id: "",
      folders: [],
      errors: [],
      languages: [
        { flag: "us", language: "en", title: "English" },
        { flag: "es", language: "vi", title: "Tiếng Việt" }
      ]
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
  },
  methods: {
    uploadFile() {
      this.inputPicture = this.$refs.inputFile.files[0];
    },
    createItem() {
      let self = this;
      let formData = new FormData();
      const params = {
        "image_form[title]": this.title,
        "image_form[folder_id]": this.folder_id,
        "image_form[picture]": this.inputPicture,
        "image_form[extension]": this.inputPicture.type,
        "image_form[size]": this.inputPicture.size
      };

      Object.entries(params).forEach(([key, value]) =>
        formData.append(key, value)
      );
      axios.post("/images", formData, { headers: authHeader() }).catch(e => {
        self.errors.push(e.response.data);
      });
    },
    changeLocale(locale) {
      i18n.locale = locale;
    }
  }
};
</script>
