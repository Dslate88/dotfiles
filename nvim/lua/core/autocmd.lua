local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd 


augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})

-- Formatting group
-- Apply neoformat on save
-- local packer_grp = vim.api.nvim_create_augroup("formatting", { clear = true } )
augroup("formatting", { clear = true })
autocmd("BufWritePre * undojoin", { 
    pattern = "*", 
    command = "Neoformat",
    group = "formatting"
})

autocmd('BufWritePre', {
  pattern = '*',
  command = ":%s/\\s\\+$//e",
  group = "formatting"
})
