local M = {}

function M.auto_commands()

    -- Use if you prfer markdown, vimwiki defaults enable html pages
    -- let wiki_1.syntax = 'markdown'
    -- let wiki_1.ext = '.md'

    vim.cmd [[
        let wiki_1 = {}
        let wiki_1.path = '~/vimwiki/'
        let wiki_1.html_template = '~/vimwiki/template.tpl'
        let wiki_1.nested_syntaxes = {'python': 'python'}

        let g:vimwiki_list = [wiki_1]
    ]]

    -- Use if you prefer markdown
    -- vim.cmd [[
    --     let g:vimwiki_markdown_link_ext = 1
    -- ]]

    -- vim.cmd [[
    --     let g:taskwiki_markup_syntax = 'markdown'
    -- ]]
    --
    -- vim.cmd [[
    --     let g:markdown_folding = 1
    -- ]]
    end

function M.setup()
    M.auto_commands()
end

M.setup()
