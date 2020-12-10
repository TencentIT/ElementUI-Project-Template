import axios from "axios";
import { vue } from "@/main";

axios.defaults.timeout = 600000;

axios.interceptors.response.use(
  response => {
    return response;
  },
  error => {
    if (error.response) {
      if (error.response.data.code) {
        switch (error.response.data.code) {
          case 10001:
            break;
          default:
            if (error.response.config.method !== "get") {
              let msg = error.response.data.msg;
              if (
                error.response.data.errors &&
                error.response.data.errors.length
              ) {
                msg = "";
              }
              if (error.response.data.errors) {
                for (let i in error.response.data.errors) {
                  if (
                    error.response.data.errors[i] &&
                    error.response.data.errors[i].message
                  ) {
                    msg += ` ${error.response.data.errors[i].message}`;
                  }
                }
              }
              vue.$message.error({
                message: msg,
                time: 3500
              });
            }
        }
      } else if (error.response.status == 401) {
        vue.$router.push({ path: "/login" });
      } else if (error.response.status == 403) {
        vue.$message.error({
          message: "No Permission !",
          time: 3500
        });
      } else {
        let token = sessionStorage.getItem("token");
        let url = window.location.href;
        if (!token && url.indexOf("login") == -1) {
          vue.$router.push({ path: "/login" });
        }
        vue.$message.error({
          message: "Server disconnected",
          time: 3500
        });
      }
    }
    return Promise.reject(error.response.data); // 返回接口返回的错误信息
  }
);

export default axios;
