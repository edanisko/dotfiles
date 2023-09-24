    -- File tree sidebar
return
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require('nvim-tree').setup({
                git = {
                    ignore = false,
                },
                renderer = {
                    group_empty = true,
                    icons = {
                        show = {
                            folder_arrow = false,
                        },
                    },
                    indent_markers = {
                        enable = true
                    }
                }
            })

            vim.keymap.set('n', '<leader>n',':NvimTreeFindFileToggle<CR>')
        end

    }

