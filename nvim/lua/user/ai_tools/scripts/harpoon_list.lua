-- TODO: move harpoon specific logic/functiosn to utils/harpoon.lua
-- TODO: the goal should be used as the system message, its not currently
local async = require('plenary.async')
local providers = require('user.ai_tools.providers')
local utils = require('user.ai_tools.utils')
local global_config = require('user.ai_tools.config')
local history = require('user.ai_tools.history')
local marked = require('user.ai_tools.harpoon')

local M = {}

-- Define per-script configuration
local config = {
    provider = "openai",
    window_type = "split", -- Options: 'popup' or 'split'
    enable_history = true, -- Enable history navigation
    system_message = "You are an expert code reviewer.", -- Customize AI role
}

-- Helper function to read a file's content with better error handling
local function read_file(file_path)
    local normalized_path = utils.normalize_path(file_path)

    local file = io.open(normalized_path, "r")
    if not file then
        return nil, "Could not open file: " .. normalized_path
    end

    local content = file:read("*all")
    file:close()

    return content
end

-- Function to format the prompt
function M.format_prompt(goal, files)
    local prompt = {}
    table.insert(prompt, "GOAL: " .. goal .. "\n")

    for _, file in ipairs(files) do
        local content, err = read_file(file.filename)
        if not content then
            print("Error reading file: " .. err)
            return nil, err
        end
        table.insert(prompt, "FILE NAME BEGIN: " .. file.filename .. "\n")
        table.insert(prompt, "FILE CONTENT BEGIN\n" .. content .. "\nFILE CONTENT END\n")
    end

    local final_prompt = table.concat(prompt, "\n")
    return final_prompt
end

-- Function to submit the prompt to the AI provider
function M.post(prompt)
    async.run(function()
        -- Select provider from config
        local selected_provider = providers[config.provider]
        if not selected_provider then
            print("Invalid provider: " .. config.provider)
            return
        end

        -- Prepare provider settings by merging global and script-specific settings
        local provider_settings = vim.tbl_deep_extend("force", {}, global_config.providers[config.provider], {
            system_message = config.system_message or global_config.default_system_message,
        })

        -- Make async request to the provider
        local result, err = selected_provider.send_request(prompt, provider_settings)
        if err then
            print("Error during AI response request: " .. err)
        else
            utils.show_ai_response(result.choices[1].message.content, config.window_type)
        end
    end)
end

-- Main function to execute the Harpoon integration
function M.execute()
    -- Request user input for the goal using prompt_with_history
    utils.prompt_with_history("Enter the goal:", config.enable_history, function(goal)
        if goal == "" then
            print("Goal cannot be empty.")
            return
        end

        -- Get marked files from Harpoon
        local marked_files = marked.get_marked_files()
        if #marked_files == 0 then
            print("No marked files found during execution.")
            return
        end

        -- Format the prompt
        local prompt, err = M.format_prompt(goal, marked_files)
        if not prompt then
            print("Error formatting prompt: ", err)
            return
        end

        -- Submit the prompt
        M.post(prompt)

        -- Add to history if enabled (optional, based on your design)
        -- For `harpoon_list.lua`, you might choose not to store AI responses in history
        if config.enable_history then
            history.add(goal, "AI response not captured in this script.")
        end
    end)
end

return M
