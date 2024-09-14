local M = {}

M.default_provider = 'openai'

M.providers = {
    openai = {
        api_key = os.getenv("OPENAI_API_KEY"),
        model = "gpt-4o-mini",
        -- model = "o1-mini",
    },
    azure = {
        api_key = os.getenv("AZURE_API_KEY"),
        endpoint = os.getenv("AZURE_ENDPOINT"),
        deployment_id = "gpt-4o",
    },
}

-- Other settings
M.ai_timeout = 30  -- Timeout for AI API requests

return M
