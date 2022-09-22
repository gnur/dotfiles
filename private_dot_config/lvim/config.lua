local formatters = require "lvim.lsp.null-ls.formatters"

-- neovide settings
vim.opt.guifont = "CaskaydiaCove Nerd Font:h15"
vim.g.neovide_cursor_animation_length = 0.1
vim.g.neovide_cursor_trail_length = 0.8 -- determines how much the trail of the cursor lags behind the front edge
vim.g.neovide_cursor_antialiasing = true -- enables or disables antialiasing of the cursor quad
vim.g.neovide_cursor_vfx_mode = "ripple" -- railgun | torpedo | pixiedust | sonicboom | ripple | wireframe
vim.g.neovide_cursor_vfx_particle_lifetime = 0.4

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["s"] = ":Pounce<CR>"
lvim.keys.normal_mode["S"] = ":PounceRepeat<CR>"

lvim.builtin.bufferline.options.indicator_icon = nil
lvim.builtin.bufferline.options.indicator = { style = "icon", icon = "▎" }

-- /neovide settings

formatters.setup {
  { exe = "goimports" }
}

lvim.builtin.autopairs.active = false
lvim.builtin.cmp.active = true

lvim.plugins = {
  { "lunarvim/colorschemes" },
  { "tiagovla/tokyodark.nvim" },
  { "tpope/vim-repeat" },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
  },
  {
    "rlane/pounce.nvim",
    config = function()
      require 'pounce'.setup {
        accept_keys = "JFKDLSAHGNUVRBYTMICEOXWPQZ",
        accept_best_key = "<enter>",
        multi_window = true,
        debug = false,
      }
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require 'nvim-lastplace'.setup {}
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".on_attach() end,
  },
}

-- Configure builtin plugins
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true

vim.g.tokyonight_style = "night"
lvim.colorscheme       = "tokyonight"

lvim.format_on_save = true
lvim.lint_on_save = true

lvim.leader = "space"

lvim.builtin.treesitter.highlight.enabled = true
