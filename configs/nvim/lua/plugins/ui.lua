return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- LazyVim specifically sets up the filename in a certain way.
      -- To force the full path, we can override the 'filename' component:
      opts.sections.lualine_c[4] = {
        "filename",
        path = 1, -- 0: Just filename, 1: Relative path, 2: Absolute path, 3: Absolute path with tilde
      }
    end,
  },
}
