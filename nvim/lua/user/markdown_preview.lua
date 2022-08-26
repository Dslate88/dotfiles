local M = {}

function M.auto_commands()

    vim.cmd [[
        let g:mkdp_filetypes = ['markdown']
    ]]
    end

function M.setup()
    M.auto_commands()
end

M.setup()

