<template>
  <div class="container">
    <mt-header fixed title="修改签名">
        <mt-button icon="back" slot="left" @click="$router.go(-1)">返回</mt-button>
        <mt-button slot="right" @click="mod">确认修改</mt-button>
    </mt-header>
    <div style="height:50px"></div>
    <mt-field label="签名" placeholder="请输入" v-model="signature"></mt-field>
  </div>
</template>

<script>
    import Vue from 'vue';
    import {Header, Button, Toast, MessageBox} from 'mint-ui';
    import 'mint-ui/lib/style.css'
    import { Field } from 'mint-ui'
    

    const axios = require('axios');

    Vue.component(Field.name, Field);
    Vue.component(Header.name, Header);
    Vue.component(Button.name, Button);
    export default {
      name:'',
      data(){
        return{
          signature:'',
          name:window.localStorage.getItem('username')
        }
      },
      methods:{
            mod(){
                axios.post('http://localhost:3000/login/modsign',{
                    signature:this.signature,
                    name:this.name
                },{
                    headers: {'Content-Type': 'application/json;charset=utf-8'},
                    headers: {'authorization': window.localStorage.getItem('token')}
                }).then((response) => {                 
                    if(response.data.ok){
                      Toast('修改成功');
                      this.$router.push('/my') 
                      }else{
                        Toast({
                          message: response.data.msg
                        });
                    }                
                })
            }
        },
      mounted(){
            document.querySelector('body').setAttribute('style', 'background-color:#f8f5f5');
        },
        beforeDestroy() {
            document.querySelector('body').removeAttribute('style')
        },
    }
    
</script>

<style>

</style>