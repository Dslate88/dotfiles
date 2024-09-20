-- lua/user/ai_tools/utils.lua


local M = {}



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

function M.read_file(file_path)
    local normalized_path = M.normalize_path(file_path)

    local file = io.open(normalized_path, "r")
    if not file then
        return nil, "Could not open file: " .. normalized_path
    end

    local content = file:read("*all")
    file:close()

    return content
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

return M
