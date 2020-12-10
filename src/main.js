import Vue from "vue";
import App from "./App";
import router from "./router/router";
import store from "@/store";

import ElementUI from "element-ui";
import "element-ui/lib/theme-chalk/index.css";

import "../static/font/iconfont.css";

Vue.use(ElementUI);

Vue.config.productionTip = false;

/* eslint-disable no-new */
var vue = new Vue({
  el: "#app",
  router,
  store,
  components: { App },
  template: "<App/>"
});

export { router, vue };
