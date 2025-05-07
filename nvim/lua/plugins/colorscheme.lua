return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			no_italic = true,
			transparent_background = true,
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
