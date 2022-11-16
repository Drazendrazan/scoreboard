<template>
    <div class="header">
        <div class="logo_content">
            <div class="logo"><img src="../assets/logo.png" alt=""></div>
            <div class="server_info">
                <div class="server_name">{{server_name}}</div>
                <div class="server_status">Online Status: <span id="number">{{online_players}}</span>/128</div>
            </div> 
        </div>

        <div class="job_content">
            <div class="job"><i class="fa-solid fa-shield-halved"></i> <span id="police">{{police}}</span> | <span id="job1">Police</span></div>
            <div class="job"><i class="fa-solid fa-truck-medical"></i> <span id="ambulance">{{ambulance}}</span> | <span id="job2">Ambulance</span></div>
            <div class="job"><i class="fa-solid fa-wrench"></i> <span id="mechanics">{{mechanics}}</span> | <span id="job3">Mechanics</span></div>
            <div class="job"><i class="fa-solid fa-gear"></i> <span id="admins">{{admins}}</span> | <span id="job4">Admins</span></div>
        </div>

        <div class="player_info">
            <div class="player_name"><span id="ping"><i class="fa-solid fa-tower-broadcast"></i> {{localPlayer.ping}}ms</span>|<span id="name" :class="{admin: localPlayer.pGroup == 'admin'}">{{localPlayer.pname}}</span></div>
            <div class="player_server_info">
                <div class="id">ID: <span id="player_id">{{localPlayer.id}}</span></div>
                <div :class="localPlayer.job"><span id="job">{{localPlayer.job}} <span id="job_icon"><i class="fa-solid fa-shield-halved" v-if="localPlayer.job == 'police'"></i><i class="fa-solid fa-truck-medical" v-if="localPlayer.job == 'ambulance'"></i><i class="fa-solid fa-wrench" v-if="localPlayer.job == 'mechanic'"></i></span></span></div>
            </div>
        </div>
    </div>
</template>

<script>
export default{
    name: 'Header',
    data(){
        return{
            header_info: [],
            localPlayer: [],
            server_name: "",
            online_players: 0,
            police: 0,
            ambulance: 0,
            mechanics: 0,
            admins: 0,
            job_icon: "police",
        }
    },
    mounted(){
        window.addEventListener("message", (event)=>{
            let data = event.data;

            if(data.action == "header_data"){
                this.server_name = data.server_name
                this.player_name = data.player_name
                this.server_id = data.server_id
                this.online_players = data.online_players
            }

            if(data.local_datas != undefined){
                this.localPlayer = data.local_datas
            }

            if(data.server_info != undefined){
                this.server_name = data.server_info.server_name
                this.online_players = data.server_info.active_player
            }

            if(data.playerDatas != undefined){
                this.police = 0
                this.ambulance = 0
                this.mechanics = 0
                this.admins = 0
                for (let index = 0; index < data.playerDatas.length; index++) {
                    if(data.playerDatas[index].player_job == "police"){
                        this.police += 1
                    }

                    if(data.playerDatas[index].player_job == "ambulance"){
                        this.ambulance += 1
                    }

                    if(data.playerDatas[index].player_job == "mechanic"){
                        this.mechanics += 1
                    }

                    if(data.playerDatas[index].player_group == "admin"){
                        this.admins += 1
                    }
                }
            }
        });
    },
}
</script>

<style scoped>
.header{
    position: relative;
    width: 100%;
    height: fit-content;
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.logo_content{
    display: flex;
    flex-direction: row;
    gap: 15px;
}
.logo{
    width: 60px;
    height: 60px;
}
.logo img{
    width: 100%;
}
.job_content{
    color: white;
    padding: 5px 15px;
    border-radius: 5px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row;
    gap: 10px;
}
.server_info{
    display: flex;
    justify-content: center;
    flex-direction: column;
    gap: 5px;
}
.server_name{
    font-size: 20px;
    font-weight: 500;
}
.server_status{
    color: rgba(255, 255, 255, 0.6);
}
.player_info{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}
.player_name{
    font-weight: 500;
    font-size: 18px;
    background-color: rgba(0,0,0,0.3);
    padding: 8px 15px;
    border-radius: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row;
    gap: 7px;
}
#ping{
    font-size: 15px;
    color: var(--ping-color);
}
.player_job{
    background-color: var(--job1-color);
    width: fit-content;
    padding: 5px 15px;
    border-radius: 5px;
    color: rgba(255, 255, 255, 0.8);
}
.player_server_info{
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row;
    gap: 5px;
    margin-top: 5px;
}
.id{
    width: fit-content;
    padding: 5px 15px;
    background-color: rgba(0,0,0,0.3);
    border-radius: 5px;
    color: rgba(255, 255, 255, 0.8);
}
.job{
    width: fit-content;
    padding: 5px 15px;
    border-radius: 5px;
    color: rgba(255, 255, 255, 1);
}
.job:nth-child(1){
    background-color: var(--job1-color);
}
.job:nth-child(2){
    background-color: var(--job2-color);
}
.job:nth-child(3){
    background-color: var(--job3-color);
}
.job:nth-child(4){
    background-color: var(--job4-color);
}

.police{
    background-color: var(--job1-color);
    width: fit-content;
    padding: 5px 15px;
    border-radius: 5px;
    color: rgba(255, 255, 255, 0.8);
    color: white;
}
.ambulance{
    background-color: var(--job2-color);
    width: fit-content;
    padding: 5px 15px;
    border-radius: 5px;
    color: rgba(255, 255, 255, 0.8);
    color: white;
}
.mechanic{
    background-color: var(--job3-color);
    width: fit-content;
    padding: 5px 15px;
    border-radius: 5px;
    color: rgba(255, 255, 255, 0.8);
    color: white;
}
.admin{
    color: var(--job4-color);
}
</style>

