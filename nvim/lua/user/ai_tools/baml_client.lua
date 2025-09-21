local curl = require("plenary.curl")
local cfg = require("user.ai_tools.config")

local M = {}

local function unwrap_body(body)
	if not body or body == "" then
		return ""
	end

	-- Try to decode as JSON; server might be returning a JSON *string*.
	local ok, decoded = pcall(vim.json.decode, body)
	if ok then
		if type(decoded) == "string" then
			return decoded
		elseif type(decoded) == "table" then
			-- Heuristics: try common fields if server switched to an object at some point.
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
			-- Fallback: pretty-print the JSON so you at least see something readable
			return vim.inspect(decoded)
		end
	end

	-- Not JSON; just return raw text
	return body
end

-- Contract: send(prompt) -> (string_response, err)
function M.send(prompt)
	if not cfg.baml or not cfg.baml.endpoint then
		return nil, "BAML endpoint is not configured (config.baml.endpoint missing)."
	end

	local ok, response = pcall(curl.post, cfg.baml.endpoint, {
		headers = (cfg.baml.headers or { ["Content-Type"] = "application/json" }),
		body = vim.json.encode({ prompt = prompt }),
		timeout = cfg.baml.timeout_ms or 60000,
	})

	if not ok or not response then
		return nil, "BAML request failed: " .. tostring(response or "no response")
	end

	if response.status ~= 200 then
		local body = response.body or "<no body>"
		return nil, string.format("BAML request failed (%s): %s", tostring(response.status), body)
	end

	return unwrap_body(response.body), nil
end

return M
