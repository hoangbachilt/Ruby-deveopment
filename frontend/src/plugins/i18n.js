import Vue from "vue";
import VueI18n from "vue-i18n";

Vue.use(VueI18n);

const messages = {
  en: {
    welcomeMsg: "Welcome to Your Vue.js App",
    login: "Login",
    password: "Password",
    password_confirmation: "Password Confirmation",
    signup: "Signup",
    fullname: "Fullname",
    forgot_password: "Forgot Password",
    reset_password: "Reset Password",
    email: "Email",
    btn_upload: "Upload",
    add_image: "Add image to folder",
    title: "Title",
    select_folder: "Select folder",
    picture: "Upload image",
    create_image: "Create image for folder",
    edit_profile: "Edit profile",
    update: "Update",
    info_user: "Information update",
    name: "Name",
    home: "Home",
    invitations: "Invitations",
    invite_from: "Invite from user",
    accept: "Accept",
    decline: "Decline"
  },
  vi: {
    welcomeMsg: "Chào mừng đến với ứng dụng Vue.js của bạn",
    login: "Đăng Nhập",
    password: "Mật khẩu",
    password_confirmation: "Xác nhận",
    signup: "Đăng ký",
    fullname: "Họ và Tên",
    forgot_password: "Quên mật khẩu",
    reset_password: "Đặt lại mật khẩu",
    email: "Địa chỉ email",
    btn_upload: "Đăng ảnh",
    add_image: "Thêm một ảnh vào thư mục",
    title: "Tiêu đề",
    select_folder: "Lựa chọn thư mục để thêm ảnh",
    picture: "Tải ảnh",
    create_image: "Tải ảnh lên thư mục",
    invitations: "Loi moi",
    invite_from: "Loi moi tu nguoi dung so",
    accept: "Chap nhan",
    decline: "Tu choi",
    folder: "Folders",
    owner_folders: "Owner folders",
    public_folders: "Public folders",
    shared_folders: "Shared be from user"
  }
};

const i18n = new VueI18n({
  locale: "vi",
  fallbackLocale: "vi",
  messages
});

export default i18n;
