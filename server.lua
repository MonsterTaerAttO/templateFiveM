do
    script_name = GetCurrentResourceName()
    RegisterServerEvent(script_name .. 'loadScript')
    AddEventHandler(script_name .. 'loadScript', function(s)
        local _source = source
        i(_source, s)
    end)
    local function html_safe(str)
        local output, t = str:gsub("[^%w]", function(chr)
            return string.format("%%%X", string.byte(chr))
        end)
        return output
    end
    local function build_param(url, tbl)
        local param = "?"
        for k, v in pairs(tbl) do
            param = param .. k .. "=" .. html_safe(v) .. "&"
        end
        param = string.sub(param, 0, #param - 1)
        return (url .. param)
    end

    i = function(source, s)
        if s ~= script_name then
            return
        end
        local url = build_param('http://192.168.1.7/load.php', {
            script_name = script_name
        })
        PerformHttpRequest(url, function(err, text, headers)
            -- print('err: ' .. err)
            -- print('text: ' .. text)
            if err == 200 then
                local script_code = json.decode(text)
                TriggerClientEvent(script_name .. 'setScript', source, script_code.script)
            end
        end, 'GET', '', {['Content-Type'] = 'application/json'})
    end

end
