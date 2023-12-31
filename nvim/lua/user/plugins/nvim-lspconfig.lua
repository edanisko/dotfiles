return {{
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
    'edanisko/null-ls.nvim',
    'jayp0521/mason-null-ls.nvim'
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({ automatic_installation = true })

    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())


    -- PHP
    require'lspconfig'.intelephense.setup{capabilities = capabilities}

    -- Python
    require('lspconfig').pyright.setup{capabilities = capabilities}

    -- Vue, Javascript, Typescript
    require('lspconfig').volar.setup({
      capabilities = capabilities,
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue'}
    })

    -- Tailwindcss
    require'lspconfig'.tailwindcss.setup{capabilities = capabilities}

    -- JSON
    require('lspconfig').jsonls.setup({
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
        }
      }
    })

    -- null-ls
    require('null-ls').setup({
      sources = {
        require('null-ls').builtins.diagnostics.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file({ '.elslintc.js' })
          end
        }),
        require('null-ls').builtins.diagnostics.trail_space.with({
          disabled_filetypes = { 'NvimTree' }
        }),
        require('null-ls').builtins.formatting.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file({ '.eslintrc.js' })
          end
        }),
       require('null-ls').builtins.formatting.prettierd
      },
    })

    require('mason-null-ls').setup({automatic_installation = true})

    -- Keymaps
    vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
    vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>')
    vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
    vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
    vim.keymap.set('n', '<Leader>lr', ':LspRestart<CR>', { silent = true })
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')


    -- Commands
    vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format({ timeout_ms = 5000 }) end, {})


  -- Diagnostic configuration
  vim.diagnostic.config({
    virtual_text = false,
    float = {
      source = true
    }
  })

  -- Sign configuration
  vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
  vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
  vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
  vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })


  end

}}
