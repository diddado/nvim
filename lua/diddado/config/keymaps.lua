vim.keymap.set(
  "n",
  "<leader>S",
  require("telescope.builtin").grep_string,
  { noremap = true, silent = true, desc = "Search text under cursor" }
)
