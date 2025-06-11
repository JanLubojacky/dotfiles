return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			python = { "ruff_check_fix", "ruff_sort_imports", "ruff_format" },
			rust = { "rustfmt" },
			json = { "jq" },
			yaml = { "yamlfmt" },
		},

		formatters = {
			ruff_check_fix = {
				command = "ruff",
				args = { "check", "--fix", "$FILENAME" },
				stdin = false,
			},
			ruff_sort_imports = {
				command = "ruff",
				args = { "check", "--select", "I", "--fix", "$FILENAME" },
				stdin = false,
			},
			ruff_format = {
				command = "ruff",
				args = { "format", "$FILENAME" },
				stdin = false,
			},
		},

		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		-- async formatting
		-- format_after_save = {
		--     lsp_fallback = true,
		-- }
	},
}
