return {{
  'lukas-reineke/indent-blankline.nvim',
  main = "ibl",
  opts = {},
  config = function()

    require('ibl').setup({
      -- filetype_exclude = {
      --   'help',
      --   'terminal',
      --   'dashboard',
      --   'packer',
      --   'lspinfo',
      --   'TelescopePrompt',
      --   'TelescopeResults',
      -- },
      -- buftype_exclude = {
      --   'terminal',
      --   'NvimTree',
      -- },
    })
  end
}}
