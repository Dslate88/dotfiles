-- lua/user/ai_tools/utils.lua
local history = require('user.ai_tools.history')
local config = require('user.ai_tools.config')

local M = {}

-- Table to store callbacks for each buffer
local callbacks = {}

function M.make_request(provider, prompt)
    local response = provider.send_request(prompt)
    return response
end

function M.normalize_path(path)
    return path:gsub("\\", "/")
end

function M.copy_to_clipboard(text)
    vim.fn.setreg('+', text)
    print("Prompt copied to clipboard!")
end

function M.show_ai_response(response, window_type)
    -- Create a new buffer for the response
    local buf = vim.api.nvim_create_buf(false, true)
    local lines = vim.split(response, "\n")
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    -- Window options
    if window_type == 'popup' then
        local width = math.floor(vim.o.columns * 0.8)
        local height = math.floor(vim.o.lines * 0.8)
        local opts = {
            relative = 'editor',
            width = width,
            height = height,
            col = math.floor((vim.o.columns - width) / 2) - 1,
            row = math.floor((vim.o.lines - height) / 2) - 1,
            style = 'minimal',
            border = 'rounded',
        }
        vim.api.nvim_open_win(buf, true, opts)
    elseif window_type == 'split' then
        vim.cmd('vsplit')
        local win = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_buf(win, buf)
    else
        error('Invalid window type: ' .. window_type)
    end

    -- Override global settings with buffer-specific options
    vim.api.nvim_buf_set_option(buf, 'filetype', 'markdown') -- Set the filetype to 'markdown'
    vim.api.nvim_buf_set_option(buf, 'wrap', true)          -- Enable line wrapping
    vim.api.nvim_buf_set_option(buf, 'linebreak', true)     -- Break lines at word boundaries
    vim.api.nvim_buf_set_option(buf, 'breakindent', true)   -- Indent wrapped lines
    vim.api.nvim_buf_set_option(buf, 'breakindentopt', 'shift:2,min:20') -- Customize indentation
    vim.api.nvim_buf_set_option(buf, 'textwidth', 0)        -- Disable automatic line breaks
    vim.api.nvim_buf_set_option(buf, 'number', false)       -- Disable line numbers
    vim.api.nvim_buf_set_option(buf, 'relativenumber', false) -- Disable relative line numbers
    vim.api.nvim_buf_set_option(buf, 'spell', false)        -- Disable spell checking
    vim.api.nvim_buf_set_option(buf, 'conceallevel', 0)     -- Disable concealment
    vim.api.nvim_set_option('guifont', 'Monospace:h14')     -- GUI font

end

function M.prompt_with_history(prompt_message, enable_history, on_submit)
    local buf = vim.api.nvim_create_buf(false, true) -- Create a new buffer
    local width = math.floor(vim.o.columns * 0.5)
    local height = 3

    -- Set buffer options
    vim.api.nvim_buf_set_option(buf, 'buftype', 'prompt')
    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    vim.api.nvim_buf_set_option(buf, 'filetype', 'text')

    -- Insert prompt message
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, {prompt_message, ""})

    -- Open a floating window
    local win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        style = 'minimal',
        border = 'rounded',
    })

    -- Move cursor to the input line
    vim.api.nvim_win_set_cursor(win, {2, 0})

    -- Key mappings for history navigation in normal mode
    if enable_history then
        vim.api.nvim_buf_set_keymap(buf, 'n', 'k', ':lua require("user.ai_tools.utils").history_prev(' .. buf .. ')<CR>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(buf, 'n', 'j', ':lua require("user.ai_tools.utils").history_next(' .. buf .. ')<CR>', { noremap = true, silent = true })
    end

    -- Map Enter key to submit the prompt
    vim.api.nvim_buf_set_keymap(buf, 'i', '<CR>', '<Esc>:lua require("user.ai_tools.utils").submit_prompt(' .. buf .. ')<CR>', { noremap = true, silent = true })

    -- Store the callback in the callbacks table
    callbacks[buf] = on_submit

    -- History navigation functions
    function M.history_prev(bufnr)
        if M.current_index > 1 then
            M.current_index = M.current_index - 1
            local entry = history.get(M.current_index)
            if entry and entry.prompt then
                -- Split the prompt into lines if necessary
                local prompt_lines = vim.split(entry.prompt, "\n")
                vim.api.nvim_buf_set_lines(bufnr, 1, -1, false, prompt_lines)
            else
                vim.api.nvim_buf_set_lines(bufnr, 1, -1, false, {""})
            end
        end
    end

    function M.history_next(bufnr)
        if M.current_index < history.count() then
            M.current_index = M.current_index + 1
            local entry = history.get(M.current_index)
            if entry and entry.prompt then
                -- Split the prompt into lines if necessary
                local prompt_lines = vim.split(entry.prompt, "\n")
                vim.api.nvim_buf_set_lines(bufnr, 1, -1, false, prompt_lines)
            else
                vim.api.nvim_buf_set_lines(bufnr, 1, -1, false, {""})
            end
        else
            M.current_index = history.count() + 1
            vim.api.nvim_buf_set_lines(bufnr, 1, -1, false, {""})
        end
    end

    -- Function to handle prompt submission
    function M.submit_prompt(bufnr)
        local lines = vim.api.nvim_buf_get_lines(bufnr, 1, -1, false)
        local input = table.concat(lines, "\n")
        vim.api.nvim_win_close(win, true)
        if callbacks[bufnr] then
            callbacks[bufnr](input)
            callbacks[bufnr] = nil -- Remove the callback after execution
        end
    end

    -- Initialize history index
    M.current_index = history.count() + 1

    -- Enter insert mode automatically
    vim.cmd('startinsert')

    return
end

return M
