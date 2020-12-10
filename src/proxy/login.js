import axios from "../http.js";
const loginVerify_url = "/api/v1/login";

const loginVerify = function(data) {
  return axios.post(loginVerify_url, data);
};
export { loginVerify };
