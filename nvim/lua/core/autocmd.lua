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

vim.cmd [[

    function! NetrwMapping()
    endfunction

    augroup netrw_mapping
      autocmd!
      autocmd filetype netrw call NetrwMapping()
    augroup END

    function! NetrwMapping()
      nmap <buffer> H u
      nmap <buffer> h -^
      nmap <buffer> l <CR>

      nmap <buffer> . gh
      nmap <buffer> P <C-w>z

      nmap <buffer> L <CR>:Lexplore<CR>
      nmap <buffer> <Leader>dd :Lexplore<CR>
    endfunction

]]
