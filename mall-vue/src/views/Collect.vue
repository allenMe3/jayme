<template>
  <div class="container">
    <mt-header fixed title="我的收藏">
        <mt-button icon="back" slot="left" @click="$router.go(-1)">返回</mt-button>
    </mt-header>
    <div style="height:50px"></div>
    <div class="room1" v-for="(collects,index) in collectList" :key="index">
      <div class="room2" @click="go(collects.comment_id)">
        <div style="width:18%">
          <img src="../assets/images/jay.jpeg" class="headshot">
        </div>
      <div class="room_son">
        <div class="room_son_son">
          {{collects.re_name}}
        </div>
      </div>
      <div class="room_son1">{{collects.content}}</div>
    </div>
      <div style="color:blue;width:9%;text-align:center" @click="del(collects.comment_id)">删除</div>
    </div>
     <div style="height:100px;"></div>
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
      inject:['reload'],
      name:'',
      data(){
        return{
          collectList:[],
          name:window.localStorage.getItem('username')
        }
      },
      methods:{
           getCollect(){
                console.log("请求收藏内容")
                axios.post('http://localhost:3000/comment/collectList',{
                    username:this.name
                })
                .then((response) => {
                    this.collectList = response.data   
                    console.log(response.data);
                                
                })
            },
            del(id){
                console.log("请求收藏内容")
                axios.post(`http://localhost:3000/comment/collectdel/${id}`,{
                    
                })
                .then((response) => {  
                  if(response.data.ok){
                    Toast('删除成功');
                    this.reload() 
                    }else{
                      Toast({
                        message: response.data.msg
                      });
                    }    
                                                  
                })
            },
            go(id){
              this.$router.push(`/notice_son/${id}`)
            }
        },
      mounted(){
        document.querySelector('body').setAttribute('style', 'background-color:#f8f5f5');
        this.getCollect();      
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
    background-color:#f8f5f5;
    color: #051624;
  }
  .room1{
    margin: 2% 5%;
    padding: 5%;
    display: flex;
    flex-wrap: wrap;
    background-color: #f8f5f5;
    color: #051624;
  }
  .room2{
    width: 90%;
    display: flex;
    flex-wrap: wrap;
    background-color: #f8f5f5;
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
    word-break: break-all;
  }
</style>