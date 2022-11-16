<template>
    <div class="players_content">
        <!-- <div class="player">
            <div class="player_info">
                <div id="player_name">At0mit0s</div>
                <div>|</div>
                <div class="id"><span id="player_id">300</span> ID</div>
                <div class="player_job"><span id="job">Police <i class="fa-solid fa-shield-halved"></i></span></div>
            </div>
            <div class="ping"><i class="fa-solid fa-tower-broadcast"></i> 30ms</div>
        </div> -->

        <!-- <div v-for="player,index in players" :key="player.player_id" class="player">
            <div class="player_info">
                <div id="player_name" :class="{admin: player.player_group == true}">{{player.player_name}}</div>
                <div>|</div>
                <div class="id"><span id="player_id">{{player.player_id}}</span> ID</div>
                <div :class="getjob(index)"><span id="job">{{getjob(index)}} <i class="fa-solid fa-shield-halved"></i></span></div>
            </div>
            <div class="ping"><i class="fa-solid fa-tower-broadcast"></i> {{player.player_ping}}ms</div>
        </div> -->

        <div class="player" v-for="player in players" :key="player.player_id">
            <div class="player_info">
                <div id="player_name" :class="{admin: player.player_group == 'admin'}">{{player.player_name}}</div>
                <div>|</div>
                <div class="id"><span id="player_id">{{player.player_id}}</span> ID</div>
                <div :class="player.player_job"><span id="job">{{player.player_job}} <i class="fa-solid fa-shield-halved"></i></span></div>
            </div>
            <div class="ping"><i class="fa-solid fa-tower-broadcast"></i> {{player.player_ping}}ms</div>
        </div>

    </div>
</template>

<script>
export default{
    name: "Players",
    data(){
        return{
            players: []
        }
    },
    mounted(){
        window.addEventListener("message", (event) =>{
            let data = event.data;

            if(data.playerDatas != undefined){
                this.players = data.playerDatas
            }
        });
    },
}
</script>

<style scoped>
.players_content{
    width: 100%;
    height: fit-content;
    margin-top: 10px;
    padding: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row;
    flex-wrap: wrap;
    gap: 20px;
}
.player{
    width: 24%;
    padding: 10px 15px;
    background-color: rgba(0, 0, 0, 0.3);
    border-radius: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-direction: row;
}
.ping{
    color: var(--ping-color);
    font-size: 15px;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 5px;
}
#player_name{
    font-weight: 500;
}
.player_info{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row;
    gap: 5px;
}
.id{
    color: rgba(255, 255, 255, 0.6);
}
.police{
    background-color: var(--job1-color);
    width: fit-content;
    padding: 5px 15px;
    border-radius: 5px;
    color: rgba(255, 255, 255, 0.8);
    transform: scale(0.8);
    color: white;
}
.ambulance{
    background-color: var(--job2-color);
    width: fit-content;
    padding: 5px 15px;
    border-radius: 5px;
    color: rgba(255, 255, 255, 0.8);
    transform: scale(0.8);
    color: white;
}
.mechanic{
    background-color: var(--job3-color);
    width: fit-content;
    padding: 5px 15px;
    border-radius: 5px;
    color: rgba(255, 255, 255, 0.8);
    transform: scale(0.8);
    color: white;
}
.admin{
    color: var(--job4-color);
}
</style>