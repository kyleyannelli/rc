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
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep'} }
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
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    -- Trying nvim-dap setup outlined in https://miguelcrespo.co/posts/how-to-debug-like-a-pro-using-neovim
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "leoluz/nvim-dap-go" },
        init = function ()
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.after.event_initialized["dapui_config"]=function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"]=function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"]=function()
                dapui.close()
            end
            vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
            vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})
        end,
    },
})
