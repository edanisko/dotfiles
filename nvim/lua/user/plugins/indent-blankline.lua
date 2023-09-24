return {{
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    
    require('indent_blankline').setup({
      filetype_exclude = {
        'help',
        'terminal',
        'dashboard',
        'packer',
        'lspinfo',
        'TelescopePrompt',
        'TelescopeResults',
      },
      buftype_exclude = {
        'terminal',
        'NvimTree',
      },
    })
  end
}}
