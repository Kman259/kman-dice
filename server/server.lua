local function location(coords, heading)
    local pointOffset = vec3(0.0, 0.80, -1.0)
    local directionVector = vec3(
        math.cos(math.rad(heading)),
        math.sin(math.rad(heading)),
        0
    )
    local rightVector = vec3(
        -math.sin(math.rad(heading)),
        math.cos(math.rad(heading)),
        0
    )
    local offsetVector = vec3(
        pointOffset.x * directionVector.x + pointOffset.y * rightVector.x,
        pointOffset.x * directionVector.y + pointOffset.y * rightVector.y,
        pointOffset.z
    )
    local finalPosition = coords + offsetVector
    return finalPosition  
end

RegisterServerEvent("kman-dice:server:newRoll", function(color, amt)
    local src = source
    local dice = {}
    for i = 1, amt, 1 do
        dice[i] = math.random(1 , 6)
    end
    local ped = GetPlayerPed(src)
    TriggerClientEvent("kman-dice:client:roll", src) --Animation
    Wait(2500)
    TriggerClientEvent("kman-dice:client:createRoll", -1, src, dice, location(GetEntityCoords(ped), GetEntityRotation(ped).z), color) --Triggers for everyone, adds dice to their display list
end)