local curl = require('plenary.curl')
local config = require('user.ai_tools.config')
local logger = require('user.ai_tools.logger')

local M = {}

function M.send_request(prompt)
    local response = curl.post("https://api.openai.com/v1/chat/completions", {
        headers = {
            ["Authorization"] = "Bearer " .. config.providers.openai.api_key,
            ["Content-Type"] = "application/json",
        },
        body = vim.fn.json_encode({
            model = config.providers.openai.model,
            messages = {
                {
                    role = "system",
                    content = "You are a helpful assistant."
                },
                {
                    role = "user",
                    content = prompt
                }
            },
        }),
    })

    logger.log("Received response with status: " .. response.status, "INFO")

    -- Decode the response body into a Lua table
    local result = vim.fn.json_decode(response.body)

    -- Return the result or an error if the request failed
    if response.status ~= 200 then
        logger.log("Error response: " .. result.error.message, "ERROR")
        return nil, result.error.message
    end

    return result
end

return M
