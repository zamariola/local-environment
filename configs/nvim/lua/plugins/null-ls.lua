return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local null_ls = require("null-ls")
    opts.sources = vim.list_extend(opts.sources or {}, {
      -- SQLFluff Formatter
      null_ls.builtins.formatting.sqlfluff.with({
        extra_args = { "--dialect", "postgres" }, -- Replace "postgres" with your SQL dialect
      }),
      -- OR pg_format
      null_ls.builtins.formatting.pg_format,
    })
  end,
}
