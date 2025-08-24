return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			bold = false,
			contrast = "hard",
			transparent_mode = true,
		})
		vim.cmd.colorscheme("gruvbox")
		vim.cmd.hi("Comment gui=none")
	end,
}
