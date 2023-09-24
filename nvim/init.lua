require('user/options')
require('user/keymaps')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
   
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
 -- print(vim.fn.stdpath("config") .. "/lazy-lock.json")

require("lazy").setup('user/plugins',
 {
    lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json", -- lockfile generated after running update.
 }
)

-- vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = vim.api.nvim_get_hl_by_name('PMenuSel', false).bg, fg = vim.api.nvim_get_hl_by_name('PMenuSel', false).fg })
-- vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = vim.api.nvim_get_hl_by_name('PMenuSel', false).bg, fg = vim.api.nvim_get_hl_by_name('PMenuSel', false).fg })
-- vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = vim.api.nvim_get_hl_by_name('NormalFloat', false).bg, fg = vim.api.nvim_get_hl_by_name('NormalFloat', false).fg })
-- vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = vim.api.nvim_get_hl_by_name('FloatBorder', false).bg, fg = vim.api.nvim_get_hl_by_name('FloatBorder', false).fg })
-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = vim.api.nvim_get_hl_by_name('CursorLine', false).bg, fg = vim.api.nvim_get_hl_by_name('CursorLine', false).fg })
-- vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = vim.api.nvim_get_hl_by_name('CursorLine', false).bg, fg = vim.api.nvim_get_hl_by_name('CursorLine', false).fg })
