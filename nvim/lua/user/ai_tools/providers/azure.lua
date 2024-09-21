local curl = require("plenary.curl")
local config = require("user.ai_tools.config")

local M = {}

local DEPLOYMENT_ID = config.providers.azure.deployment_id
local ENDPOINT = config.providers.azure.endpoint
local URL = ENDPOINT .. "/openai/deployments/" .. DEPLOYMENT_ID .. "/chat/completions?api-version=2023-03-15-preview"

function M.send_request(prompt, settings)
	local system_message = settings.system_message or "You are a helpful AI assistant"

	local body = {
		model = settings.model,
		messages = {
			{ role = "system", content = system_message },
			{ role = "user", content = prompt },
		},
	}

	local response = curl.post(URL, {
		headers = {
			["api-key"] = config.providers.azure.api_key,
			["Content-Type"] = "application/json",
		},
		body = vim.json.encode(body),
		timeout = config.timeout,
	})

	local result = vim.json.decode(response.body)

	if response.status ~= 200 then
		return nil, result.error.message
	end

	return result
end

return M
