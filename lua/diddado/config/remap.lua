vim.g.mapleader = " "

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Windows commands
-- Make all windows equal in size
--lvim.keys.normal_mode["z="] = "<C-V><C-W>="
vim.keymap.set("n", "z=", "<C-V><C-W>=")

-- Make current window as large as possible
--lvim.keys.normal_mode["zb"] = "<C-V><C-W>_"
vim.keymap.set("n", "zb", "<C-V><C-W>_")

-- Move between windows
-- lvim.keys.normal_mode["zj"] = "<C-V><C-W>w<C-W>_"
-- lvim.keys.normal_mode["zk"] = "<C-V><C-W>W<C-W>_"
vim.keymap.set("n", "zj", "<C-V><C-W>w")
vim.keymap.set("n", "zk", "<C-V><C-W>W")

-- Open a new window on the file under the cursor
--lvim.keys.normal_mode["zf"] = "<C-W>f"
vim.keymap.set("n", "zf", "<C-W>f")
vim.keymap.set("n", "<leader>R", "<cmd>Telescope oldfiles<cr>")

-- Code folding
vim.keymap.set("n", "<leader>zo", "zR") -- Open all folds
vim.keymap.set("n", "<leader>zc", function() -- close all but first level folds
  -- Capture the current cursor position
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  -- Move to the top of the file
  vim.cmd("normal! 1G")
  -- Perform your operations
  vim.cmd("normal! zM")
  vim.cmd("normal! j")
  vim.cmd("normal! zo")
  -- Move back to the original cursor position
  -- Note: nvim_win_set_cursor expects the row and column indices to be 1-based
  vim.api.nvim_win_set_cursor(0, { r, c })
end)

-- -- move between files
-- vim.keymap.set("n", "<leader>p", "<C-o>") -- previous jump
-- vim.keymap.set("n", "<leader>n", "<C-i>") -- next jump
--
-- vim.keymap.set("n", "<leader>S", "<C-i>") -- next jump
-- --vim.keymap.set("n", "q", "<Nop>") -- next jump
--
-- vim.keymap.set("n", "Q", "q", { noremap = true, silent = true, desc = "Record" })
-- vim.keymap.set("n", "q", "<Nop>", { noremap = true, silent = true, desc = "Ignore the original q" })
