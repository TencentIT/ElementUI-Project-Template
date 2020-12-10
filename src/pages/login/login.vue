<template>
  <div class="login-wrap" v-loading.fullscreen.lock="loading">
    <div class="ms-login">
      <div class="ms-title">sBider Login</div>
      <el-form :model="param" :rules="rules" ref="login" label-width="0px" class="ms-content">
        <el-form-item prop="email">
          <el-input v-model="param.email" placeholder="email">
            <el-button slot="prepend" icon="iconfont iconlianxiren"></el-button>
          </el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input
            type="password"
            placeholder="password"
            v-model="param.password"
            @keyup.enter.native="submitForm"
          >
            <el-button slot="prepend" icon="iconfont iconmima"></el-button>
          </el-input>
        </el-form-item>
        <div class="login-btn">
          <el-button type="primary" @click="submitForm">Login In</el-button>
        </div>
        <!-- <p class="login-tips">Tips : login</p> -->
      </el-form>
    </div>
  </div>
</template>

<script>
import { loginVerify } from "@/proxy/login";

export default {
  data: function() {
    return {
      param: {
        email: "admin@paxsz.com",
        password: "admin"
      },
      rules: {
        email: [
          { required: true, message: "Please input userName", trigger: "blur" }
        ],
        password: [
          { required: true, message: "Please input password", trigger: "blur" }
        ]
      },
      loading: false
    };
  },
  methods: {
    async submitForm() {
      this.$refs.login.validate(async valid => {
        if (valid) {
          this.loading = true;
          const res = await loginVerify(this.param);
          this.$message.success("Login Success");
          console.log("res==", res);
          this.$router.push("/dashboard");
        } else {
          this.$message.error("Input Error");
          return false;
        }
      });
    }
  }
};
</script>

<style scoped>
.login-wrap {
  position: relative;
  width: 100%;
  height: 100%;
  background-image: url(../../assets/img/login-bg.jpg);
  background-size: 100% 100%;
  background-repeat: no-repeat;
}
.ms-title {
  width: 100%;
  line-height: 50px;
  text-align: center;
  font-size: 20px;
  color: #fff;
  border-bottom: 1px solid #ddd;
}
.ms-login {
  position: absolute;
  left: 50%;
  top: 50%;
  width: 350px;
  margin: -190px 0 0 -175px;
  border-radius: 5px;
  background: rgba(255, 255, 255, 0.3);
  overflow: hidden;
}
.ms-content {
  padding: 30px 30px;
}
.login-btn {
  text-align: center;
}
.login-btn button {
  width: 100%;
  height: 36px;
  margin-bottom: 10px;
}
.login-tips {
  font-size: 12px;
  line-height: 30px;
  color: #fff;
}
</style>
