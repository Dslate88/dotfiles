-- require("taskwiki").setup{
--     list = {path = '~/vimwiki/', syntax = 'markdown', ext = '.md'}
-- -- vim.g.vimwiki_list = {path = '~/vimwiki/', syntax = 'markdown', ext = '.md'}
-- }
local M = {}

function M.auto_commands()
    vim.cmd [[
        let wiki_1 = {}
        let wiki_1.path = '~/vimwiki/'
        let wiki_1.html_template = '~/vimwiki/template.tpl'
        let wiki_1.nested_syntaxes = {'python': 'python'}
        let wiki_1.syntax = 'markdown'
        let wiki_1.ext = '.md'
        let g:vimwiki_list = [wiki_1]
    ]]

    vim.cmd [[
        let g:vimwiki_markdown_link_ext = 1
    ]]

    vim.cmd [[
        let g:taskwiki_markup_syntax = 'markdown'
    ]]

    vim.cmd [[
        let g:markdown_folding = 1
    ]]
    end

function M.setup()
    M.auto_commands()
end

M.setup()
-- taskwiki configs
-- vim.api.nvim_exec(
--     [[
--         let g:vimwiki_list{
--             'path': '~/vimwiki/', 'syntax' = 'markdown', 'ext' = '.md'
--         }
--     ]],
--     false
-- )


-- vim.g.vimwiki_list = {path = '~/vimwiki/', syntax = 'markdown', ext = '.md'}
-- vim.g.vimwiki_markdown_link_ext = 1
-- vim.g.taskwiki_markup_syntax = "markdown"
-- vim.g.markdown_folding = 1

