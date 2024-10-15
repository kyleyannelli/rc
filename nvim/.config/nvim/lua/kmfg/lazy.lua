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
    -- FZF / File Previewer
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep'} },
    },
    -- Color Scheme (can apply from any repo)
    {
        'loctvl842/monokai-pro.nvim',
        name = 'monokai-pro',
        config = function()
            vim.cmd('colorscheme monokai-pro')
            -- Make the background transparent
            vim.api.nvim_set_hl(0, "Normal", { bg = "none"  })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"  })

            -- remove num line bg
            vim.api.nvim_set_hl(0, "LineNr", { fg = "#696969", bg = "NONE" })
            vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
        end
    },
    -- Only syntax coloring. NOT AN LSP
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        defaults = {
            lazy = false,
            version = nil,
        },
    },
    -- Easier file marking
    {
        {
            "ThePrimeagen/harpoon",
            branch = "harpoon2",
            dependencies = { {"nvim-lua/plenary.nvim"} }
        }
    },
    -- Allows you to see, rollback to, adjust, etc.. changes that have been made in buffer similar to git hist/chlg
    "mbbill/undotree",
    -- Allows movement between BOTH vim & tmux panes with crtl + h/j/k/l
    "christoomey/vim-tmux-navigator",
    -- LSP (goodbye coc.nvim :( <3)
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            {"j-hui/fidget.nvim"},
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    },
    -- Gives code action pop (still miss Coc Code action menu)
    {
        "aznhe21/actions-preview.nvim",
        config = function()
            vim.keymap.set({ "v", "n" }, "<leader>c", require("actions-preview").code_actions)
        end,
    },
    -- Add scope lines (indent lines)
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
                highlight = "Whitespace",
            },
            scope = { enabled = true },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
            },
        },
        main = "ibl",
    },
    -- Active indent guide and indent text objects. When you're browsing
    -- code, this highlights the current level of indentation, and animates
    -- the highlighting.
    {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        opts = {
            -- symbol = "▏",
            symbol = "│",
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },
    "nvim-tree/nvim-web-devicons",
    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = true,
    },
    "onsails/lspkind.nvim",
    "ThePrimeagen/vim-apm",
    -- Trying nvim-dap setup outlined in https://miguelcrespo.co/posts/how-to-debug-like-a-pro-using-neovim
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "leoluz/nvim-dap-go", "nvim-neotest/nvim-nio" },
        init = function ()
        end,
    },
    -- Laravel
    {
        "adalessa/laravel.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-dotenv",
            "MunifTanjim/nui.nvim",
            "nvimtools/none-ls.nvim",
        },
        cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
        keys = {
            { "<leader>la", ":Laravel artisan<cr>" },
            { "<leader>ls", ":Laravel sail<cr>" },
            { "<leader>lc", ":Laravel composer<cr>" },
            { "<leader>lr", ":Laravel routes<cr>" },
            { "<leader>lm", ":Laravel related<cr>" },
        },
        opts = {
            features = {
                null_ls = {
                    enable = true,
                },
                route_info = {
                    enable = true,         --- to enable the laravel.nvim virtual text
                    position = 'right',    --- where to show the info (available options 'right', 'top')
                    middlewares = true,    --- wheather to show the middlewares section in the info
                    method = true,         --- wheather to show the method section in the info
                    uri = true             --- wheather to show the uri section in the info
                },
            },
        },
        config = true,
    },
    {
        "stevearc/conform.nvim",
        lazy = true,
        event = { "BufReadPre", "BufNewFile" },
        config = function() 
            local conform = require("conform")

            conform.setup({ 
                formatters_by_ft = { 
                    php = { "php" }, 
                }, 
                format_on_save = { 
                    lsp_fallback = true, 
                    async = false, 
                    timeout_ms = 1000, 
                }, 
                notify_on_error = true, 
                formatters = { 
                    php = { 
                        command = "php-cs-fixer", 
                        args = { 
                            "fix", 
                            "$FILENAME",
                            "--allow-risky=no",
                        }, 
                        stdin = false,
                    }
                }
            })
        end,
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            local notify = require("notify")
            -- this for transparency
            notify.setup({ background_colour = "#000000" })
            -- this overwrites the vim notify function
            vim.notify = notify.notify
        end
    },
    {
        'linux-cultist/venv-selector.nvim',
        dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
        branch = "regexp",
        opts = {
            -- Your options go here
            -- name = "venv",
            -- auto_refresh = false
        },
        event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
        keys = {
            -- Keymap to open VenvSelector to pick a venv.
            { '<leader>vs', '<cmd>VenvSelect<cr>' },
            -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
            { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
        },
    },
    {
        'tpope/vim-fugitive'
    },
    {
        'OscarCreator/rsync.nvim',
        build = 'make',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require("rsync").setup()
        end,
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signs = {
                    add          = { text = '+' },
                    change       = { text = '┃' },
                    delete       = { text = '-' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked    = { text = '┆' },
                },
                signs_staged = {
                    add          = { text = '+' },
                    change       = { text = '┃' },
                    delete       = { text = '-' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked    = { text = '┆' },
                },
                signs_staged_enable = true,
                signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
                numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
                linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir = {
                    follow_files = true
                },
                auto_attach = true,
                attach_to_untracked = false,
                current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                    virt_text_priority = 100,
                    use_focus = true,
                },
                current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil, -- Use default
                max_file_length = 40000, -- Disable if file is longer than this (in lines)
                preview_config = {
                    -- Options passed to nvim_open_win
                    border = 'single',
                    style = 'minimal',
                    relative = 'cursor',
                    row = 0,
                    col = 1
                },
            }
        end,
    },
})
