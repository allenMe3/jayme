<template>
  <div class="container">
      <mt-header fixed title="个人页面">
          <mt-button icon="back" slot="left" @click="$router.go(-1)">返回</mt-button>
      </mt-header>
      <!-- 会员信息 -->
      <div class="member-info">
        <div class="headshot-box">
          <img src="../assets/images/jay.jpeg" class="headshot" @click="my(username)"/>
          <div class="name">{{username}}</div>
          <div v-for="(user,index) in users" :key="index">{{user.signature}}</div>
        </div>
      </div>
      <!-- 菜单 -->
      <div class="uuu">
      <div class="zhuye">主页</div>
      <div class="room" v-for="(commentList,index) in commentList" :key="index">
      <div class="room_room"  @click="go(commentList.id)">
      <div style="width:20%">
        <img src="../assets/images/jay.jpeg" class="headshot1">
      </div>
      <div class="room_son">
        <div class="room_son_son">
          {{commentList.user_name}}
        </div>
        <div class="room_son_son1">
          {{formarCreateTime(commentList.create_time)}}
        </div>
      </div>
      <div class="room_son1">{{commentList.content}}</div>
      </div>
    </div>
    </div>
     <div style="height:80px"></div>
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
        username: this.$route.params.name,
        commentList:[],
        users:[]
      }
    },
    methods:{
      go(id){
              this.$router.push(`/notice_son/${id}`)
      },
      formarCreateTime(create_time){
                return common.dateFormat("YYYY-mm-dd", new Date(create_time))
      },
      getCommentList(name){
        console.log("请求帖子数据")
        axios.get(`http://localhost:3000/category/commentList1/${name}`)
          .then((response) => {
            this.commentList = response.data
            console.log(response.data)
          })
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
    },
    mounted(){
      document.querySelector('body').setAttribute('style', 'background-color:#fcfafa');
      console.log(this.$route.params.name);
      this.getCommentList(this.$route.params.name)
      this.getuser(this.$route.params.name)
      
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
    background-color: #f8f5f5;
    align-items: center;
    height: 150px;
    color:#051624;
    justify-content:center;
    border-radius: -5%;
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
  .name{
    margin-top: 5px;
    font-size: 20px;
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
  .uuu{
      border-top: 1px solid #cccccc;
      background-color: #fcfafa;
      padding-top: 5%;
  }
  .zhuye{
      font-weight: bold;
      font-size: 16px;
      margin-left: -70%;
  }
 .headshot1{
    width:30px;
    height: 30px;
    border-radius: 50%;
  }
  .room{
    margin: 3%;
    padding: 5%;
    display: flex;
    flex-wrap: wrap;
    background-color: #fcfafa;
    color: #051624;
  }
  .room_room{
    width: 100%;
    display: flex;
    flex-wrap: wrap;
    background-color: #fcfafa;
  }
  .room_son{
    width:80%;
    text-align: left;
    margin-left: -30%;
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
    margin-left: 10%;
    margin-top: 2%;
    text-align: left;
    font-size: 20px;
    width: 100%;
    word-break: break-all;
  }
</style>