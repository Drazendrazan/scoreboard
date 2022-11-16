<template>
  <div class="scoreboard animate__animated" :class="{animate__fadeInDown: visible, animate__fadeOutUp: closeAnimation}" v-if="visible">
    <Header />
    <div class="line"></div>
    <Players />
  </div>
</template>

<script>
import Header from "./components/Header.vue"
import Players from "./components/Players.vue"
export default {
  name: 'App',
  components: {
    Header,
    Players,
  },
  data(){
    return {
      visible: false,
      closeAnimation: false,
    }
  },
  methods: {
    closePanel() {
      fetch('https://scoreboard/closePanel');
    }
  },
  mounted(){
    window.addEventListener("message", (event)=>{

      let data = event.data;

      if(data.action == "showUI"){
        this.visible = true
      }

      if(data.action == "hideUI"){
        setTimeout(() => {
          this.closeAnimation = false
          this.visible = false
        }, 1000);
      }
    });

    document.addEventListener('keydown', (event) => {
        if (event.key == 'Escape'){
          this.closeAnimation = true
          this.closePanel()
        }
    });
  },
  
}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap');
:root{
  --bg-color: rgba(0,0,0,0.6);
  --ping-color: rgb(0,255,0);
  --job1-color: rgb(32, 94, 161);
  --job2-color: #ce2029;
  --job3-color: #ff8800;
  --job4-color: #22c74d;
}
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
body{
  width: 100%;
  height: 100vh;
  display: flex;
  justify-content: center;
  overflow: hidden;
  /* background-color: cadetblue; */
  font-family: 'Poppins', sans-serif;
}
.scoreboard{
  width: 160vh;
  height: fit-content;
  background-color: var(--bg-color);
  margin-top: 30px;
  padding: 30px;
  border-radius: 10px;
  color: white;
  z-index: 1000;
}
.line{
  width: 100%;
  height: 3px;
  background-color: rgba(255,255,255,0.3);
  margin-top: 30px;
}
</style>
