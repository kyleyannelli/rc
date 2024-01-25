local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({buffer = bufnr})
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.api.nvim_set_keymap('n', '<leader>i', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

end)

require('fidget').setup({})

require('mason').setup({})

require('mason-lspconfig').setup({
	-- Replace the language servers listed here 
	-- with the ones you want to install
	ensure_installed = { 'rust_analyzer', 'jdtls' },
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
	},
})

-- Java LSP setup
local java_opts = {
    -- Add your Java-specific configurations here
}
require('lspconfig').jdtls.setup(java_opts)

-- Unused but decent example UnoCSS Setup (add go to it)
--[[
require'lspconfig'.unocss.setup{
    cmd = { "unocss-language-server", "--stdio" },
    filetypes = { "html", "javascriptreact", "rescript", "typescriptreact", "vue", "svelte" },
    root_dir = require'lspconfig'.util.root_pattern(
        "unocss.config.js", 
        "unocss.config.ts", 
        "uno.config.js", 
        "uno.config.ts",
        "go.mod"
    )
}
--]]

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local lspkind = require('lspkind')

cmp.setup({
	sources = {
		{name = 'nvim_lsp'},
	},
	mapping = {
		['<Tab>'] = cmp_action.luasnip_supertab(),
		['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
		['<CR>'] = cmp.mapping.confirm({select = false}),
		['<C-e>'] = cmp.mapping.abort(),
		['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
		['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
		['<C-p>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item({behavior = 'insert'})
			else
				cmp.complete()
			end
		end),
		['<C-n>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item({behavior = 'insert'})
			else
				cmp.complete()
			end
		end),
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            menu = ({ -- showing type in menu
            nvim_lsp = "[LSP]",
            path = "[Path]",
            buffer = "[Buffer]",
            luasnip = "[LuaSnip]",
        }),
        before = function(entry, vim_item) -- for tailwind css autocomplete
            if vim_item.kind == 'Color' and entry.completion_item.documentation then
                local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')
                if r then
                    local color = string.format('%02x', r) .. string.format('%02x', g) ..string.format('%02x', b)
                    local group = 'Tw_' .. color
                    if vim.fn.hlID(group) < 1 then
                        vim.api.nvim_set_hl(0, group, {fg = '#' .. color})
                    end
                    vim_item.kind = "■" -- or "⬤" or anything
                    vim_item.kind_hl_group = group
                    return vim_item
                end
            end
            -- vim_item.kind = icons[vim_item.kind] and (icons[vim_item.kind] .. vim_item.kind) or vim_item.kind
            -- or just show the icon
            vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
            return vim_item
        end
    })
}
})

