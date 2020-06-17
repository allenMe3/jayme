import Vue from 'vue'
import App from './App.vue'
import router from './router'
import Splash from './components/splash.vue'
import 'element-ui/lib/theme-chalk/index.css'
import APlayer from '@moefe/vue-aplayer';
import store from "./vuex"

Vue.use(APlayer, {
  defaultCover: './assets/images/jay.jpeg',
  productionTip: true,
});


Vue.config.productionTip = false


router.beforeEach((to, from, next) => {
  let token = localStorage.getItem('token');
  if (!token && to.path !== '/login') {
    next('/login');
  } else {
    next();
  }
});

new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
}).$mount('#app')
