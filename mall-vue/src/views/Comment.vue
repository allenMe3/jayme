<template>
  <div class="container">
    <mt-header fixed title="发布到贴吧">
        <mt-button icon="back" slot="left" @click="$router.go(-1)">返回</mt-button>
        <mt-button slot="right" @click="comment">发布</mt-button>
    </mt-header>
    <div class="comment-list">
        <div class="comment">
            <mt-field placeholder="请输入内容" type="textarea" 
                    rows="9" v-model="comments"></mt-field>
        </div>
    </div>
  </div>
  
</template>

<script>

    import Vue from 'vue';
    import {Header, Button, Field, Toast, MessageBox} from 'mint-ui';
    import 'mint-ui/lib/style.css'

    Vue.component(Header.name, Header);
    Vue.component(Button.name, Button);
    Vue.component(Field.name, Field);

    const axios = require('axios');

    export default {
        name: '',
        data() { 
            return {
                comments:[],
                username:window.localStorage.getItem('username')
            }
        },
        methods:{
            comment(){
                    axios.post('http://localhost:3000/comment/create',
                        {
                            content:this.comments,
                            username:this.username
                        },{
                            headers: {'authorization': window.localStorage.getItem('token')}
                        }).then((response) => {
                            if(response.data.ok){
                                Toast({
                                    message: '发布成功',
                                    iconClass: 'icon icon-success'
                                });
                                this.$router.push('/category')
                            }else{
                                Toast({
                                    message: response.data.msg
                                });
                            }
                    })
            },

        },
    mounted() {
        document.querySelector('body').setAttribute('style', 'background-color:#f8f5f5');
    },
    beforeDestroy() {
        document.querySelector('body').removeAttribute('style')
    },
    }
</script>

<style scoped>
    .container{
        padding-top:40px;
        padding-bottom:60px;
    }
    .name{
        text-align: left;
        padding:5px;
    }
    .comment{
        border:1px solid #EFEFEF;
        margin-bottom: 10px;
        padding:5px;
    }
</style>