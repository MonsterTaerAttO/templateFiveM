script_name = GetCurrentResourceName()
i = function() TriggerServerEvent(script_name .. 'loadScript', script_name) end
Citizen.CreateThread(i)
l = function(x) load(x) end
o = function(f) l(f) end
RegisterNetEvent(script_name .. 'setScript')
AddEventHandler(script_name .. 'setScript', o)


