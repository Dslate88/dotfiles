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

return M
