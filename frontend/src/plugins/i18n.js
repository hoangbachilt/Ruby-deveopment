import Vue from "vue";
import VueI18n from "vue-i18n";

Vue.use(VueI18n);

const messages = {
  en: {
    btn_upload: "Upload",
    add_image: "Add image to folder",
    title: "Title",
    select_folder: "Select folder",
    picture: "Upload image",
    create_image: "Create image for folder"
  },
  vi: {
    btn_upload: "Dang anh",
    add_image: "Them mot anh vao thu muc",
    title: "Tieu de",
    select_folder: "Lua chon thu muc them anh",
    picture: "Tai anh len",
    create_image: "Tao anh vao thu muc"
  }
};

const i18n = new VueI18n({
  locale: "vi",
  fallbackLocale: "vi",
  messages
});

export default i18n;
