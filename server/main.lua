ESX = exports["es_extended"]:getSharedObject()

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do 
        local neewbies = {}
        
        for _,playerId in pairs(GetPlayers()) do 
            local xPlayer = ESX.GetPlayerFromId(playerId)
            local playerGroup = xPlayer.getGroup()

            if not has_value(Config.WhitelistedGroups , playerGroup) then 
                local playTime = xPlayer.getPlayTime() / 60 
                
                if playTime < Config.Time then 
                    table.insert(neewbies , tonumber(playerId))
                end 
            end 
        end 

        TriggerClientEvent("esx_newbie:syncNeewbies" , -1 , neewbies)

        Citizen.Wait(Config.SyncFrequenz  * 1000)
    end 
end)