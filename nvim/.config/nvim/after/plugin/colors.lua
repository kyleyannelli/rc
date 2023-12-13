function ColorMoreBetter(color)
	color = color or "monokai-pro"
	vim.cmd.colorscheme(color)

	-- Make the background transparent
	vim.api.nvim_set_hl(0, "Normal", { bg = "none"  })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"  })

    -- remove num line bg
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#696969", bg = "NONE" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
end


