ESX = exports["es_extended"]:getSharedObject()

local showUI = false
RegisterCommand("scoreboard", function()
    showUI = true
    if showUI then 
        enableUI()
    else 
        disableUI()
    end
end)


function enableUI()
    SendNUIMessage({
        action = "showUI",
    })

    SetNuiFocus(true, true)
end

function disableUI()
    SendNUIMessage({
        action = "hideUI"
    })
    SetNuiFocus(false, false)
    showUI = false
end

Citizen.CreateThread(function()
    while true do 
        if showUI then 
            ESX.TriggerServerCallback("getPlayerDatas", function(playerDatas) 
                SendNUIMessage({
                    playerDatas = playerDatas
                })
            end)

            ESX.TriggerServerCallback("getDatas", function(local_datas) 
                SendNUIMessage({
                    local_datas = local_datas,
                    server_info = {
                        server_name = config.server_name,
                        active_player = #GetActivePlayers()
                    } 
                })
            end)
        end
        Wait(1000)
    end
end)

RegisterNUICallback("closePanel", disableUI)
RegisterNUICallback("getHeader", getHeader)
