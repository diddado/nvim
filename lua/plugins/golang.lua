return {
  "olexsmir/gopher.nvim",
  config = function()
    require("gopher").setup({
      -- Configuration options go here
      -- For example, you can set key mappings, customize features, etc.
      -- Refer to the gopher.nvim GitHub repository for all available options
      commands = {
        go = "go",
        gomodifytags = "gomodifytags",
        gotests = "~/go/bin/gotests", -- also you can set custom command path
        impl = "impl",
        iferr = "iferr",
      },
    })
  end,
  requires = { -- dependencies
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}

-- return {
-- {
--   "williamboman/mason.nvim",
--   opts = {
--     ensure_installed = {
--       "gopls",
--     },
--   },
--   {
--     "neovim/nvim-lspconfig",
--     config = function()
--       require("plugins.configs.lspconfig")
--       require("diddado.configs.lspconfig")
--     end,
--   },
-- {
--   "mfussenegger/nvim-dap",
--   init = function()
--     require("core.utils").load_mappings("dap")
--   end,
-- },
-- {
--   "leoluz/nvim-dap-go",
--   ft = "go",
--   dependencies = "mfussenegger/nvim-dap",
--   config = function(_, opts)
--     require("dap-go").setup(opts)
--   end,
-- },
-- }
