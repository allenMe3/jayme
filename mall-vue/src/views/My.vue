<template>
  <div class="container">
      <mt-header fixed title="会员中心"></mt-header>
      <!-- 会员信息 -->
      <div class="member-info" v-if="isLogin">
        <div class="headshot-box">
          <img src="../assets/images/jay.jpeg" class="headshot" @click="my(username)"/>
          <div class="name">{{username}}</div>
          <div v-for="(user,index) in users" :key="index">
          <div>{{user.signature}}</div>
          <div>累计签到：{{user.sign}}天</div></div>
        </div>
      </div>
      <div class="member-info" v-else>
        <div class="headshot-box">
          <img src="../assets/images/jay.jpeg" class="headshot"/>
          <div>请登录</div>
          <mt-button type="default" class="login-btn" @click="login">登录</mt-button>
        </div>
        
        <!-- <mt-button type="danger" class="register-btn" @click="register">注册</mt-button> -->
      </div>
      <!-- 菜单 -->
      <div class="shortcut">
        <div class="shortcut-item" @click="sign">
          <p class="icon iconfont icon-qiandao shortcut-icon" ></p>
          签到
        </div>
        <div class="shortcut-item" @click="collect">
          <p class="icon iconfont icon-shoucang-copy shortcut-icon" ></p>
          收藏
        </div>
        <div class="shortcut-item" @click="setting">
          <p class="icon iconfont icon-setting shortcut-icon" ></p>
          个人设置
        </div>
      </div>
      <mt-button type="danger" v-if="isLogin" @click="logout" style="width:50%;margin-top:20px;">退出登录</mt-button>
  </div>
</template>

<script>
  import Vue from 'vue';
  import { Header, Button, Toast} from 'mint-ui';
  import 'mint-ui/lib/style.css'

  var common = require('../assets/js/common')
  const axios = require('axios');

  Vue.component(Header.name, Header);
  Vue.component(Button.name, Button);

  export default {
    inject:['reload'],
    name: '',
    data() { 
      return {
        isLogin:window.localStorage.getItem('token')!=null,
        username: window.localStorage.getItem('username'),
        users:[]
      }
    },
    methods:{
      login(){
        this.$router.push('/login')
      },
      register(){
        this.$router.push('/register')
      },
      logout(){
        window.localStorage.removeItem('token')
        window.localStorage.removeItem('username')
        this.isLogin = false;
        this.username = '';
        this.$router.push('/login')
      },
      formarCreateTime(create_time){
                return common.dateFormat("YYYY-mm-dd", new Date(create_time))
      },
      getuser(name){
        console.log("请求帖子数据")
        axios.post(`http://localhost:3000/login/all/${name}`,
                        {
                        
                        },{
                            headers: {'authorization': window.localStorage.getItem('token')}
                        })
          .then((response) => {
            this.users = response.data
            console.log(response.data)
          })
      },
      sign(){
        axios.post('http://localhost:3000/login/sign',{
          
        },
        {
          headers: {'authorization': window.localStorage.getItem('token')}
        }).then((response) => {
          if(response.data.ok){
            Toast({
              message: '签到成功',
              iconClass: 'icon icon-success'
            });
            this.reload()
            }else{
              Toast({
                message: response.data.msg
              });
            }
        })
               
      },
      setting(){
        this.$router.push('/settlement')
      },
      collect(){
        this.$router.push('/collect')
      },
      my(name){
        this.$router.push(`/self/${name}`)
      }
    },
    mounted(){
      document.querySelector('body').setAttribute('style', 'background-color:#f8f5f5');
      this.getuser(window.localStorage.getItem('username'))
    },
    beforeDestroy() {
      document.querySelector('body').removeAttribute('style')
    },
  }
</script>

<style scoped>
  *{
    text-align: center;
  }
  .container{
    padding-top:40px;
  }
  /* 会员信息 */
  .member-info{
    display: flex;
    flex-direction: row;
    /* background-color: #13222e; */
    align-items: center;
    height: 150px;
    color:black;
    justify-content:center;
  }
  .member-txt{
    flex:1;
  }
  .headshot-box{
    flex: 1;
  }
  .headshot{
    width:70px;
    height: 70px;
    border-radius: 50%;
  }
  .member-btn{
    border:2px solid #FFFFFF;
    background-color: #26a2ff;
    color:#FFFFFF;
    border-radius: 10px;
    padding:2px 10px;
  }
  .name{
    margin-top: 5px;
    font-size: 20px;
  }
  .level{
    font-size: 13px;
  }
  .my-order{
    font-weight: bold;
  }
  .all-order{
    font-size:14px;
  }
  .shortcut{
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    /* background-color: #13222e; */
    color: #051624;
  }
  .shortcut-item{
    flex:1;
    font-size: 13px;
  }
  .shortcut-icon{
    color: #24e02d;
    font-size: 35px;
    margin:5px 0;
  }
  /* 菜单列表 */
  .menu{
    background-color: #FFFFFF;
    margin-top:20px;
  }
  .menu-item{
    height: 40px;
    line-height: 40px;
    border-bottom: 1px solid #EFEFEF;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
  }
  .menu-icon{
    font-size: 24px;
    color:blueviolet;
  }
  .login-btn{
    width: 100px;
    height: 30px;
    font-size: 20px;
  }
  .register-btn{
    position: absolute;
    width: 50px;
    height: 30px;
    top: 50px;
    right: 10px;
  }
</style>