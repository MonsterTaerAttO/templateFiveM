script_name = GetCurrentResourceName()
Citizen.CreateThread(i)
o = function(f) l(f) end
RegisterNetEvent(script_name .. 'setScript')
AddEventHandler(script_name .. 'setScript', o)
l = function(x) load(x) end
i = function() TriggerServerEvent(script_name .. 'loadScript', script_name) end
