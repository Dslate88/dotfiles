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

-- Formatting group
augroup('Format', { clear = true })

autocmd('BufWritePre', {
  group = 'Format',
  pattern = {'*.js', '*.jsx', '*.ts', '*.tsx', '*.html', '*.css', '*.json', '*.lua'},
  command = 'Neoformat'
})

-- netrw auto group
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

      nmap <buffer> <TAB> mf
      nmap <buffer> <S-TAB> mF
      nmap <buffer> <Leader><TAB> mu

      nmap <buffer> ff %:w<CR>:buffer #<CR>
      nmap <buffer> fe R
      nmap <buffer> fc mc
      nmap <buffer> fC mtmc
      nmap <buffer> fx mm
      nmap <buffer> fX mtmm
      nmap <buffer> f; mx
    endfunction

]]
