<template>
  <div class="header-box">
    <div class="header-left-content">
      <!-- 折叠按钮 -->
      <div class="collapse-btn" @click="changeShow">
        <!-- 开 -->
        <i v-show="isShow" class="iconfont iconzhankai icon-click"></i>
        <!-- 关 -->
        <i v-show="!isShow" class="iconfont iconshouqi icon-click"></i>
      </div>
      <div class="logo">sBider</div>
    </div>

    <div class="header-right-content">
      <!-- 全屏icon -->
      <!-- <div class="full-screen">
        <i class="iconfont iconyulan"></i>
      </div>-->
      <!-- 提示icon -->
      <!-- <div class="tips">
        <i class="iconfont iconAppName"></i>
      </div>-->
      <!-- 头像 -->
      <div class="user-avator">
        <img src="../../../assets/img/touxiang.jpg" alt />
      </div>
      <div class="user-profile">
        <el-dropdown>
          <span class="el-dropdown-link">
            UserName
            <i class="iconfont iconxiala1"></i>
          </span>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item>User Center</el-dropdown-item>
            <el-dropdown-item>Login out</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>
  </div>
</template>

<script>
import bus from "../../../common/bus";

export default {
  data() {
    return {
      isShow: true
    };
  },
  created() {},
  methods: {
    changeShow() {
      this.isShow = !this.isShow;
      bus.$emit("collapse", this.isShow);
    }
  }
};
</script>

<style lang='scss' scoped>
.header-box {
  width: 100%;
  display: flex;
  justify-content: space-between;
  height: 70px;
  background: #242f42;
  color: #fff;
  align-items: center;
  .header-left-content {
    display: flex;
    align-items: center;
    .collapse-btn {
      margin-left: 20px;
      i {
        font-size: 34px;
        cursor: pointer;
      }
    }
    .logo {
      font-size: 24px;
      margin-left: 10px;
    }
  }
  .header-right-content {
    display: flex;
    height: 100%;
    display: flex;
    align-items: center;
    padding-right: 50px;
    i {
      font-size: 24px;
      line-height: 60px;
      margin-right: 7px;
      cursor: pointer;
    }
    .user-avator {
      img {
        width: 50px;
        height: 50px;
        border-radius: 50%;
      }
    }
    .user-profile {
      cursor: pointer;
      line-height: 58px;
      margin-left: 7px;
      /deep/ .el-dropdown {
        color: #fff;
      }
      .iconxiala1 {
        font-size: 14px;
      }
    }
  }
}
</style>