<template>
  <div class="container">
        <mt-header fixed title="会员登录">
            <mt-button icon="back" slot="left" @click="go">返回</mt-button>
        </mt-header>
        <div v-show=showLogin>
            <div class="register">
                <mt-field label="用户名" placeholder="请输入用户名" v-model="username"></mt-field>
                <mt-field label="密码" placeholder="请输入密码" type="password" v-model="password"></mt-field>
            </div>
            <div class="re" @click="ToRegister">还没有账号？注册</div>
            <mt-button type="primary" class="btn" @click="login">登录</mt-button>
        </div>
        <div class="reg" v-show=showRegister>
            <div class="register">
                <mt-field label="用户名" placeholder="请输入用户名" v-model="username"></mt-field>
                <mt-field label="密码" placeholder="请输入密码" type="password" v-model="password"></mt-field>
                <mt-field label="确认密码" placeholder="请输入确认密码" type="password" v-model="password2"></mt-field>
                <mt-field label="手机号" placeholder="请输入手机号" type="tel" v-model="mobile"></mt-field>
            </div>
            <div class="lo" @click="ToLogin">还没有账号？注册</div>
            <mt-button type="primary" class="btn" @click="reg">注册</mt-button>
        </div>
  </div>
</template>

<script>
    import Vue from 'vue';
    import {Header, Button, Field, Toast} from 'mint-ui';
    import 'mint-ui/lib/style.css'

    const axios = require('axios');

    Vue.component(Header.name, Header);
    Vue.component(Button.name, Button);
    Vue.component(Field.name, Field);

    export default {
        name: '',
        data() { 
            return {
                username:'',
                password:'',
                password2:'',
                mobile:'',
                showRegister:false,
                showLogin:true,
            }
        },
        methods:{
            go(){
                this.$router.push('/my')
            },
            login(){
                axios.post('http://localhost:3000/login',{
                    username:this.username,
                    password:this.password
                }).then((response) => {
                    console.log(response.data)
                    if(response.data.ok){
                        Toast({
                            message: '登录成功',
                            iconClass: 'icon icon-success'
                        });
                        //登录成功后，把服务端返回的token保存到localStorage
                        window.localStorage.setItem('token', response.data.token)
                        //把当前登录用户的信息保存到localStorage
                        window.localStorage.setItem('username', response.data.user.username)
                        window.localStorage.setItem('id', response.data.user.id)
                        this.$router.push('/')
                    }else{
                        Toast(response.data.msg);
                    }
                })
            },
            ToLogin(){
                this.showRegister=false,
                this.showLogin=true,
                this.username = '',
                this.password = '',
                this.password2 = '',
                this.mobile = ''
            },
            ToRegister(){
                this.showRegister=true,
                this.showLogin=false,
                this.username = '',
                this.password = '',
                this.password2 = '',
                this.mobile = ''
                
            },
            reg(){
                axios.post('http://localhost:3000/register',{
                    username:this.username,
                    password:this.password,
                    password2:this.password2,
                    mobile:this.mobile
                },{
                    headers: {'Content-Type': 'application/json;charset=utf-8'}
                }).then((response) => {
                    console.log(response.data)
                    if(response.data.ok){
                        Toast({
                            message: '注册成功',
                            iconClass: 'icon icon-success'
                        });
                        this.showRegister=false,
                        this.showLogin=true,
                        this.password=''
                    }else{
                        Toast(response.data.msg);
                    }
                })
            }
        },
    mounted() {
        document.querySelector('body').setAttribute('style', 'background-color:#f8f5f5');
    },
    beforeDestroy() {
        document.querySelector('body').removeAttribute('style')
    },
    }
</script>

<style scoped>
body{
    background-color: #f8f5f5;
}
.re{
    text-align: right;
    margin-right: 5%;
    color:blue;
}
.container{
    padding-top:40px;
    padding-bottom:60px;
}
.btn{
    margin-top:10px;
    width: 100%;
}
.reg{
    width: 100%;
    height: 100%;
    background-color: #f8f5f5;
}
.lo{
    text-align: right;
    margin-right: 5%;
    color:blue;
    background-color: #f8f5f5;
}
.container{
    padding-top:40px;
    padding-bottom:60px;
}
.btn{
    margin-top:10px;
    width: 100%;
}
</style>