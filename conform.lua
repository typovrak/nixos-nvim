return { -- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			["*"] = { "codespell" },
			["_"] = { "trim_whitespace" },
			lua = { "stylua" },
			python = { "black" },
			nix = { "nixfmt" },
			rust = { "rustfmt" },
			go = { "goimports", "gofmt" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 500,
		},
		format_after_save = {
			lsp_format = "fallback",
		},
		notify_on_error = false,
	},
}
