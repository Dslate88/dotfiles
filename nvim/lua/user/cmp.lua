local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),

      ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
          elseif has_words_before() then
            cmp.complete()
          else
             fallback()
          end
      end, { "i", "s" }),

      ['<S-Tab>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s"}),
    }),

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

  require('lspconfig')['pyright'].setup {
    capabilities = capabilities,
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "off",
          autoSearchPaths = true,
          useLibraryCodeForTypes = false,
          reportUnusedVariable = true,
        },
      },
    },

  }

  require('lspconfig')['terraformls'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['marksman'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['jsonls'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['html'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['eslint'].setup {
    capabilities = capabilities
  }
  require('lspconfig').eslint.setup {
    capabilities = capabilities,
    settings = {
      packageManager = 'npm',
      codeActionOnSave = {
        enable = true,
        mode = 'all',  -- or "problems" to only fix actual errors
      },
      format = true,  -- Optional: you can use ESLint as a formatter
    },
    on_attach = function(client, bufnr)
      -- Optionally disable formatting if you use a different tool like Prettier for formatting
      client.server_capabilities.documentFormattingProvider = false
    end
  }

  require('lspconfig').ts_ls.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
    end
  }

  require('lspconfig')['lua_ls'].setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"},
            },
        },
    },
  }


