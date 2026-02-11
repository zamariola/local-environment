-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Grep visual selection with Telescope
vim.keymap.set("v", "<leader>sg", function()
  -- 1. Grab selection
  vim.cmd('noau normal! "vy')
  local text = vim.fn.getreg("v")
  vim.fn.setreg("v", {})

  -- 2. Strip trailing/leading whitespace and newlines
  -- if you just want to find the text content
  local pattern = text:gsub("\n", " "):gsub("^%s+", ""):gsub("%s+$", "")

  -- 3. Use Snacks with 'live' set to false for a literal search
  Snacks.picker.grep({
    search = pattern,
    -- This ensures special chars like quotes or brackets aren't treated as regex
    args = { "--fixed-strings" },
  })
end, { desc = "Grep Selection" })
