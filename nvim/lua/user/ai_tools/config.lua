local M = {}

M.baml = {
	endpoint = os.getenv("BAML_ENDPOINT") or "http://localhost:8000/api/v1/chat",
	timeout_ms = 300000, -- 5 minutes
	headers = { ["Content-Type"] = "application/json" },
}

M.defaults = {
	window = "split", -- "split" | "popup"
	history = true,
}

return M
