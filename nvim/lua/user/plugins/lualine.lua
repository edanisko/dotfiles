return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
           'kyazdani42/nvim-web-devicons'
        },
        config = function()
            local separator = { '"▏"', color = 'StatusLine' }
            require('lualine').setup({
              options = {
                section_separators = '',
                component_separators = '',
                globalstatus = true,
                theme = {
                  normal = {
                    a = 'StatusLine',
                    b = 'StatusLine',
                    c = 'StatusLine',
                  },
                },
              },
              sections = {
                lualine_a = {
                  'mode',
                  separator,
                },
                lualine_b = {
                  'branch',
                  'diff',
                  separator,
                  function ()
                    return '⚙  ' .. vim.pesc(tostring(#vim.tbl_keys(vim.lsp.buf_get_clients())) or '')
                  end,
                  { 'diagnostics', sources = { 'nvim_diagnostic' } },
                  separator,
                },
                lualine_c = {
                  'filename'
                },
                lualine_x = {
                  'filetype',
                  'encoding',
                  'fileformat',
                },
                lualine_y = {
                  separator,
                  '(vim.bo.expandtab and "␠ " or "⇥ ") .. " " .. vim.bo.shiftwidth',
                  separator,
                },
                lualine_z = {
                  'location',
                  'progress',
                },
              },
            })
        end
    }
}
