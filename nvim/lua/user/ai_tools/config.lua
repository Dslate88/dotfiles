local M = {}

M.baml = {
	endpoint = os.getenv("BAML_ENDPOINT") or "http://localhost:8000/api/v1/chat",
	timeout_ms = 60000,
	headers = { ["Content-Type"] = "application/json" },
}

M.defaults = {
	window = "split",
	history = true,
}

return M
