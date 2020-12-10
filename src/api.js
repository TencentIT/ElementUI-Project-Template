/* eslint-disable */
import axios from '@/http'
import qs from 'qs'
let domain = '/api/v1'
import Vue from 'vue'

export const getDomain = () => {
  return domain
}
export const setDomain = ($domain) => {
  domain = $domain
}

export const request = (method, url, body, config) => {
  if(method!='get') {
    BIObj.loading = Vue.$Spin
    BIObj.onload=true;
  };
  // ;
  method = method.toLowerCase()
  // let keys = Object.keys(queryParameters)
  let queryUrl 
  let token=sessionStorage.getItem('token')
  // ;
  let header;
  if(token && token!=''){
    header={
      'access_token':token,
      'Cache-control':'no-cache',
      "X-Frame-Options" :'SAMEORIGIN',
      "X-Content-Type-Options": 'nosniff',
      "Content-Security-Policy": "default-src 'self' ",
      "X-Xss-Protection": 1,
    }
  }else{
    header={
      'Cache-control':'no-cache',
      "X-Frame-Options" :'SAMEORIGIN',
      "X-Content-Type-Options": 'nosniff',
      "Content-Security-Policy": "default-src 'self' ",
      "X-Xss-Protection": 1,
    }
  }

  // if(/^\/(merchant|merchantType|operator)/.test(url)){
  //   queryUrl='/adminApi'+url
  // // }else if(/^\/(scrp|model|vendor)/.test(url)){
  //   // queryUrl='/imsApi'+url
  // }else{
  //   queryUrl=url;
  // }
  queryUrl = domain+url
  // if(token){
  //   body=Object.assign({},body,{'access_token':token})
  // }
  config=Object.assign({headers:header},config);
  ;
  // if (keys.length > 0) {
  // queryUrl = url + '?' + qs.stringify(queryParameters)
  // }
  // let queryUrl = url+(keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
  
  if (method === 'get') {
    return axios[method](queryUrl, {
      params: body,
      ...config
    }, config)
  } else if (method === 'post'||method === 'put') {
    return axios[method](queryUrl, Object.assign({},body,{
    }), config)
  } else if (body) {
    return axios[method](queryUrl, Object.assign({},body,{
      ...config      
    }), config)
  } else {
    // return axios[method](queryUrl, qs.stringify(body), config)
    return axios[method](queryUrl, Object.assign({},body,{
      ...config      
    }), config)
  }
}


