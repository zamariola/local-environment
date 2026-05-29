return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "latte",
      background = { light = "latte", dark = "latte" },
    },
  },

  { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = { style = "day" } },

  { "rose-pine/neovim", name = "rose-pine", lazy = false, priority = 1000, opts = { variant = "dawn" } },

  { "projekt0n/github-nvim-theme", name = "github-theme", lazy = false, priority = 1000 },

  { "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000, opts = { contrast = "soft" } },

  { "neanias/everforest-nvim", name = "everforest", lazy = false, priority = 1000 },

  { "rebelot/kanagawa.nvim", lazy = false, priority = 1000, opts = { background = { light = "lotus" } } },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },

  {
    "LazyVim/LazyVim",
    init = function()
      vim.o.background = "light"
    end,
  },
}
