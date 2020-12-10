// export const getToken = () => {
//   let token = this.getCookie('token')
//   if (!token) {
//     token = this.getCookie('token')
//   }
//   return token
// }
// export const getCookie = name => {
//   const reg = new RegExp('(^| )' + name + '=([^;]*)(;|$)')
//   const arr = document.cookie.match(reg)
//   if (arr) {
//     return unescape(arr[2])
//   } else {
//     return null
//   }
// }
export const exportsetCookie = (name, value) => {
  const Days = 3000;
  const exp = new Date();
  exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
  document.cookie =
    name + "=" + escape(value) + ";expires=" + exp.toGMTString() + ";path=/";
};
// export const commonObj = {
//   $message: ({ type, message }) => {
//     if (type == 'success') {
//       this.$Message.success({
//         title: 'success',
//         message: message,
//         time: 2000
//       })
//     } else {
//       this.$toast.error({
//         title: 'Error',
//         message: message,
//         time: 10000
//       })
//     }
//   },
// }
