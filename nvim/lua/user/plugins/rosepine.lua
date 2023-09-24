-- Lazy vim bootstrap
return {
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        priority = 1000,
        config = function()
            vim.cmd('colorscheme rose-pine')
            vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
            vim.api.nvim_set_hl(0, 'FloatBorder', {
                fg = "#30323E",
                bg = 'NONE' 
            })
            vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = vim.api.nvim_get_hl_by_name('PMenuSel', false).bg, fg = vim.api.nvim_get_hl_by_name('PMenuSel', false).fg })
            vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = vim.api.nvim_get_hl_by_name('PMenuSel', false).bg, fg = vim.api.nvim_get_hl_by_name('PMenuSel', false).fg })
            vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = vim.api.nvim_get_hl_by_name('NormalFloat', false).bg, fg = vim.api.nvim_get_hl_by_name('NormalFloat', false).fg })
            vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = vim.api.nvim_get_hl_by_name('FloatBorder', false).bg, fg = vim.api.nvim_get_hl_by_name('FloatBorder', false).fg })
            vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = vim.api.nvim_get_hl_by_name('CursorLine', false).bg, fg = vim.api.nvim_get_hl_by_name('CursorLine', false).fg })
            vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = vim.api.nvim_get_hl_by_name('CursorLine', false).bg, fg = vim.api.nvim_get_hl_by_name('CursorLine', false).fg })

            -- NvimTree highlights
            vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = "#30323E" } )

            -- Lualine highlights
            vim.api.nvim_set_hl(0, 'StatusLine', { fg='#FFB000', bg = "#080808" } )
            vim.api.nvim_set_hl(0, 'StatusLineNonText', { bg = "#080808" } )

            -- Floaterm highlights
            -- vim.api.nvim_set_hl(0, "Floaterm", {  fg='#FFD887'})
            vim.api.nvim_set_hl(0, "FloatermBorder", {  fg='#FFB000'})



        end,
    },
}
