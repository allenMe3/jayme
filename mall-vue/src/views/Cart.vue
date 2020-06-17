<template>
    <div>
      <mt-header fixed title="音乐列表"></mt-header>
      <div style="padding:10px 0;">
      </div>
      <div style="height:15px;"></div>
      <div class="roomm" v-for="(musicList,index) in musicLists" :key="index" @click="play(musicList.src,musicList.name,musicList.img)">
        <div class="roomm_son">
          <div class="roomm_son_son">
            {{musicList.sort}} {{musicList.name}}
          </div>
        </div>
        <div style="color:gray">周杰伦</div>
      </div>
      <div style="height:120px;"></div>
    </div>
</template>  
  
<script>
import Vue from 'vue';
import APlayer from '@moefe/vue-aplayer';
import { mapState } from 'vuex'

Vue.use(APlayer);

const axios = require('axios');
 
export default {
  data() {
    return {
      musicLists:[]
    }
  },
  methods:{
    //请求音乐列表
    getMusicList(){
        axios.get('http://localhost:3000/music/all')
          .then((response) => {
            this.musicLists = response.data
          })
    },
    //获取音乐数据
    play(src,name,img){
      window.localStorage.setItem('title', name)
      window.localStorage.setItem('src', src)
      window.localStorage.setItem('img', img)
      var music = {
          name1 : name,
          src1 : src,
          img1 : img
      }
      this.$store.commit("update", music)
    }
  },
  mounted() {
    document.querySelector('body').setAttribute('style', 'background-color:#f8f5f5');
    this.getMusicList();
  },
  beforeDestroy() {
      document.querySelector('body').removeAttribute('style')
    },
};
</script>  
  
<style>
   .roomm{
    margin: 2%;
    padding: 5%;
    display: flex;
    flex-wrap: wrap;
    background-color: #f8f5f5;
    color: #051624;
  }
  .roomm_son{
    width:85%;
    text-align: left;
    line-height: 20px;
  }
  .roomm_son_son{
    font-size: 15px;
    
  }

</style>  