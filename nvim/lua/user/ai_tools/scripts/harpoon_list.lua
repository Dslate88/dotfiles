-- NOTE: Still uses your formatter; we’ll simplify templates later.
local async = require("plenary.async")
local utils = require("user.ai_tools.utils")
local logger = require("user.ai_tools.logger")
local ui = require("user.ai_tools.ui")
local app_config = require("user.ai_tools.config")
local history = require("user.ai_tools.history")
local marked = require("user.ai_tools.harpoon")
local baml = require("user.ai_tools.baml_client")

local M = {}

local cfg = {
	window_type = app_config.defaults.window or "split",
	enable_history = app_config.defaults.history ~= false,
	system_prefix = "You are an expert code reviewer. Think step by step. Use the GOAL and the FILES below to help.",
}

function M.format_files(files)
	local p = {}

	for _, file in ipairs(files) do
		local content, err = utils.read_file(file.filename)
		if not content then
			return nil, "Error reading file: " .. err
		end
		table.insert(p, "FILE NAME BEGIN: " .. file.filename .. "\n")
		table.insert(p, "FILE CONTENT BEGIN:\n" .. content .. "\nFILE CONTENT END\n")
	end

	return table.concat(p, "\n")
end

local function hard_abort_if_empty_goal(goal)
	if goal == "" then
		vim.notify("Goal cannot be empty.", vim.log.levels.WARN)
		return true
	end
end

local function hard_abort_if_no_files(marked_files)
	if #marked_files == 0 then
		vim.notify("No Harpoon-marked files found.", vim.log.levels.WARN)
		return true
	end
end

function M.execute()
	ui.get_user_prompt("Enter the goal:", cfg.enable_history, function(goal)
		logger.log("initial goal input: " .. goal)

		if hard_abort_if_empty_goal(goal) then
			return
		end

		local files = marked.get_marked_files()
		if hard_abort_if_no_files(files) then
			return
		end

		local files_block, ferr = M.format_files(files)
		if not files_block then
			vim.notify(ferr or "Error formatting files", vim.log.levels.ERROR)
			return
		end

		local final = (cfg.system_prefix or "") .. "\n\n### GOAL\n" .. goal .. "\n\n### FILES\n" .. files_block

		local response, err = baml.send(final)
		if err then
			vim.notify("BAML error: " .. err, vim.log.levels.ERROR)
			return
		end

		ui.display_response(response, cfg.window_type)
		if cfg.enable_history then
			history.add(goal, response or "AI response not captured.")
		end
	end)
end

return M
