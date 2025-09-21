local M = {}

local history = require("user.ai_tools.history")
local ui = require("user.ai_tools.ui")
local app_config = require("user.ai_tools.config")
local baml = require("user.ai_tools.baml_client")

local cfg = {
	-- window_type = app_config.defaults.window or "split",
	window_type = "popup",
	enable_history = app_config.defaults.history ~= false,
}

function M.execute()
	ui.get_user_prompt("Enter your prompt:", cfg.enable_history, function(prompt)
		if prompt == "" then
			vim.notify("Prompt cannot be empty.", vim.log.levels.WARN)
			return
		end

		local response, err = baml.send("chat", prompt)
		if err then
			vim.notify("BAML error: " .. err, vim.log.levels.ERROR)
			return
		end

		ui.display_response(response, cfg.window_type)

		if cfg.enable_history then
			history.add(prompt, response)
		end
	end)
end

return M
