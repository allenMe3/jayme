<template>
<div id='aaa'>
    <mt-header fixed title="Jay">
           <mt-button icon="back" slot="left" @click="$router.go(-1)">返回</mt-button>
        </mt-header>
        <div style="height:200px;"></div>
<mt-navbar v-model="selected" style="background-color:#f8f5f5">
  <mt-tab-item id="1">简介</mt-tab-item>
  <mt-tab-item id="2">基本信息</mt-tab-item>
  <mt-tab-item id="3">从艺生涯</mt-tab-item>
  <mt-tab-item id="4">荣誉奖项</mt-tab-item>
</mt-navbar>

<!-- tab-container -->
<mt-tab-container v-model="selected">
  <mt-tab-container-item id="1" style="background-color: #f8f5f5;color: #051624;">
    <div style="margin: 2% 10%;font-size: 15px;">周杰伦（Jay Chou），1979年1月18日出生于台湾省新北市，华语流行男歌手、演员、词曲创作人、MV及电影导演、编剧及制作人。2000年被吴宗宪发掘，发行首张个人专辑《Jay》。 2001年发行专辑《范特西》。2002年在中国、新加坡、马来西亚、美国等地举办首场个人世界巡回演唱会。 2003年登上美国《时代周刊》亚洲版封面人物。 周杰伦的音乐融合中西方元素，风格多变，四次获得世界音乐大奖最畅销亚洲艺人。凭借专辑《Jay》、《范特西》、《叶惠美》及《跨时代》四次获得金曲奖"最佳国语专辑"奖，并凭借《魔杰座》、《跨时代》获得第20届和第22届金曲奖“最佳国语男歌手”奖； 2005年开始涉足影视，以电影《头文字D》获第42届台湾电影金马奖及第25届香港电影金像奖“最佳新人”奖。 2006年起连续三年获得世界音乐大奖中国区最畅销艺人奖。 2007年自立门户，成立JVR（杰威尔）有限公司，自编自导自演的电影《不能说的秘密》获得第44届台湾电影金马奖“年度台湾杰出电影”奖。 2008年凭借歌曲《青花瓷》获得第19届金曲奖最佳作曲人奖。 2009年入选美国CNN亚洲极具影响力人物；同年凭借专辑《魔杰座》获得第20届金曲奖最佳国语男歌手奖。 2010年入选美国《Fast Company》评出的“全球百大创意人物”。 2011年凭借专辑《跨时代》再度获得金曲奖最佳国语男歌手奖，并且第4次获得金曲奖最佳国语专辑奖；同年主演好莱坞电影《青蜂侠》。 2012年登福布斯中国名人榜榜首。 2013年自编自导自演第二部电影《天台爱情》取得了不俗的票房与口碑。 2014年加盟好莱坞电影《惊天魔盗团2》；同年发行华语乐坛首张数字音乐专辑《哎呦，不错哦》。 娱乐圈外，周杰伦在2011年跨界担任华硕（ASUS）笔电外观设计师并入股香港文化传信集团。2012在中国内地开设真爱范特西连锁KTV。 除了力拼自己的事业，周杰伦还热心公益慈善活动，多次向内地灾区捐款并与众多艺人募款新建希望小学。 2014年获QQ音乐年度盛典“港台最受欢迎男歌手”及压轴大奖“最佳全能艺人”。 2015年担任《中国好声音 第四季》导师。 2016年发行演唱会专辑《周杰伦魔天伦世界巡回演唱会》；同年推出专辑《周杰伦的床边故事》。 2017年，确认加盟原创专业音乐节目《中国新歌声第二季》。</div>
  </mt-tab-container-item>
  <mt-tab-container-item id="2" style="background-color: #f8f5f5;color: #051624;">
    <div style="margin: 2% 10%;font-size: 15px;">
        <p>中文名：周杰伦</p> 
        <p>外文名：Jay Chou</p>
        <p>国籍：中国</p>
        <p>出生地：台湾省新北市</p>
        <p>职业：音乐人、制作人、导演、企业家等</p>
        <p>经纪公司：杰威尔音乐有限公司</p>
        <p>身高：175cm</p>
        <p>血型：O型</p>
        <p>出生日期：1979年1月18日（农历腊月二十）</p>
        <p>星座：摩羯座</p>
        <p>代表作品：《龙卷风》、《菊花台》、《青花瓷》、《晴天》</p>
        <p>生肖：马</p>
        <p>毕业院校：淡江中学音乐科</p>
        <p>主要成就：四届世界音乐大奖最畅销亚洲艺人、中华区8次年度销量冠军（最多）、悉尼演唱会票房美国公告牌第二、美国CNN亚洲最具影响力人物、2012年福布斯中国名人榜第一、MTV日本录影带奖亚洲杰出艺人、两届MTV亚洲大奖最受欢迎艺人、连续7年IFPI十大销量国语唱片、华语乐坛十年领袖人物、华语乐坛十年最佳男歌手、中国十大青年领袖、MTV亚洲大奖最受欢迎男歌手、美国MTV电影最佳新人提名、世界十大鬼才音乐人之一、QQ音乐年度盛典最佳全能艺人</p>
    </div>
  </mt-tab-container-item>
  <mt-tab-container-item id="3" style="background-color: #f8f5f5;color: #051624;">
    <p style="margin: 2% 10%;font-size: 15px;" v-for="(jay,index) in jayList" :key="index">{{jay.content}}</p>
  </mt-tab-container-item>
  <mt-tab-container-item id="4" style="background-color: #f8f5f5;color: #051624;">
    <p style="margin: 2% 10%;font-size: 15px;">音乐奖项</p>
    <p style="margin: 2% 10%;font-size: 15px;" v-for="(honor,index) in honor" :key="index">{{honor.content}}</p>
  </mt-tab-container-item>
</mt-tab-container>
<div style="height:65px;"></div>
</div>
</template>

<script>
    import Vue from 'vue';
    import {Header, Button, Toast, MessageBox } from 'mint-ui';
    import 'mint-ui/lib/style.css'
    import { Actionsheet } from 'mint-ui';
    import { Navbar, TabItem } from 'mint-ui';



    const axios = require('axios');

    Vue.component(Navbar.name, Navbar);
    Vue.component(TabItem.name, TabItem);
    Vue.component(Header.name, Header);
    Vue.component(Button.name, Button);
    export default {
        data(){
            return{
                selected:'1',
                jayList:[],
                honor:[]
            }
        },
        methods:{
            getjayList(){
                axios.get('http://localhost:3000/jay/all')
                .then((response) => {
                    this.jayList = response.data
                })
                },
                getjayhonor(){
                axios.get('http://localhost:3000/jay/honor')
                .then((response) => {
                    this.honor = response.data
                })
                },
            },
        mounted(){
      this.getjayList()
      this.getjayhonor()
      
      
    },
    }
</script>

<style>
    #aaa{
        width: 100%;
        height: 100%;
        background-image:url("../assets/images/jay1.jpg");
        background-size:100%; 
    }
    p{
        margin: 10%;
        font-size: 15px;
        margin: 0;
    }
    .jayone{
        margin: 10%;
        padding: 5%;
        background-color: #f8f5f5;
        color: gray;
        font-size: 20px;
    }
</style>