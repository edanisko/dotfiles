return {
  {
    'nvim-treesitter/nvim-treesitter',
    init = function()
      require('nvim-treesitter.install').update({ with_sync=true })
    end,
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-textobjects'
    },
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'all',
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },
        context_commentstring = {
          enable = true
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['if'] = '@function.inner',
              ['af'] = '@function.out',
              ['ia'] = '@function.inner',
              ['aa'] = '@function.outer',
            }
          }
        }
      })
    end
  }

}
