import Vue from "vue";
import Router from "vue-router";
import navigator from "./navigator.js";
import store from "@/store";
Vue.use(Router);
const router = new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      redirect: "/dashboard"
    },
    {
      path: "/404",
      component: () => import("../pages/404/404.vue")
    },
    {
      path: "/updateBrower",
      component: () => import("../pages/updateBrower/updateBrower.vue")
    },
    {
      path: "/login",
      component: () => import("../pages/login/login.vue")
    },
    {
      path: "/home",
      component: () => import("../pages/home/home.vue"),
      children: [
        {
          path: "/dashboard",
          component: () => import("../pages/dashboard/dashboard.vue"),
          meta: { title: "dashboard", menuCode: 1 }
        },
        {
          path: "/report",
          component: () => import("../pages/report/report.vue"),
          meta: { title: "report", menuCode: 2 }
        },
        {
          path: "/userManagement",
          component: () => import("../pages/userManagement/userManagement.vue"),
          meta: { title: "userManagement", menuCode: 4 }
        },
        {
          path: "/processorInfo",
          component: () => import("../pages/report/processorInfo.vue"),
          meta: { title: "processorInfo", menuCode: 3 }
        }
      ]
    },
    {
      path: "*",
      redirect: {
        path: "/404"
      }
    }
  ]
});
let breadcrumb = [];
function iterator(menus, menuCode) {
  for (let item of menus) {
    if (item.menuCode === menuCode) {
      breadcrumb.push({
        title: item.title,
        index: item.index
      });
      return true;
    } else if (item.subs && item.subs.length !== 0) {
      breadcrumb.push({
        title: item.title,
        index: item.index
      });
      return iterator(item.subs, menuCode);
    }
  }
  return false;
}
router.beforeEach(function(to, from, next) {
  const menuCode = to.meta.menuCode;

  for (let item of navigator) {
    breadcrumb = [];
    if (iterator([item], menuCode)) {
      break;
    }
  }
  store.commit("setBreadcrumb", breadcrumb);
  next();
});

export default router;
