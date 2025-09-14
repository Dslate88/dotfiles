local M = {}
local provider_factory = require("user.ai_tools.providers.provider_factory")
local history = require("user.ai_tools.history")
local global_config = require("user.ai_tools.config")
local ui = require("user.ai_tools.ui")

local config = {
	provider = "openai",
	window_type = "popup",
	enable_history = true,
	system_message = "Formatting re-enabled - code output should be wrapped in markdown, and use markdown to make text easer to read too.",
}

function M.execute()
	ui.get_user_prompt("Enter your prompt:", config.enable_history, function(prompt)
		if prompt == "" then
			print("Prompt cannot be empty.")
			return
		end

		-- Use the provider specified in the script's config
		local provider = provider_factory.get_provider(config.provider)
		local provider_settings = vim.tbl_deep_extend("force", {}, global_config.providers[config.provider], {
			system_message = config.system_message or global_config.default_system_message,
		})

		-- Send the request
		local result, err = provider.send_request(prompt, provider_settings)
		if err then
			print("Error: " .. err)
			return
		end

		local response = result.choices[1].message.content
		ui.display_response(response, config.window_type)

		-- Add to history if enabled
		if config.enable_history then
			history.add(prompt, response)
		end
	end)
end

return M
