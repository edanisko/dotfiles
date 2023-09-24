vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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

require("lazy").setup({
	'nvim-telescope/telescope.nvim',
      	'nvim-lua/plenary.nvim',
      	{ 
		'rose-pine/neovim', 
		name = 'rose-pine',
		conifig = function()
			vim.cmd([[colorscheme rose-pine]])
		end,
	},
	{ 
		"nvim-tree/nvim-web-devicons", 
		lazy = true 
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"c", "lua", "vimdoc", "query", "python", "php", "javascript", "html", "dockerfile",
					"svelte", "typescript", "toml", "yaml", "css", "bash"
				},
				sync_install = false,
				auto_install = true,
				highlight = { 
					enable = true,
									
				},
				indent = { enable = true },
				additional_vim_regex_highlighting = false,


			})
		end
	},
	{
		'nvim-treesitter/playground',
	},
	{
		'theprimeagen/harpoon',
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")
			vim.keymap.set("n", "<leader>a", mark.add_file)
			vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

			vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end)
			vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end)
			vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end)
			vim.keymap.set("n", "<C-;>", function() ui.nav_file(4) end)
			
		end
	},
	{
		'mbbill/undotree',
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end
	},
	{
		'tpope/vim-fugitive',
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		end
	},


	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		lazy = true,
		config = false,
		init = function()
			-- Disable automatic setup, we are doing it manually
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		'williamboman/mason.nvim',
		lazy = false,
		config = true,
	},

	-- Autocompletion
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			{'L3MON4D3/LuaSnip'},
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			local lsp_zero = require('lsp-zero')
			lsp_zero.extend_cmp()

			-- And you can configure cmp even more, if you want to.
			local cmp = require('cmp')
			local cmp_action = lsp_zero.cmp_action()

			cmp.setup({
				formatting = lsp_zero.cmp_format(),
				mapping = cmp.mapping.preset.insert({
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-u>'] = cmp.mapping.scroll_docs(-4),
					['<C-d>'] = cmp.mapping.scroll_docs(4),
					['<C-f>'] = cmp_action.luasnip_jump_forward(),
					['<C-b>'] = cmp_action.luasnip_jump_backward(),
				})
			})
		end
	},

	-- LSP
	{
		'neovim/nvim-lspconfig',
		cmd = {'LspInfo', 'LspInstall', 'LspStart'},
		event = {'BufReadPre', 'BufNewFile'},
		dependencies = {
			{'hrsh7th/cmp-nvim-lsp'},
			{'williamboman/mason-lspconfig.nvim'},
		},
		config = function()
			-- This is where all the LSP shenanigans will live
			local lsp_zero = require('lsp-zero')
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({buffer = bufnr})
			end)

			require('mason-lspconfig').setup({
				ensure_installed = {},
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						-- (Optional) Configure lua language server for neovim
						local lua_opts = lsp_zero.nvim_lua_ls()
						require('lspconfig').lua_ls.setup(lua_opts)
					end,
				}
			})
		end
	}	



})


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


vim.cmd('colorscheme rose-pine')
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.cmd('set nu')
vim.cmd('set colorcolumn=80')
vim.cmd('set tabstop=3')
vim.cmd('set shiftwidth=3')

