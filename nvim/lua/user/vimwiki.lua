local M = {}

function M.auto_commands()
	-- Use if you prefer markdown
	vim.cmd([[
        let wiki_1 = {}
        let wiki_1.path = '~/Documents/vimwiki/'
        let wiki_1.nested_syntaxes = {'python': 'python'}
        let wiki_1.syntax = 'markdown'
        let wiki_1.ext2syntax = {'.wiki': 'markdown'}
        let wiki_1.ext = '.md'
        let g:vimwiki_list = [wiki_1]
        let g:vimwiki_markdown_link_ext = 1
        let g:vimwiki_global_ext = 0
    ]])
end

function M.setup()
	M.auto_commands()
end

M.setup()
