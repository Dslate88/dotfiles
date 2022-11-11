local M = {}

function M.auto_commands()

    vim.cmd [[
        imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
        let g:copilot_no_tab_map = v:true
    ]]

    end

function M.setup()
    M.auto_commands()
end

M.setup()
