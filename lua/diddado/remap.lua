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
vim.keymap.set("n", "<leader>D", "<cmd>Dashboard<cr>")
vim.keymap.set("n", "<leader>R", "<cmd>Telescope oldfiles<cr>")
