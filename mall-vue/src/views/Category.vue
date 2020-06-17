<template>
  <div class="category">
    <mt-header fixed title="贴吧"></mt-header>
    <!-- 贴吧列表 -->
    <div class="release" @click="Release">+</div>
    <div class="room" v-for="(commentList,index) in commentList" :key="index">
      <div class="room_room"  @click="go(commentList.id)">
      <div style="width:20%">
        <img src="../assets/images/jay.jpeg" class="headshot">
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
      <div class="room_small icon iconfont icon-pinglun"  @click="go(commentList.id)"> {{commentList.comment_cout}}</div>
      <div class="room_small icon iconfont icon-dianzan_active" @click="like(commentList.id)"> {{commentList.likeit}}</div>
    </div>
    <div style="height:120px;"></div>
  </div>
</template>

<script>
  import Vue from 'vue';
  import { Header, Toast, MessageBox } from 'mint-ui';
  import 'mint-ui/lib/style.css'

  var common = require('../assets/js/common')
  const axios = require('axios');

  Vue.component(Header.name, Header);

  export default {
    inject:['reload'],
    data() { 
      return {
        categories:[],
        commentList:[],
        count:[]
      }
    },
    methods:{
      Release(){
        this.$router.push('/comment')
      },
      getCommentList(){
        console.log("请求帖子数据")
        axios.get('http://localhost:3000/category/all')
          .then((response) => {
            this.commentList = response.data
            console.log(response.data)
            console.log(this.commentList);
          })
      },
      getcount(id){
                console.log("请求评论数")
                axios.get(`http://localhost:3000/comment/count/${id}`)
                    .then((response) => {
                        console.log(response.data)
                        this.count = response.data[0]
                    })                
            },
      formarCreateTime(create_time){
                return common.dateFormat("YYYY-mm-dd HH:MM:SS", new Date(create_time))
      },
      go(id){
        this.$router.push(`/comment_son/${id}`)
      },
      like(id){
        axios.post(`http://localhost:3000/category/like/${id}`,{
          
        },
        {
          headers: {'authorization': window.localStorage.getItem('token')}
        }).then((response) => {
          if(response.data.ok){
            Toast({
              message: '点赞成功',
              iconClass: 'icon icon-success'
            });
            this.reload()
            }else{
              Toast({
                message: response.data.msg
              });
            }
        })
      }
    },
    //元素挂载完毕后触发
    mounted(){
      document.querySelector('body').setAttribute('style', 'background-color:#f8f5f5');
      this.getCommentList()

      
      
    }, 
    beforeDestroy() {
      document.querySelector('body').removeAttribute('style')
    },
  }
</script>

<style scoped>
  .category{
    padding-top:40px;
   
  }
  .release{
    background-color: rgb(236, 52, 19);
    position: fixed;
    font-size: 30px;
    border-radius: 50%;
    bottom: 130px;
    right: 30px;
    width: 40px;
    height: 40px;
    text-align: center;
    line-height: 42px;
    color: white;
  }
  .headshot{
    width:30px;
    height: 30px;
    border-radius: 50%;
  }
  .room{
    margin: 3%;
    padding: 5%;
    display: flex;
    flex-wrap: wrap;
    background-color: #f8f5f5;
    color: #051624;
  }
  .room_room{
    width: 100%;
    display: flex;
    flex-wrap: wrap;
    background-color: #f8f5f5;
  }
  .room_son{
    width:80%;
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
    width: 100%;
    word-break: break-all;
  }
  .room_small{
    width: 49%;
    text-align: center;
    /* border: 1px solid gray; */
    margin-top: 4%;
  }
</style>