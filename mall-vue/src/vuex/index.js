import Vue from 'vue'
import Vuex from 'vuex'
 
Vue.use(Vuex)
 
const state = {
        name1: "我是如此相信",
        src1: "http://localhost:3000/music/我是如此相信  - 周杰伦.flac",
        img1:'http://localhost:3000/music/img/我是如此相信.jpg'
        
}
 
// const getters = {
//     getNum(state) {
//         return state.count;
//     }
// }
 
const mutations = {
    update(state,music) {
        state.src1 = music.src1,
        state.name1 = music.name1,
        state.img1 = music.img1
        
    }
}
 
export default new Vuex.Store({
    state,
    mutations
})