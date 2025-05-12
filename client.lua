local QBCore = exports['qb-core']:GetCoreObject()
local nearbyPoles = {}

CreateThread(function()
    for i, pole in ipairs(Config.Poles) do
        if Config.UseTarget then
            exports['qb-target']:AddBoxZone("pole_dance_" .. i, pole.coords, 1.0, 1.0, {
                name = "pole_dance_" .. i,
                heading = pole.heading,
                debugPoly = false,
                minZ = pole.coords.z - 1,
                maxZ = pole.coords.z + 1,
            }, {
                options = {
                    {
                        label = "Dance - " .. pole.label,
                        icon = "fas fa-music",
                        action = function()
                            CheckJobAndOpenMenu(pole)
                        end,
                    },
                },
                distance = 2.0
            })
        else
            table.insert(nearbyPoles, {
                id = i,
                coords = pole.coords,
                heading = pole.heading,
                label = pole.label,
                jobs = pole.jobs
            })
        end
    end
end)


if not Config.UseTarget then
    CreateThread(function()
        while true do
            local sleep = 1000
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, pole in pairs(nearbyPoles) do
                local dist = #(playerCoords - pole.coords)
                if dist < 2.0 then
                    sleep = 0
                    DrawText3D(pole.coords.x, pole.coords.y, pole.coords.z + 1.0, "[E] Dance - " .. pole.label)
                    if IsControlJustReleased(0, 38) then
                        CheckJobAndOpenMenu(pole)
                    end
                end
            end

            Wait(sleep)
        end
    end)
end

function CheckJobAndOpenMenu(pole)
    local Player = QBCore.Functions.GetPlayerData()

    while not Player or not Player.job or not Player.job.name do
        Wait(100)
        Player = QBCore.Functions.GetPlayerData()
    end

    local job = Player.job.name
    if not pole.jobs or #pole.jobs == 0 then
        OpenDanceMenu(pole.coords, pole.heading)
        return
    end

    for _, allowedJob in pairs(pole.jobs) do
        if job == allowedJob then
            OpenDanceMenu(pole.coords, pole.heading)
            return
        end
    end

    QBCore.Functions.Notify("You don't have access to this.", "error", 3000)
end

    function OpenDanceMenu(coords, heading)
        local danceOptions = {}
    
        for i, dance in ipairs(Config.Dances) do
            table.insert(danceOptions, {
                title = dance.label,
                description = "", 
                icon = "fas fa-music",
                onSelect = function()
                    TriggerEvent("SkapPoleDance:StartDance", {
                        animDict = dance.animDict,
                        anim = dance.anim,
                        coords = coords,
                        heading = heading
                    })
                end
            })
        end
    
        lib.registerContext({
            id = 'dance_menu',
            title = 'Dance Selection',
            options = danceOptions
        })
    
        lib.showContext('dance_menu')
    end
    

RegisterNetEvent("SkapPoleDance:StartDance", function(data)
    local ped = PlayerPedId()

    SetEntityCoords(ped, data.coords.x, data.coords.y, data.coords.z - 1.0)
    SetEntityHeading(ped, data.heading)
    Wait(200)

    RequestAnimDict(data.animDict)
    while not HasAnimDictLoaded(data.animDict) do
        Wait(10)
    end

    TaskPlayAnim(ped, data.animDict, data.anim, 8.0, -8.0, -1, 1, 0, false, false, false)
end)

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end
