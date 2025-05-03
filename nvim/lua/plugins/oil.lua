return {
  'stevearc/oil.nvim',
  --@module 'oil'
  --@type oil.SetupOpts
  opts = {
    -- Use float layout
    view_options = {
      show_hidden = true,
    },
    -- Configure the floating window appearance
    float = {
      -- Padding around the floating window
      padding = 2,
      -- Set max_width and max_height as percentages (0.8 = 80% of screen)
      max_width = 0.8,
      max_height = 0.8,
	border = "rounded",
	},
    keymaps = {
	["q"] = { "actions.close", mode = "n" },
    ["<bs>"] = { "actions.parent", mode = "n" },
    }
  },
  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
  dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
  lazy = false,
  keys = {
  	{ "<leader>e", "<cmd>Oil --float<cr>", desc = "Oil" }
  },
}
