<template>
  <div class="container">
       <mt-header fixed title="设置">
            <mt-button icon="back" slot="left" @click="go">返回</mt-button>
        </mt-header>
        <div style="height:50px"></div>
        <div @click="modpass">
        <mt-cell
            title="修改密码"
            is-link>
        </mt-cell></div>
        <div @click="modsign">
        <mt-cell
            title="修改签名"
            is-link>
        </mt-cell></div>
        
  </div>
</template>

<script>
    import Vue from 'vue';
    import {Header, Button, Toast} from 'mint-ui';
    import 'mint-ui/lib/style.css'
    import { Cell } from 'mint-ui';

    const axios = require('axios');
    
    Vue.component(Cell.name, Cell);
    Vue.component(Header.name, Header);
    Vue.component(Button.name, Button);

    export default {
        name: '',
        data() { 
            return {
               username: window.localStorage.getItem('username')
            }
        },
        computed:{
            
        },
        methods:{
            getMusicList(id){
                console.log("请求音乐列表数据")
                axios.get('http://localhost:3000/login/all')
                    .then((response) => {
                    this.musicLists = response.data
                    })
            },
            modpass(){
                this.$router.push('/modpass')
            },
            modsign(){
                this.$router.push('/modsign')
            },
            go(){
                this.$router.push('/my')
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

<style scoped>

</style>