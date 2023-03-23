local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
testes = {}
Tunnel.bindInterface("vrp_blacklist",testes)


RegisterServerEvent("kickPlayer")
AddEventHandler("kickPlayer", function(reason)
  local player = source
  local user_id = vRP.getUserId(source)
  local identifier = GetPlayerIdentifiers(player)[1]
  --   local nuser_id = vRP.getUserIdentity(user_id)
  --   print(identifier)

  for i = 1, #config.allowedAdmins do
    if config.allowedAdmins[i] == identifier then
      print("Voce está listado na allowlist")
      return
    end
  end

--   DropPlayer(player, reason)
  print("Voce foi banido!")
--   vRP.setBanned(nuser_id, true)
end)

------------------------
-- TESTES
-----------------------

-- Utilize /dararma ID weapon_rpg
-- Lista de Armas: https://wiki.rage.mp/index.php?title=Weapons

RegisterCommand("dararma", function(source, args, raw)
    local user_id = tonumber(args[1])
    local weapon_name = tostring(args[2])
    
    if not user_id then
        print("Por favor, especifique o ID do jogador.")
        return
    end
    
    local player = vRP.getUserSource(user_id)
    
    if player then
        vRPclient.giveWeapons(player, {[weapon_name] = {ammo = 500}})
        print("A arma "..weapon_name.." foi dada ao jogador com sucesso!")
    else
        print("O jogador com o ID "..user_id.." não está online.")
    end
end)

-- Utilize /car rhino do vrp_garages
-- Lista de Veiculos: https://wiki.rage.mp/index.php?title=Vehicles

