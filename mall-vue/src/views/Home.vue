<template>
  <div class="home">
    <mt-header fixed title="首页"></mt-header>
    <!-- Banner轮播图 -->
    <div style="height:200px;">
      <mt-swipe :auto="4000">
        <mt-swipe-item v-for="(banner,index) in banners" :key="index">
          <img :src="banner.src" class="banner-img"/>
        </mt-swipe-item>
      </mt-swipe>
    </div>
    <div class="shortcut">
        <div class="shortcut-item" @click="notice">
          <p class="icon iconfont icon-tongzhi shortcut-icon" ></p>
          通知
        </div>
        <div class="shortcut-item" @click="jay">
          <p class="icon iconfont icon-hongxin shortcut-icon" ></p>
          Jay
        </div>
      </div>
    <div class="room" v-for="(news,index) in news" :key="index">
      <div style="width:20%">
        <img src="../assets/images/jay2.jpg" class="headshot">
      </div>
      <div class="room_son">
        <div class="room_son_son">
          周杰伦
        </div>
        <div class="room_son_son1">
          {{formarCreateTime(news.time)}}
        </div>
      </div>
      <div class="room_son1">{{news.content}}</div>
      <img :src=news.img class="img">
    </div>
    <div style="height:120px;"></div>
  </div>
</template>

<script>
  import Vue from 'vue';

  import { Swipe, SwipeItem, Header } from 'mint-ui';
  import 'mint-ui/lib/style.css'
  
  var common = require('../assets/js/common')
  const axios = require('axios');

  Vue.component(Swipe.name, Swipe);
  Vue.component(SwipeItem.name, SwipeItem);
  Vue.component(Header.name, Header);

  export default {
    name: 'home',
    
    data() {
      return {
        banners:[],
        news:[]
      }
    },
    methods:{
      getNew(){
        axios.get('http://localhost:3000/banner/new')
          .then((response) => {
            this.news = response.data
          })
      },
      getBanner(){
        axios.get('http://localhost:3000/banner/all')
          .then((response) => {
            this.banners = response.data
          })
      },
      formarCreateTime(time){
                return common.dateFormat("YYYY-mm-dd HH:MM:SS", new Date(time))
      },
      notice(){
        this.$router.push('/notice')
      },
      jay(){
        this.$router.push('/jay')
      }
    },
    mounted(){
      this.getBanner();  
      this.getNew();   
      document.querySelector('body').setAttribute('style', 'background-color:#f8f5f5');
    },
    beforeDestroy() {
      document.querySelector('body').removeAttribute('style')
    },
  }

  

</script>

<style scoped>
@import url('../assets/font/iconfont.css');
  *{
    text-align: center;
  }
  .aplayer{
    margin-left:-0.1% ;
    bottom: 50px;
    width: 100%;
  }  
  .img{
    margin-left: 5%;
    width:auto;
    height: 150px;
  }
  .headshot{
    width:30px;
    height: 30px;
    border-radius: 50%;
  }
  .room{
    margin-top: 10px;
    margin-left: -15px;
    padding: 3%;
    display: flex;
    flex-wrap: wrap;
    background-color: #f8f5f5;
    color: #051624;
  }
  .room_son{
    margin-left: -25%;
    width:80%;
    text-align: left;
    line-height: 20px;
  }
  .room_son_son{
    font-size: 21px;
  }
  .room_son_son1{
    font-size: 10px;
    color: gray;
  }
  .room_son1{
    margin-left: 5%;
    margin-top: 2%;
    text-align: left;
    font-size: 18px;
    width: 100%;
    word-break: break-all;
  }
  p,ul{
    margin:0;
    padding:0;
  }
  .home{
    padding-top:40px;
    padding-bottom:60px;
  }
  .banner-img{
    width: 100%;
    height: 100%;
  }
  .iconn{
    margin-top: 10px;
  }
  .shortcut{
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    background-color: #f8f5f5;
  }
  .shortcut-item{
    flex:1;
    font-size: 13px;
    color: #051624;
  }
  .shortcut-icon{
    font-size: 35px;
    margin:5px 0;
    color: #24e02d;
  }
  
</style>