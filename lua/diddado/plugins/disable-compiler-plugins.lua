-- lua/plugins/disable-compiler-plugins.lua
return {
  -- Disable Tree-sitter and related plugins to avoid compilation
  { "nvim-treesitter/nvim-treesitter", enabled = false }, -- Tree-sitter core (requires C compiler)&#8203;:contentReference[oaicite:7]{index=7}&#8203;:contentReference[oaicite:8]{index=8}
  { "nvim-treesitter/nvim-treesitter-textobjects", enabled = false }, -- Textobjects addon (depends on Tree-sitter)&#8203;:contentReference[oaicite:9]{index=9}
  { "windwp/nvim-ts-autotag", enabled = false }, -- Auto-close tags (depends on Tree-sitter)&#8203;:contentReference[oaicite:10]{index=10}
  -- (Optional) Disable Telescope FZF native if present
  { "nvim-telescope/telescope-fzf-native.nvim", enabled = false }, -- FZF native sorter (requires make)&#8203;:contentReference[oaicite:11]{index=11}
  { "olexsmir/gopher.nvim", enabled = false }, -- FZF native sorter (requires make)&#8203;:contentReference[oaicite:11]{index=11}
}
