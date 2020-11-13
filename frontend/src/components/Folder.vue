<template>
  <div class="container">
    <div v-for="error in errors" :key="error">
      {{ error.message }}
    </div>
    <h2>{{ $t("add_image") }}</h2>
    <form
      enctype="multipart/form-data"
      class="form-upload"
      id="'form-' + index"
    >
      <p>{{ $t("title") }}:</p>
      <input v-model="title" :id="title-0" />

      <p>{{ $t("picture") }} :</p>
      <input
        type="file"
        ref="inputFile"
        @change="uploadFile"
        id="file-0"
      />

      <button @click.prevent="createItem" class="btn btn-primary">{{ $t("create_image") }}</button>
    </form>
    <div class="row">
      <div
        v-for="(image_url, index) in image_urls"
        :key="index"
        class="col-sm"
      >
        <div v-if="user_id == image_url[0].user_id">
          <button @click.prevent="isEdit" class="btn">{{ $t("edit_image") }}</button>
          <button @click.prevent="destroyImage(image_url[0].id)" class="btn">
            {{ $t("destroy_image") }}
          </button>
          <div class="not_show">
            <form
              enctype="multipart/form-data"
              class="form-upload"
              :id="'form-' + image_url[0].id"
            >
              <p>{{ $t("title") }}:</p>
              <input v-model="title" :id="'title-' + image_url[0].id" />

              <p>{{ $t("picture") }} :</p>
              <input
                type="file"
                ref="inputFileId"
                @change="updateFile(index)"
                :id="'file-' + image_url[0].id"
              />

              <button @click.prevent="updateImage(image_url[0].id)">
                {{ $t("update_image") }}
              </button>
            </form>
          </div>
        </div>
        <img class="image" :src="image_url[1]" />
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
      title: "",
      inputPicture: "",
      image_urls: [],
      user_id: JSON.parse(localStorage.getItem("token")).user.id,
      errors: [],
    };
  },
  created() {
    axios
      .get(`/folders/${this.id}`, { headers: authHeader() })
      .then(response => {
        this.image_urls = response.data;
      })
      .catch(e => {
        this.errors.push(e.response.data.message);
      });
  },
  methods: {
    uploadFile() {
      this.inputPicture = this.$refs.inputFile.files[0];
    },
    updateFile(index) {
      this.inputPicture = this.$refs.inputFileId[index].files[0];
    },
    createItem() {
      let self = this;
      let formData = new FormData();
      const params = {
        "image_form[title]": this.title,
        "image_form[folder_id]": this.id,
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
    isEdit(e) {
      e.target.parentNode.childNodes[2].removeAttribute('class')
    },
    updateImage(id) {
      let self = this;
      let formData = new FormData();
      const params = {
        "image_form[title]": this.title,
        "image_form[folder_id]": this.id,
        "image_form[picture]": this.inputPicture,
        "image_form[extension]": this.inputPicture.type,
        "image_form[size]": this.inputPicture.size
      };

      Object.entries(params).forEach(([key, value]) =>
        formData.append(key, value)
      );
      axios
        .put(`/images/${id}`, formData, { headers: authHeader() })
        .catch(e => {
          self.errors.push(e.response.data);
        });
    },
    destroyImage(id) {
      axios.delete(`/images/${id}`, { headers: authHeader() });
    }
  }
};
</script>

<style lang="scss">
.image {
  width: 150px;
  heigh: 150px;
  margin-bottom: 15px;
}
.form-upload {
  margin-bottom: 30px;
}

.not_show {
  display: none;
}
</style>
