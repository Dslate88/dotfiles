local curl = require('plenary.curl')

local M = {}


-- Function to copy prompt to clipboard
local function copy_to_clipboard(prompt)
    vim.fn.setreg('+', prompt)  -- Set the clipboard register
    print("Prompt copied to clipboard!")
end

-- Helper function to read a file's content with better error handling
local function read_file(file_path)
    local utils = require('harpoon.utils')
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

    -- Iterate through marked files using the Harpoon source pattern
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
    local prompt = "GOAL: " .. goal .. "\n\n"
    for _, file in ipairs(files) do
        local content, err = read_file(file.filename)
        if not content then
            return nil, err
        end
        prompt = prompt .. "FILE NAME BEGIN: " .. file.filename .. "\n"
        prompt = prompt .. "FILE CONTENT BEGIN\n" .. content .. "\nFILE CONTENT END\n\n"
    end
    return prompt
end

function M.post(prompt)
    local provider = "openai"

    if provider == "azure" then
        local ENDPOINT = os.getenv("ENDPOINT")
        local DEPLOYMENT_ID = "gpt-4o"
        local KEY = os.getenv("AZURE_OPENAI_KEY")
        local baseURL = string.format("%s/openai/deployments/%s/completions?api-version=2024-06-01", ENDPOINT, DEPLOYMENT_ID)

        local response = curl.post(baseURL, {
            headers = {
                ["Content-Type"] = "application/json",
                ["Authorization"] = "Bearer " .. KEY
            },
            body = vim.fn.json_encode({
                prompt = prompt,
                max_tokens = 4000,
                temperature = 0.1,
                n = 1
            }),
        })

        if response.status == 200 then
            local response_data = vim.fn.json_decode(response.body)
            print("Azure Response: ", response_data.choices[1].text)
        else
            print("Error: ", response.status, response.body)
        end
    elseif provider == "openai" then
        local baseURL = "https://api.openai.com/v1/chat/completions"
        local DEPLOYMENT_ID = "gpt-4o-mini"
        local KEY = os.getenv("OPENAI_API_KEY")

        local response = curl.post(baseURL, {
            headers = {
                ["Content-Type"] = "application/json",
                ["Authorization"] = "Bearer " .. KEY
            },
            body = vim.fn.json_encode({
                model = DEPLOYMENT_ID,
                messages = {
                    { role = "user", content = prompt }
                },
                temperature = 0.2
            }),
        })

        if response.status == 200 then
            local response_data = vim.fn.json_decode(response.body)
            print("OpenAI Response: ", response_data.choices[1].message.content)
        else
            print("Error: ", response.status, response.body)
        end
    else
        print("Unsupported provider: ", provider)
    end
end

function M.execute()
    -- local goal = vim.fn.input("Enter the goal: ")
    -- if goal == "" then
    --     print("Goal cannot be empty.")
    --     return
    -- end
    local goal = "fill out goal"
    local marked_files = M.get_marked_files()
    local prompt, err = M.format_prompt(goal, marked_files)
    copy_to_clipboard(prompt)
    -- if not prompt then
    --     print("Error formatting prompt: ", err)
    --     return
    -- end
    -- M.post(prompt)
end


return M

