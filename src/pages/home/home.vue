<template>
  <div class="container-box">
    <!-- 顶部 -->
    <v-header></v-header>
    <!-- 侧边栏目录 -->
    <v-sidebar @collapseContent="handleCollapse"></v-sidebar>
    <!-- 右侧内容 -->
    <div class="content-box" :class="collapse ? 'shrink': ' ' ">
      <!-- 面包屑 -->
      <div class="breadcrumb-box">
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item
            v-for="item in breadcrumb"
            :key="item.index"
            :to="{ path: '/'+item.index }"
          >{{item.title}}</el-breadcrumb-item>
        </el-breadcrumb>
      </div>
      <!-- 组件页面 -->
      <transition name="el-fade-in-linear">
        <router-view></router-view>
      </transition>
    </div>
  </div>
</template>

<script>
import vHeader from "./header/header";
import vSidebar from "./sidebar/sidebar";
import { mapState } from "vuex";
export default {
  data() {
    return {
      collapse: true
    };
  },
  components: {
    vHeader,
    vSidebar
  },
  computed: {
    ...mapState({
      //这里的...不是省略号了,是对象扩展符
      breadcrumb: "breadcrumb"
    })
  },
  created() {},
  methods: {
    handleCollapse(msg) {
      this.collapse = msg;
    }
  }
};
</script>

<style lang='scss' scoped>
.container-box {
  height: 100%;
  .content-box {
    position: absolute;
    left: 250px;
    right: 0;
    top: 70px;
    bottom: 0;
    padding: 20px;
    -webkit-transition: left 0.3s ease-in-out;
    transition: left 0.3s ease-in-out;
    background: #f0f0f0;
  }
  .shrink {
    left: 65px;
  }
  .breadcrumb-box {
    margin-bottom: 10px;
  }
}
</style>