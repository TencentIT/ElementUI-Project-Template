//index.js
//获取应用实例
var API_URL="http://t.yushu.im/v2/movie/in_theaters";

Page({
  data: {
    title:"加载中。。。",
    movies:[]
  },
  onLoad: function(){
    var that = this;
    wx.showToast({
      title:"加载中...",
      icon:"loading",
      duration:3000
    });
    wx.request({
      url:API_URL,
      data:{},
      header:{
        'content-type':'application/json',
      },
      success:function(res){
        wx.hideToast();
        var data1 = res.data;
        console.log(data1);
        that.setData({
          title:data1.subjects[0].title,
          movies:data1.subjects
        })  
      }

    })
  }
})
