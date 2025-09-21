local M = {}

M.baml = {
	endpoint = "http://localhost:8000/api/v1/chat",
	timeout_ms = 300000, -- 5 minutes
	headers = { ["Content-Type"] = "application/json" },
}

M.defaults = {
	window = "split", -- "split" | "popup"
	history = true,
}

M.endpoints = {
	chat = {
		endpoint = "http://localhost:8000/api/v1/chat",
		timeout_ms = 300000,
		headers = { ["Content-Type"] = "application/json" },
	},
	-- Not currently used, experimenting a bit...
	harpoon = {
		endpoint = "http://localhost:8000/api/v1/harpoon",
		timeout_ms = 300000,
		headers = { ["Content-Type"] = "application/json" },
	},
}

return M
