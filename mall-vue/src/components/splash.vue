<template>
  <div id="splash">
      <img id="splash" src="../assets/images/jay.jpeg">
  </div>
</template>

<script>
export default {
  mounted(){
        // const _this = this;
        setTimeout(()=>{
            this.$router.replace("/login");
        },2000)
    },
}
</script>

<style>
  #splash{
    position: fixed;
    top: 0;
    left: 0;
    z-index: 6;
    width :100%;
    height: 100%;
    opacity: 1;
    transition :opacity .3s ease;
    box-sizing :border-box;
    /* &.fade-enter,&.fade-leave-to; */
    opacity :0;
  }
</style>