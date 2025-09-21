local curl = require("plenary.curl")
local cfg = require("user.ai_tools.config")

local M = {}

local function unwrap_body(body)
	if not body or body == "" then
		return ""
	end

	local ok, decoded = pcall(vim.json.decode, body)
	if ok then
		if type(decoded) == "string" then
			return decoded
		elseif type(decoded) == "table" then
			if type(decoded.content) == "string" then
				return decoded.content
			end
			if type(decoded.message) == "string" then
				return decoded.message
			end
			if type(decoded.text) == "string" then
				return decoded.text
			end
			if type(decoded.message) == "table" and type(decoded.message.content) == "string" then
				return decoded.message.content
			end
			return vim.inspect(decoded)
		end
	end

	return body
end

function M.send(endpoint_key, prompt)
	local endpoint_cfg = cfg.endpoints[endpoint_key]
	if not endpoint_cfg or not endpoint_cfg.endpoint then
		return nil, "Endpoint configuration for " .. tostring(endpoint_key) .. " is missing."
	end

	local ok, response = pcall(curl.post, endpoint_cfg.endpoint, {
		headers = endpoint_cfg.headers,
		body = vim.json.encode({ prompt = prompt }),
		timeout = endpoint_cfg.timeout_ms,
	})

	if not ok or not response then
		return nil, "Request failed: " .. tostring(response or "no response")
	end

	if response.status ~= 200 then
		local body = response.body or "<no body>"
		return nil, string.format("Request failed (%s): %s", tostring(response.status), body)
	end

	return unwrap_body(response.body), nil
end

return M
