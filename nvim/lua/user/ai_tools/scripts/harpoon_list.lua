local async = require('plenary.async')
local providers = require('user.ai_tools.providers')
local utils = require('user.ai_tools.utils')
local config = require('user.ai_tools.config')
local logger = require('user.ai_tools.logger')

local M = {}


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

-- Function to get marked files from Harpoon
function M.get_marked_files()
    local Marked = require('harpoon.mark')
    local files = {}

    -- Iterate through marked files using Harpoon
    for idx = 1, Marked.get_length() do
        local filename = Marked.get_marked_file_name(idx)
        if filename ~= "" then
            table.insert(files, { filename = filename })
        end
    end

    return files
end

-- Function to format the prompt
function M.format_prompt(goal, files)
    logger.log("Formatting prompt for goal: " .. goal, "INFO")

    local prompt = {}
    table.insert(prompt, "GOAL: " .. goal .. "\n")

    for _, file in ipairs(files) do
        local content, err = read_file(file.filename)
        if not content then
            logger.log("Error reading file: " .. err, "ERROR")
            return nil, err
        end
        logger.log("Successfully read file: " .. file.filename, "INFO")
        table.insert(prompt, "FILE NAME BEGIN: " .. file.filename .. "\n")
        table.insert(prompt, "FILE CONTENT BEGIN\n" .. content .. "\nFILE CONTENT END\n")
    end

    local final_prompt = table.concat(prompt, "\n")

    -- Log prompt length
    logger.log("Prompt length: " .. #final_prompt, "DEBUG")

    return final_prompt

end

-- Function to submit the prompt to the AI provider
function M.post(prompt)
    async.run(function()
        logger.log("Posting prompt to AI provider", "INFO")

        -- Select provider from config
        local selected_provider = providers[config.default_provider]
        if not selected_provider then
            logger.log("invalid provider: " .. selected_provider, "ERROR")
            return
        end

        -- Make async request to the provider
        local result, err = selected_provider.send_request(prompt)
        if err then
            logger.log("Error during AI response request: " .. err, "ERROR")
        else
            logger.log("AI response received successfully", "INFO")
            utils.show_ai_response(result.choices[1].message.content)
        end
    end)
end

-- Main function to execute the Harpoon integration
function M.execute()
    -- Request user input for the goal
    logger.log("Goal string collection", "INFO")
    local goal = vim.fn.input("Enter the goal: ")
    logger.log("Goal collected: " .. goal, "INFO")
    if goal == "" then
        logger.log("Goal cannot be empty", "WARNING")
        print("Goal cannot be empty.")
        return
    end

    -- Get marked files from Harpoon
    local marked_files = M.get_marked_files()
    if marked_files == 0 then
        logger.log("No marked files found during execution.", "WARNING")
        return
    end

    -- Format the prompt
    local prompt, err = M.format_prompt(goal, marked_files)
    if not prompt then
        print("Error formatting prompt: ", err)
        return
    end

    M.post(prompt)
    logger.log("No marked files found during execution.", "WARNING")

end

return M
