-- lsp settings
vim.lsp.enable({
	"clangd",
	"rust_analyzer",
	"basedpyright",
	-- "ty",
	-- "pyrefly",
	"lua_ls",
	"terraformls",
	"gh_actions_ls",
	"tinymist",
})
vim.lsp.inlay_hint.enable(true)
vim.diagnostic.config({ virtual_text = true }) -- virtual text diagnostics for lsp

-- give windows border
vim.o.winborder = "rounded"

-- lsp keymaps
vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end)
vim.keymap.set("n", "gR", function()
	vim.lsp.buf.rename()
end)

vim.keymap.set("n", "gx", function()
	vim.diagnostic.open_float()
end)

-- lazy shortcut
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>")

-- renames linked to lsp
vim.api.nvim_create_autocmd("User", {
	pattern = "OilActionsPost",
	callback = function(event)
		if event.data.actions.type == "move" then
			Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
		end
	end,
})

-- center halfscreen jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.g.have_nerd_font = true

-- relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- cursor line
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

-- undo history between session
vim.opt.undofile = true

-- gui cursor
-- vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- tab config
vim.opt.expandtab = true -- spaces for tab
vim.opt.shiftwidth = 4 -- 4 spaces with << and >>
vim.opt.tabstop = 4 -- spaces shown per tab
vim.opt.softtabstop = 4 -- spaces when pressing tab
vim.opt.smarttab = true
vim.opt.smartindent = true

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>wl", "<cmd>vsplit<cr>", { desc = "Vsplit" })
vim.keymap.set("n", "<leader>wj", "<cmd>split<cr>", { desc = "Hsplit" })

-- sync w system clipboard
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
