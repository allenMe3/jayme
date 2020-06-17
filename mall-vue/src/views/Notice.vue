<template>
  <div class="container">
    <mt-header fixed title="通知">
        <mt-button icon="back" slot="left" @click="back">返回</mt-button>
    </mt-header>
    <div style="height:50px"></div>
    <div class="room1" v-for="(notices,index) in noticeList" :key="index" @click="go(notices.comment_id)">
      <div style="width:20%">
        <img src="../assets/images/jay.jpeg" class="headshot">
      </div>
      <div class="room_son">
        <div class="room_son_son">
          {{notices.user_name}}
        </div>
      </div>
      <div class="room_son1">{{notices.content}}</div>
    </div>
    <div style="height:120px;"></div>
  </div>
  
</template>

<script>
    import Vue from 'vue';
    import {Header, Button, Toast, MessageBox} from 'mint-ui';
    import 'mint-ui/lib/style.css'
    
    var common = require('../assets/js/common')
    const axios = require('axios');

    Vue.component(Header.name, Header);
    Vue.component(Button.name, Button);
    export default {
      name:'',
      data(){
        return{
          noticeList:[],
          name:window.localStorage.getItem('username')
        }
      },
      methods:{
          back(){
              this.$router.push('/')
            },
           getNotice(){
                console.log("请求收藏内容")
                axios.post('http://localhost:3000/comment/noticeList',{
                    username:this.name
                })
                .then((response) => {
                    this.noticeList = response.data   
                    console.log(response.data);
                                
                })
            },
            go(id){
              this.$router.push(`/notice_son/${id}`)
            }
        },
      mounted(){
        document.querySelector('body').setAttribute('style', 'background-color:#f8f5f5');
        this.getNotice();      
        console.log(window.localStorage.getItem('username'));
        
    },
    beforeDestroy() {
            document.querySelector('body').removeAttribute('style')
        },
    }
    
</script>

<style>
  .headshot{
    width:30px;
    height: 30px;
    border-radius: 50%;
    border:2px solid #FFFFFF;
  }
  .room{
    margin: 10% 0;
    padding: 5%;
    display: flex;
    flex-wrap: wrap;
    background-color: #f8f5f5;
  }
  .room1{
    margin: 2% 5%;
    padding: 5%;
    display: flex;
    flex-wrap: wrap;
    background-color: #f8f5f5;
    color: #051624;
  }
  .room_son{
    width:75%;
    text-align: left;
    line-height: 20px;
  }
  .room_son_son{
    font-size: 24px;
    font-weight: bold;
  }
  .room_son_son1{
    font-size: 10px;
    color: gray;
  }
  .room_son1{
    margin-left: 5%;
    margin-top: 2%;
    text-align: left;
    font-size: 20px;
  }
</style>