const URLs = {
  user:{
    profile: '/user/profile',
  },
  login: '/login',
  merchantType: {
    all: '/mmsApi/merchantType',
    list: '/mmsApi/merchantType/page',
    delete: (id) => {
      return `/mmsApi/merchantType/${id}`;
    },
    add:'/mmsApi/merchantType/add',
    edit: (id) => {
      return `/mmsApi/merchantType/${id}`;
    },
  },
}

export default URLs