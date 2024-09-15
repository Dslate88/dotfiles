local curl = require('plenary.curl')

local M = {}

function M.send_request(prompt, settings)
    local system_message = settings.system_message or "You are a helpful assistant."

    local response = curl.post("https://api.openai.com/v1/chat/completions", {
        headers = {
            ["Authorization"] = "Bearer " .. settings.api_key,
            ["Content-Type"] = "application/json",
        },
        body = vim.fn.json_encode({
            model = settings.model,
            messages = {
                { role = "system", content = system_message },
                { role = "user", content = prompt },
            },
        }),
    })

    local result = vim.fn.json_decode(response.body)
    if response.status ~= 200 then
        return nil, result.error.message
    end

    return result, nil
end

return M
