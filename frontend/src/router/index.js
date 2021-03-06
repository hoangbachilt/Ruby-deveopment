import Vue from "vue";
import VueRouter from "vue-router";
import Signup from "@/components/Signup";
import Login from "@/components/Login";
import Transaction from "@/components/Transaction";
import Newfolders from "@/components/Newfolders";
import Upload from "../views/Upload.vue";
import Images from "../views/Images.vue";
import Folders from "../views/Folders.vue";
import Folder from "@/components/Folder.vue";
import Profile from "../views/Profile.vue";
import Home from "../views/Home.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home
  },
  {
    path: "/signup",
    name: "signup",
    component: Signup,
    meta: {
      guest: true
    }
  },
  {
    path: "/about",
    name: "About",
    component: () => import("../views/About.vue")
  },
  {
    path: "/images",
    name: "Images",
    component: Images
  },
  {
    path: "/upload",
    name: "Upload",
    component: Upload
  },
  {
    path: "/login",
    name: "login",
    component: Login,
    meta: {
      guest: true
    }
  },
  {
    path: "/transaction",
    name: "transaction",
    component: Transaction,
    meta: {
      guest: true
    }
  },
  {
    path: "/folders",
    name: "Folders",
    component: Folders
  },
  {
    path: "/folders/:id",
    name: "folder",
    component: Folder
  },
  {
    path: "/profile",
    name: "Profile",
    component: Profile
  },
  {
    path: "/newfolders",
    name: "newfolders",
    component: Newfolders
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

router.beforeEach((to, from, next) => {
  if (localStorage.getItem("token") === null && to.name === "login") {
    return next();
  } else if (localStorage.getItem("token") !== null && to.name === "login") {
    return next("transaction");
  } else if (localStorage.getItem("token") !== null && to.name === "signup") {
    return next("login");
  } else if (to.name === "transaction") {
    if (localStorage.getItem("token") !== null) return next();
    else return next("login");
  } else if (to.name === "newfolders") {
    if (localStorage.getItem("token") !== null) return next();
    else return next("login");
  } else {
    return next();
  }
});

export default router;
