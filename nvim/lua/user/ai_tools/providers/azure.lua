local curl = require('plenary.curl')
local config = require('user.ai_tools.config')

local M = {}

function M.send_request(prompt)
    local response = curl.post(config.providers.azure.endpoint .. "/openai/deployments/" .. config.providers.azure.deployment_id .. "/completions?api-version=2024-06-01", {
        headers = {
            ["Authorization"] = "Bearer " .. config.providers.azure.api_key,
            ["Content-Type"] = "application/json",
        },
        body = vim.fn.json_encode({
            prompt = prompt,
        }),
    })

    return vim.fn.json_decode(response.body)
end

return M
