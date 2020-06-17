<template>
  <div>
        <mt-header fixed title="帖子详情">
           <mt-button icon="back" slot="left" @click="$router.go(-1)">返回</mt-button>
           <mt-button slot="right" @click="Release(comments.id,comments.user_name)">回帖</mt-button>
        </mt-header>
    <!-- 帖子内容 -->
    <div class="room">
      <div style="width:20%">
        <img src="../assets/images/jay.jpeg" class="headshot">
      </div>
      <div class="room_son">
        <div class="room_son_son">
          {{comments.user_name}}
        </div>
        <div class="room_son_son1">
          {{formarCreateTime(comments.create_time)}}
        </div>
      </div>
      <div class="icon iconfont icon-shoucang-copy" @click="collect(comments.id)"></div>
      <div class="room_son1">{{comments.content}}</div>
    </div>
    <!-- 评论回复 -->
    <div class="room1" v-for="(commentList,index) in commentList" :key="index">
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
    <div style="height:120px;"></div>
  </div>
</template>

<script>
    import Vue from 'vue';
    import {Header, Button, Toast, MessageBox } from 'mint-ui';
    import 'mint-ui/lib/style.css'
    import { Actionsheet } from 'mint-ui';


    var common = require('../assets/js/common')

    const axios = require('axios');

    Vue.component(Actionsheet.name, Actionsheet);
    Vue.component(Header.name, Header);
    Vue.component(Button.name, Button);

    export default {
        name: '',
        data() { 
            return {
                comments:[],
                commentList:[],
                username:window.localStorage.getItem('username')
            }
        }, 
        methods:{
            Release(id,user_name){
              this.$router.push({name:'comment1',params:{id:id,username:user_name}})
            },
            getCommentList(id){
                console.log("请求帖子内容")
                axios.get(`http://localhost:3000/comment/list/${id}`)
                    .then((response) => {
                        console.log(response.data)
                        this.commentList = response.data
                    })                
            },
            formarCreateTime(create_time){
                return common.dateFormat("YYYY-mm-dd HH:MM:SS", new Date(create_time))
            },
            getComment(id){
                console.log("请求回帖内容")
                axios.get(`http://localhost:3000/category/commentList/${id}`)
                .then((response) => {
                    this.comments = response.data[0]
                    console.log(response.data)
                })
            },
            collect(id){
                    axios.post(`http://localhost:3000/comment/collect/${id}`,
                        {
                            collect:this.comments,
                        
                        },{
                            headers: {'authorization': window.localStorage.getItem('token')}
                        }).then((response) => {
                            if(response.data.ok){
                                Toast({
                                    message: '收藏成功',
                                    iconClass: 'icon icon-success'
                                });                            
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
            console.log("元素挂载完成....")
            console.log("参数id:"+this.$route.params.id)           
            this.getComment(this.$route.params.id)
            this.getCommentList(this.$route.params.id)        
        },
        beforeDestroy() {
            document.querySelector('body').removeAttribute('style')
        },
    }
</script>

<style scoped>
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
    color: #051624;
  }
  .room1{
    margin: 2% 5%;
    padding: 5%;
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
  }
</style>