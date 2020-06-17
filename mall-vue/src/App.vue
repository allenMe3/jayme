<template>
  <div id="app">
    <!-- <router-view/> -->
    <!-- <mt-tab-container v-model="selected">
      <mt-tab-container-item :id="idList[index]" v-for="(tab,index) in tabList" :key="index">
       
      </mt-tab-container-item>
    </mt-tab-container> -->
    <router-view v-if="isRouterAlive"></router-view>
      <aplayer class="aplayer1" style="position: fixed;background-color: #fdfbfb;color:#051624;margin-left:-0.1%;"
              :style="{marginBottom:num}"
              :audio="audio" v-if="$route.meta.keepAlive1"></aplayer>
      <mt-tabbar v-model="selected" fixed v-if="$route.meta.keepAlive">
        <mt-tab-item :id="idList[index]" v-for="(tab,index) in tabList" :key="index">
          <span class="icon iconfont" :class="tab.icon"></span>
          <p class="tab-name">{{tab.name}}</p>
        </mt-tab-item>
      </mt-tabbar>
    
  </div>
</template>

<script>
  import Vue from 'vue';
  import { Tabbar, TabItem, TabContainer, TabContainerItem, Cell } from 'mint-ui';
  import 'mint-ui/lib/style.css';
  import { mapState } from 'vuex'

  Vue.component(Tabbar.name, Tabbar);
  Vue.component(TabItem.name, TabItem);
  Vue.component(TabContainer.name, TabContainer);
  Vue.component(TabContainerItem.name, TabContainerItem);
  Vue.component(Cell.name, Cell);

  const axios = require('axios');

  export default {
    
    name:'app',
  //  components: {
  //     // aplayer
  //     aplayer: aplayer
  //   },
    provide(){
      return{
        reload:this.reload
      }
    },
    data() { 
      return {
        idList:['index','category','cart','my'],
        tabList:[
          {name:'首页',icon:'icon-zhuye'},
          {name:'贴吧',icon:'icon-tieba1'},
          {name:'音乐',icon:'icon-yinyue1'},
          {name:'我的',icon:'icon-wode'}
        ],
        selected:'index',
        musicLists:[],
        isRouterAlive:true,
        audio: {
        name: this.$store.state.name1,
        artist: '周杰伦',
        url: this.$store.state.src1,
        cover:this.$store.state.img1
        // lrc: 'https://cdn.moefe.org/music/lrc/thing.lrc',
      },
      num:'0px'
      }
    },
    methods:{
      getMusicList(){
      console.log("请求音乐列表数据")
        axios.get('http://localhost:3000/music/all')
          .then((response) => {
            this.musicLists = response.data
            // console.log(response.data);
          })               
      },
      reload(){
        this.isRouterAlive = false
        this.$nextTick(function(){
          this.isRouterAlive = true
        })
      }
    },
    watch:{
      //侦听selected属性的值变化来得到当前tabbar的选项
      selected:function(val, oldVal){
        // console.log("改变前的"+oldVal)
        switch(val){
          case "index":
            this.$router.push('/')//切换到首页
            break;
          case "category":
            this.$router.push('/category')//切换到分类页
            break;
          case "cart":
            this.$router.push('/cart')//切换到购物车页
            break;
          case "my":
            this.$router.push('/my')//切换会员中心页
            break;
        }
      },
       $route(to,from){
        switch(to.path){
          case "/":
            this.selected = 'index'
            break;
          case "/category":
            this.selected = 'category'
            break;
          case "/cart":
           this.selected = 'cart'
            break;
          case "/my":
            this.selected = 'my'
            break;
        }
      },
      '$store.state.name1':function(val, oldVal){
       this.audio.name = this.$store.state.name1
      },
      '$store.state.src1':function(val, oldVal){
        this.audio.url = this.$store.state.src1
      },
      '$store.state.img1':function(val, oldVal){
        console.log(this.$store.state.img1);
        this.audio.cover = this.$store.state.img1
      },
      '$route.meta.keepAlive':function(val,oldVal){
         switch(val){
          case true:
            this.num = '0px'
            break;
          case undefined:
            this.num = '-55px'
            break;
        }
      },
    },
    mounted() {
    this.getMusicList();
    this.$router.push('/')
  },
  }
</script>

<style>
*{
  margin:0;
  padding:0;
  border:0;
}
.aplayer1{
  
  bottom: 55px;
  width: 100%;
  background-color: black;
}
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  /* text-align: center; */
  color: #2c3e50;
}
.house{
  position: absolute;
  top: 50px;
}


#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}

.mint-tab-item .iconfont{
  font-size: 30px;
}
.mint-tab-item .tab-name{
  font-size: 12px;
  margin:5px 0 0 0;
}
.details img{
  width: 100%
}
*{
  font-size:12px;
}
</style>
