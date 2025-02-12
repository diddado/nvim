-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
  return vim.api.nvim_create_augroup("dotvim_" .. name, { clear = true })
end

-- custom formatters for json files
autocmd("FileType", {
  group = augroup("formatters_json"),
  pattern = { "json" },
  callback = function(event)
    vim.keymap.set("n", "<leader>cJ", function()
      local filepath = vim.fn.expand("%:p")
      -- stylua: ignore
      vim.cmd("!jq 'to_entries|sort|from_entries' " .. filepath .. " > " .. filepath .. ".tmp && mv -vi -f " .. filepath .. ".tmp " .. filepath)
    end, { buffer = event.buf, desc = "Sort JSON Keys" })
    vim.keymap.set("n", "<leader>cj", function()
      local filepath = vim.fn.expand("%:p")
      -- stylua: ignore
      vim.cmd("!jq 'to_entries|from_entries' " .. filepath .. " > " .. filepath .. ".tmp && mv -vi -f " .. filepath .. ".tmp " .. filepath)
    end, { buffer = event.buf, desc = "Cleanup JSON" })
  end,
})
