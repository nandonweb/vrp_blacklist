local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
testes_server = Tunnel.getInterface("vrp_blacklist")

------------------------
-- BLACKLIST WEAPON
-----------------------
Citizen.CreateThread(function()
  while true do
      Citizen.Wait(2000) 

      for i=1, #config.weapons do
          if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(config.weapons[i]), false) then
              print(config.weapons[i])
              RemoveAllPedWeapons(PlayerPedId(), true) 
              TriggerServerEvent("kickPlayer")
              return
          end
      end
  end
end)

---------------------
-- BLACKLIST CARS
---------------------
Citizen.CreateThread(function()
  while true do
      Citizen.Wait(1000) 

      local playerPed = PlayerPedId()
      
      local vehicle = GetVehiclePedIsIn(playerPed, false)
      if vehicle ~= nil then
        local model = GetEntityModel(vehicle)
        for i=1, #config.cars do
          if GetHashKey(config.cars[i]) == model then
              Citizen.Wait(500)
              DeleteEntity(vehicle)
              TriggerServerEvent("kickPlayer")
              break
          end
        end
      end
  end
end)

----------------------
-- BLACKLIST PED
----------------------
Citizen.CreateThread(function()
  while true do
      Citizen.Wait(1000)

      local ped = GetPlayerPed(-1)
      local pedModel = GetEntityModel(ped)

      for i=1, #config.peds do
        if pedModel == GetHashKey(config.peds[i]) then
          TriggerServerEvent("kickPlayer")
          break
        end
      end
  end
end)


-------------------------
-- TESTES
-------------------------

-- Lista de Peds: https://wiki.rage.mp/index.php?title=Peds

-- Ped de alien
RegisterCommand('ped', function()
  local model = GetHashKey("s_m_m_movalien_01") 
  RequestModel(model) 
  while not HasModelLoaded(model) do 
      Citizen.Wait(0)
  end
  SetPlayerModel(PlayerId(), model) 
  SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 0) 
  SetPedComponentVariation(GetPlayerPed(-1), 11, 6, 0, 0) 
end, false)

-- Volta a skin padrão 
RegisterCommand('normal', function()
  local model = GetHashKey("mp_m_freemode_01") 
  RequestModel(model) 
  while not HasModelLoaded(model) do 
      Citizen.Wait(0)
  end
  SetPlayerModel(PlayerId(), model) 
  SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 0) 
  SetPedComponentVariation(GetPlayerPed(-1), 11, 6, 0, 0) 
end, false)

