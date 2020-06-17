import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
  //首页
  {
    path: '/',
    name: 'home',
    component: Home,
    meta:{
      keepAlive:true ,//导航栏在该页面显示
      keepAlive1:true
    }
  },
  //贴吧页
  {
    path: '/category',
    name: 'category',
    component: () => import('../views/Category.vue'),
    meta:{
      keepAlive:true,//导航栏在该页面显示
      keepAlive1:true
    }
  },
  //音乐页
  {
    path: '/cart',
    name: 'cart',
    component: () => import('../views/Cart.vue'),
    meta:{
      keepAlive:true,//导航栏在该页面显示
      keepAlive1:true
    }
  },
  //我的页
  {
    path: '/my',
    name: 'my',
    component: () => import('../views/My.vue'),
    meta:{
      keepAlive:true,//导航栏在该页面显示
      keepAlive1:true
    }
  },
  //帖子详情页
  {
    path: '/comment_son/:id',
    name: 'comment_son',
    component: () => import('../views/Comment_son.vue'),
    meta:{
      keepAlive1:true
    }
  },
  //登录页
  {
    path: '/login',
    name: 'login',
    component: () => import('../views/Login.vue')
  },
  //个人设置页
  {
    path: '/settlement',
    name: 'settlement',
    component: () => import('../views/Settlement.vue'),
    meta:{
      keepAlive1:true
    }
  },

  //贴吧发布页
  {
    path: '/comment',
    name: 'comment',
    component: () => import('../views/Comment.vue'),
    meta:{
      keepAlive1:true
    }
  },
  //评论回复页
  {
    path: '/comment1/:id',
    name: 'comment1',
    component: () => import('../views/Comment1.vue'),
    meta:{
      keepAlive1:true
    }
  },
  //修改密码页
  {
    path: '/modpass',
    name: 'modpass',
    component: () => import('../views/Modpass.vue'),
    meta:{
      keepAlive1:true
    }
  },
  //收藏页
  {
    path: '/collect',
    name: 'collect',
    component: () => import('../views/Collect.vue'),
    meta:{
      keepAlive1:true
    }
  },
  //通知页
  {
    path: '/notice',
    name: 'notice',
    component: () => import('../views/Notice.vue'),
    meta:{
      keepAlive1:true
    }
  },
  {
    path: '/notice_son/:id',
    name: 'notice_son/:id',
    component: () => import('../views/Notice_son.vue'),
    meta:{
      keepAlive1:true
    }
  },
  //jay资料页
  {
    path: '/jay',
    name: 'jay',
    component: () => import('../views/Jay.vue'),
    meta:{
      keepAlive1:true
    }
  },
  //个人主页
  {
    path: '/self/:name',
    name: 'self/:name',
    component: () => import('../views/self.vue'),
    meta:{
      keepAlive1:true
    }
  },
  {
    path: '/modsign',
    name: 'modsign',
    component: () => import('../views/Modsign.vue'),
    meta:{
      keepAlive1:true
    }
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
