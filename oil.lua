return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
	config = function()
		require("oil").setup()
		vim.keymap.set("n", "<Leader>o", "<cmd>Oil<CR>", { desc = "Open [O]il", silent = true })
	end,
}
