-- TODO: the goal should be used as the system message, its not currently
local async = require("plenary.async")
local utils = require("user.ai_tools.utils")
local provider_factory = require("user.ai_tools.providers.provider_factory")
local logger = require("user.ai_tools.logger")
local ui = require("user.ai_tools.ui")
local global_config = require("user.ai_tools.config")
local history = require("user.ai_tools.history")
local marked = require("user.ai_tools.harpoon")

local M = {}

local config = {
	provider = "openai",
	window_type = "split", -- Options: 'popup' or 'split'
	enable_history = true,
	system_message = "You are an expert code reviewer who helps the user with the following GOAL: ",
}

function M.format_files(files)
	local p = {}

	for _, file in ipairs(files) do
		local content, err = utils.read_file(file.filename)
		if not content then
			print("Error reading file: " .. err)
			return nil, err
		end
		table.insert(p, "FILE NAME BEGIN: " .. file.filename .. "\n")
		table.insert(p, "FILE CONTENT BEGIN:\n" .. content .. "\nFILE CONTENT END\n")
	end

	local prompt = table.concat(p, "\n")
	return prompt
end

function M.post(goal, prompt)
	async.run(function()
		local provider = provider_factory.get_provider(config.provider)

		local provider_settings = vim.tbl_deep_extend("force", {}, global_config.providers[config.provider], {
			system_message = config.system_message .. goal,
		})
		logger.log("provider_settings: " .. provider_settings.system_message)

		local result, err = provider.send_request(prompt, provider_settings)
		if err then
			print("Error during AI response request: " .. err)
		else
			ui.display_response(result.choices[1].message.content, config.window_type)
		end
	end)
end

function M.execute()
	local function is_goal_empty(goal)
		if goal == "" then
			print("Goal cannot be empty.")
			return
		end
	end

	local function is_marked_files(marked_files)
		if #marked_files == 0 then
			print("No marked files found during execution.")
			return
		end
	end

	ui.get_user_prompt("Enter the goal:", config.enable_history, function(goal)
		logger.log("initial goal input: " .. goal)
		is_goal_empty(goal)

		local files = marked.get_marked_files()
		is_marked_files(files)

		local prompt, err = M.format_files(files)
		if not prompt then
			print("Error formatting prompt: ", err)
			return
		end

		M.post(goal, prompt)

		if config.enable_history then
			history.add(goal, "AI response not captured in this script.")
		end
	end)
end

return M
