vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Handle moving rows inside wrapped text
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection
vim.keymap.set('v', 'y', 'myy`y')

-- Disable annoying command line typo
vim.keymap.set('n', 'q:', ':q')

-- Paste replace visual selection without copying it
vim.keymap.set('v', 'p', '"_dP')

-- Double Semi - Double Comma Magic!!
vim.keymap.set('i', ';;', '<ESC>A;')
vim.keymap.set('i', ',,', '<ESC>A,')

-- Quickly clear search highlight
vim.keymap.set('n','<leader>k', ':nohlsearch<CR>')

-- Open the curent file in the default program (on Mac this should be just open)
vim.keymap.set('n','<leader>x',':!open %<CR><CR>')

-- Move text up and down
-- vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
-- vim.keymap.set('i', '<A-k>', '<ESC>:move .-2<CR>==gi')
-- vim.keymap.set('n', '<A-j>', ':move .+1<CR>==')
-- vim.keymap.set('n', '<A-k>', ':move -2<CR>==')
-- vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv")
-- vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv")

-- ThePrimeagen pv replacement for Ex ¯\_(ツ)_/¯
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- The HOME END key 
vim.keymap.set('i', '<HOME>', '<ESC>A,')
-- Go to the first non-blank character of the line
vim.api.nvim_set_keymap('n', '<Home>', '^', { noremap = true, silent = true })

-- Go to the last character of the line
vim.api.nvim_set_keymap('n', '<End>', 'g_', { noremap = true, silent = true })
