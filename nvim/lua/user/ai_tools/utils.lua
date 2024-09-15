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

function M.show_ai_response(response)
    -- Create a new buffer for the popup
    local buf = vim.api.nvim_create_buf(false, true)  -- Create a new scratch buffer

    -- Split the response into lines
    local lines = vim.split(response, "\n")

    -- Set the lines to the buffer
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    -- Set the filetype to markdown
    vim.api.nvim_buf_set_option(buf, 'filetype', 'markdown')
    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    vim.api.nvim_buf_set_option(buf, 'modifiable', false)

    -- Set wrap and linebreak options for the buffer
    vim.api.nvim_buf_set_option(buf, 'wrap', true)
    vim.api.nvim_buf_set_option(buf, 'linebreak', true)
    vim.api.nvim_buf_set_option(buf, 'textwidth', 0) 

    -- Calculate window size
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)

    -- Open a floating window and set its options
    local win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        col = math.floor((vim.o.columns - width) / 2),
        row = math.floor((vim.o.lines - height) / 2),
        style = 'minimal',
        border = 'rounded',
    })

    -- Optionally: Focus the new window
    vim.api.nvim_set_current_win(win)
end

return M
