local hidehud = false
local black_bars = true

Citizen.CreateThread(function()
    while true do
    	Citizen.Wait(0)
    end
end)

RegisterCommand("hud", function(source, args, rawCommand) -- Its showing/hiding hud 
	if (hidehud ~= false) then
		hidehud = false
		TriggerEvent("vorp:showUi", false)
		TriggerEvent("vorp:showHUD")
		DisplayHud(false)

				
	else
		hidehud = true
		TriggerEvent("vorp:showUi", true)
		TriggerEvent("vorp:hideHUD")
		DisplayHud(true)
		
	end
end, false)	


RegisterCommand("cinematic", function(source, args, rawCommand) -- Its cinematic hud 
	if (hidehud ~= false) then
		hidehud = false
		TriggerEvent("vorp:showUi", false)
		TriggerEvent("vorp_core:showHUD")
		DisplayHud(false)
		Citizen.InvokeNative(0x69D65E89FFD72313,true)

				
	else
		hidehud = true
		TriggerEvent("vorp:showUi", true)
		TriggerEvent("vorp_core:hideHUD")
		DisplayHud(true)
		Citizen.InvokeNative(0x69D65E89FFD72313,false)
	end
end, false)	
	
RegisterNetEvent('vorp_core:showHUD')
AddEventHandler('vorp_core:showHUD', function()
	SendNUIMessage({
		showhud = true
	})
end)	

RegisterNetEvent('vorp_core:hideHUD')
AddEventHandler('vorp_core:hideHUD', function()
	SendNUIMessage({
		hidehud = true
	})
end)

                      