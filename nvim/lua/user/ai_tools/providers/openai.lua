local config = require('user.ai_tools.config')
local curl = require('plenary.curl')

local M = {}

function M.send_request(prompt, settings)
    local response = curl.post("https://api.openai.com/v1/chat/completions", {
        headers = {
            ["Authorization"] = "Bearer " .. settings.api_key,
            ["Content-Type"] = "application/json",
        },
        body = vim.json.encode({
            model = settings.model,
            messages = {
                { role = "system", content = settings.system_message },
                { role = "user", content = prompt },
            },
        }),
        timeout = config.timeout
    })

    local result = vim.json.decode(response.body)

    if response.status ~= 200 then
        return nil, result.error.message
    end

    return result, nil
end

return M
