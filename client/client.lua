local src
local activeDice = {}

function loadAnim(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(5)
    end
end
--@param dice: The string to display 
function DrawScene(dice)
    local onScreen, screenX, screenY = World3dToScreen2d(dice.loc.x, dice.loc.y, dice.loc.z)
    if onScreen then
        local camCoords = GetGameplayCamCoords()
        local distance = #(dice.loc - camCoords)
        local fov = (1 / GetGameplayCamFov()) * 75
        local scale = (1 / distance) * (4) * fov * (0.5)
        local r,g,b= dice.color[1], dice.color[2], dice.color[3]
        SetTextScale(0.0, scale)
        SetTextFont(6)
        SetTextProportional(true)
        SetTextColour(r, g, b, 255)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(true)
        SetTextOutline(true)
        string = dice.dice[1].."/6 "
        for i = 2, #dice.dice, 1 do    
            string = string..dice.dice[i].."/6 "
        end
        AddTextComponentString(string)
        DrawText(screenX, screenY)
    end
end

CreateThread(function()
    while true do
        local currentTime = GetGameTimer()
        local playerPos = GetEntityCoords(src)
        src = PlayerPedId()
        for k, v in pairs(activeDice) do
            local diff = math.abs(playerPos.x - v.loc.x) + math.abs(playerPos.y - v.loc.y)
            if diff < 12 then --If close to the dice then...
                DrawScene(v)
            end
            if v.time <= currentTime then
                activeDice[k] = nil --If it has been over 8 seconds, it removes dice
            end
        end
        Wait(5)
    end
end)

local function getColor(name)
    if name == "dice_b" then
        return {0, 8, 255}
    elseif name == "dice_r" then 
        return {255, 0, 21}
    elseif name == "dice_g" then
        return {24, 199, 41}
    elseif name == "dice_y" then
        return {251, 255, 0}
    else --White
        return {255, 255, 255}
    end
end

--@param data: Not used
--@param slot: List containing the name of the item, used to determine text color
exports('diceRoll1', function(data, slot)
    local src = source
    TriggerServerEvent("kman-dice:server:newRoll", getColor(slot.name), 1)
end)
exports('diceRoll2', function(data, slot)
    local src = source
    TriggerServerEvent("kman-dice:server:newRoll", getColor(slot.name), 2)
end)
exports('diceRoll3', function(data, slot)
    local src = source
    TriggerServerEvent("kman-dice:server:newRoll", getColor(slot.name), 3)
end)



-- @param playerId: dice is linked to a players id, that way no player will have more then 1 dice text active at a time
-- @param dice: a list of numbers that are rolled ie. {5,1,3}
RegisterNetEvent("kman-dice:client:createRoll", function(playerId, dice, coords, color) 
    print("5")
    activeDice[tonumber(playerId)] = {dice = dice, time = GetGameTimer() + 8000, loc = coords, color = color} --Table to keep track of all the dice active in the world
end)

RegisterNetEvent("kman-dice:client:roll", function()
    local ped = GetPlayerPed(-1)
    loadAnim("anim@mp_player_intcelebrationmale@wank")
    TaskPlayAnim(ped, "anim@mp_player_intcelebrationmale@wank", "wank", 8.0, 1.0, -1, 48, 0, 0, 0, 0)
    Wait(1500)
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'dice', 0.3)
    Wait(700)
    ClearPedTasks(ped)
end)
