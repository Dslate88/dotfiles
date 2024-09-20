local M = {}

M.default_provider = 'openai'
M.default_system_message = "You are a helpful assistant."

M.providers = {
    openai = {
        api_key = os.getenv("OPENAI_API_KEY"),
        model = "gpt-4o-mini",
    },
    azure = {
        api_key = os.getenv("AZURE_OPENAI_API_KEY"),
        endpoint = os.getenv("AZURE_OPENAI_ENDPOINT"),
        deployment_id = "gpt-4o",
    },
}

M.timeout = 60000 -- 60 seconds

return M
