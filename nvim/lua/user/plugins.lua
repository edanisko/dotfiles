return {

    -- Add more languages
    -- "sheerun/vim-polyglot",
    -- Was causing problems with tpope/vim-sleuth

    -- Commenting support
    "tpope/vim-commentary",

    -- Add, change, and delete surrounding text
    "tpope/vim-surround",

    -- Useful commands like :Rename and :SudoWrite
    "tpope/vim-eunuch",

    -- Pairs of handy bracket mappinngs, like [b and ]b
    "tpope/vim-unimpaired",

    -- Indent autodetection with editorconfig support
    "tpope/vim-sleuth",

    -- Allow plugins to enable repeating of commands.
    "tpope/vim-repeat",

    -- Navigate seemlessly between Vim windows and Tmux panes.
    "christoomey/vim-tmux-navigator",

    -- Jump to the last location when opening a file
    "farmergreg/vim-lastplace",

    -- Enable * searching with visually selected text
    "nelstrom/vim-visual-star-search",

    -- Automatically create parent first when saving
    "jessarcher/vim-heritage",

    -- Text objects for HTML Attributes
    {
        "whatyouhide/vim-textobj-xmlattr",
        dependencies = {
            "kana/vim-textobj-user"
        }
    },

    -- Automatically add closing brackets, quotes, etc.
    {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    },

    -- Add smooth scrolling to avoid jarring jumps
    {
        'karb94/neoscroll.nvim',
        config = function()
            require('neoscroll').setup()
        end,

    },
    -- All closing buffers without closing the split window.
    {
        'famiu/bufdelete.nvim',
        config = function()
            vim.keymap.set('n','<leader>q',':Bdelete<CR>')
        end,

    },

    {
        'AndrewRadev/splitjoin.vim',
        config = function()
            vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
            vim.g.splitjoin_trailing_comma = 1
            vim.g.splitjoin_php_method_chain_full = 1
        end,
    },

    -- Automatically fix indentation when pasting code.
    {
        'sickill/vim-pasta',
        config = function()
            vim.g.pasta_disabled_filetypes = { 'fugitive' }
        end,
    },

    -- Add a dashboard
    {
        'glepnir/dashboard-nvim'
    },


    -- Git Commands
    {
        'tpope/vim-fugitive',
        dependencies = {'tpope/vim-rhubarb'}
    },

    -- Floating Terminal
    {
        'voldikss/vim-floaterm',
        config = function()
            vim.g.floaterm_width = 0.8
            vim.g.floaterm_height = 0.8
            vim.keymap.set('n', '<F1>', ':FloatermToggle<CR>')
            vim.keymap.set('t', '<F1>', '<C-\\><C-n>:FloatermToggle<CR>')
        end
    }



}






