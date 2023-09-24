    -- Fuzzy finder

return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'nvim-telescope/telescope-live-grep-args.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim', 
                build = 'make',
                conf = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
       config = function()
           local actions = require('telescope.actions')
           require('telescope').setup({
                   defaults = {
                       path_display = { truncate = 1 },
                       layout_config = {
                           prompt_position = 'top'
                       },
                       preview = {
                           timeout = 200,
                       },
                       sorting_strategy = 'ascending',
                       mappings = {
                           i = {
                               ['<ESC>'] = actions.close,
                               ['<C-Down>'] = actions.cycle_history_next,
                               ['<C-Up>'] = actions.cycle_history_prev,
                           },
                       },
                       file_ignore_patterns = { '.git/' },
                       pickers = {
                           find_files = {
                               hidden = true,
                           },
                           buffers = {
                               previewer = false,
                               layout_config = {
                                   width = 80,
                               },
                           },
                           oldfiles = { 
                               prompt_title = "History",
                           },
                           lsp_references = {
                               previewer = false,
                           },
                       },
                   }
               })

            require('telescope').load_extension('fzf')
            require('telescope').load_extension('live_grep_args')

            vim.keymap.set('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
            vim.keymap.set('n', '<leader>F', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files'})<CR>]])
            vim.keymap.set('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
            vim.keymap.set('n', '<leader>g', [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])
            vim.keymap.set('n', '<leader>h', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
            vim.keymap.set('n', '<leader>s', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])

        end,
    },
}








