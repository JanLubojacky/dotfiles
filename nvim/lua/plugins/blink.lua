return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap

    -- In your blink.cmp configuration
    keymap = {
      -- You can use 'preset = 'none'' if you want to start from scratch
      ['<Tab>'] = {
        function(cmp)
          -- If the completion menu is not visible yet, show it and select the first item
          if not cmp.is_active() then
            return cmp.show_and_insert()
          else
            -- If the menu is already visible, cycle to the next item
            return cmp.select_next()
          end
        end,
        'fallback', -- Fallback to normal Tab behavior if completion isn't applicable
      },
      -- You might also want to configure Shift+Tab for reverse navigation
      ['<S-Tab>'] = {
        'select_prev',
        'fallback',
      },
    },
    completion = {
      list = {
        selection = {
          -- Set preselect to false to ensure the first item isn't automatically selected
          -- until you press Tab
          preselect = false
        },
        cycle = {
          -- Control whether cycling wraps around at the end of the list
          from_top = true
        }
      }
    },

    -- experimental signatures
    signature = { enabled = true },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    -- completion = { documentation = { auto_show = false } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
