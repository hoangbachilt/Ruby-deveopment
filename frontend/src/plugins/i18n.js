import Vue from "vue";
import VueI18n from "vue-i18n";

Vue.use(VueI18n);

const messages = {
  en: {
    welcomeMsg: 'Welcome to Your Vue.js App',
    login: 'Login',
    password: 'Password',
    password_confirmation: 'Password Confirmation',
    signup: 'Signup',
    fullname: 'Fullname',
    forgot_password: 'Forgot Password',
    reset_password: 'Reset Password',
    email: 'Email',
    btn_upload: "Upload",
    add_image: "Add image to folder",
    title: "Title",
    select_folder: "Select folder",
    picture: "Upload image",
    create_image: "Create image for folder"
  },
  vi: {
    welcomeMsg: 'Chào mừng đến với ứng dụng Vue.js của bạn',
    login: 'Đăng Nhập',
    password: 'Mật khẩu',
    password_confirmation: 'Xác nhận',
    signup: 'Đăng ký',
    fullname: 'Họ và Tên',
    forgot_password: 'Quên mật khẩu',
    reset_password: 'Đặt lại mật khẩu',
    email: 'Địa chỉ email',
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
