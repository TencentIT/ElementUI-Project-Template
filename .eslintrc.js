// https://blog.csdn.net/CHS007chs/article/details/95486063 配置解释 可参考这个
module.exports = {
  root: true,
  env: {
    browser: true,
    es6: true,
    jquery: true, //可处理使用$的报错
    node: true //可处理使用require的报错
  },
  /**
   * 规则继承
   * http://eslint.cn/docs/user-guide/configuring#extending-configuration-files
   *【】可继承的方式有以下几种
   *【】eslint内置推荐规则，就只有一个，即「eslint:recommended」
   *【】可共享的配置， 是一个 npm 包，它输出一个配置对象。即通过npm安装到node_module中
   *  可共享的配置可以省略包名的前缀 eslint-config-，即实际设置安装的包名是 eslint-config-airbnb-base
   *【】从插件中获取的规则，书写规则为 「plugin:插件包名/配置名」，其中插件报名也是可以忽略「eslint-plugin-」前缀。如'plugin:vue/essential'
   *【】从配置文件中继承，即继承另外的一个配置文件，如'./node_modules/coding-standard/eslintDefaults.js'
   */
  extends: [
    "eslint:recommended",
    "plugin:vue/essential" //插件有vue相关的规则
    // "standard"
  ],
  /**
   * 全局变量
   * http://eslint.cn/docs/user-guide/configuring#specifying-globals
   * 【】定义额外的全局，开发者自定义的全局变量，让其跳过no-undef 规则
   * 【】key值就是额外添加的全局变量
   * 【】value值用于标识该变量能否被重写，类似于const的作用。true为允许变量被重写
   * 【】注意：要启用no-global-assign规则来禁止对只读的全局变量进行修改。
   */
  globals: {
    Atomics: "readonly",
    SharedArrayBuffer: "readonly"
  },
  parserOptions: {
    ecmaVersion: 2018,
    sourceType: "module",
    parser: "babel-eslint"
  },
  plugins: ["vue"],
  /**
   * 每个规则有【3】个错误级别。
   * off或0: 关闭该规则；
   * warn或1: 开启规则，使用警告级别的错误，不会导致程序退出；
   * error或2: 开启规则，使用错误级别的错误，当被触发的时候，程序会退出。
   */
  rules: {
    // 不禁止console
    "no-console": 0,
    // 禁止出现未使用的变量
    "no-unused-vars": [
      2,
      {
        vars: "all",
        args: "none" //不检测参数
      }
    ]
  }
};
