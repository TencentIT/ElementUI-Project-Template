var API_URL="http://t.yushu.im/v2/movie/in_theaters/";

Page({
  data:{

  },
  onLoad:function(params){

    // console.log(url);
    wx.request({
      url:API_URL+params.id,
      data:{

      },
      header:{
        "content-type":"application/json"
      },
      success:function(res){
        console.log(2,res.data)
      }
      
    })
  }
})