ESX.RegisterServerCallback("getPlayerDatas", function(source, cb)
    playerDatas = {}
    for _, playerId in ipairs(GetPlayers()) do
        local xPlayer = ESX.GetPlayerFromId(playerId) 
        table.insert(playerDatas,{
            player_name = xPlayer.getName(),
            player_id = playerId,
            player_group = xPlayer.getGroup(),
            player_job = xPlayer.getJob().name,
            player_ping = GetPlayerPing(xPlayer),
        })

    end
    cb(playerDatas)
end)

ESX.RegisterServerCallback("getDatas", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local Data = {
        id = source,
        pname = xPlayer.getName(),
        job = xPlayer.getJob().name,
        pGroup = xPlayer.getGroup(),
        ping = GetPlayerPing(xPlayer),
    }

    cb(Data)
end)