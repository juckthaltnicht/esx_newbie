local neewbies = {} 
local showTags = true 

if Config.EnableHideCommand then
    RegisterCommand(Config.Command, function()
        showTags = not showTags
    end, false)    

end

RegisterNetEvent("esx_newbie:syncNeewbies")
AddEventHandler("esx_newbie:syncNeewbies" , function(neewbies_)
    neewbies = neewbies_ 
end)

local function contains(array, value)
    for _, v in ipairs(array) do
        if v == value then
            return true
        end
    end
    return false
end

local function DrawText3D(x, y, z, text , scaleX , scaleY)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)

    if onScreen then
        SetTextScale(scaleX, scaleY)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255 , 255) 
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()

        BeginTextCommandWidth("STRING")
        AddTextComponentString(text)
        local width = EndTextCommandGetWidth(0)
        local height = 0.02

        SetTextEntry("STRING")
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x - width / 2, _y - height / 2)
    end
end


Citizen.CreateThread(function()
    local sleep = 300 

    while true do 
        sleep = 300 

        if showTags then 
            for _, player in ipairs(GetActivePlayers()) do
                local serverId = GetPlayerServerId(player)
    
                if Config.SeeOwnText then 
                    local otherPed = GetPlayerPed(player)
                
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local otherPlayerCoords = GetEntityCoords(otherPed)
                    local distance = #(playerCoords - otherPlayerCoords)
                
                    if distance <= Config.DrawDistance and contains(neewbies , serverId) then
                        sleep = 0
                        local minScale = Config.minScale
                        local maxScale = Config.maxScale
                        local scale = minScale + (maxScale - minScale) * (distance / 100)
                        scale = math.max(minScale, math.min(maxScale, scale))
                        DrawText3D(otherPlayerCoords.x, otherPlayerCoords.y, otherPlayerCoords.z + Config.TextHeight, Config.Text , scale, scale, 225, 0, 255, 255)
                    end  
                     
                else 
                    if serverId ~= GetPlayerServerId(PlayerId()) then
                        local otherPed = GetPlayerPed(player)
                
                        local playerCoords = GetEntityCoords(PlayerPedId())
                        local otherPlayerCoords = GetEntityCoords(otherPed)
                        local distance = #(playerCoords - otherPlayerCoords)
                
                        if distance <= Config.DrawDistance and contains(neewbies , serverId) then
                            sleep = 0
                            
                            local minScale = Config.minScale
                            local maxScale = Config.maxScale
                            local scale = minScale + (maxScale - minScale) * (distance / 100)
                            scale = math.max(minScale, math.min(maxScale, scale))
                            DrawText3D(otherPlayerCoords.x, otherPlayerCoords.y, otherPlayerCoords.z + Config.TextHeight, Config.Text, scale, scale, 225, 0, 255, 255)
                        end  
                    end 
                end             
            end
        end 

        Citizen.Wait(sleep)
    end     
end)
