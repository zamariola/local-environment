return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = { hidden = true }, -- Keeps your explorer fix working
        files = { hidden = true }, -- Fixes standard file search
        smart = { hidden = true }, -- Fixes 'smart' search (often used by <space> <space>)
      },
    },
  },
}
