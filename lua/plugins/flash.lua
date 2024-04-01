return {
  -- "ggandor/leap.nvim",
  "folke/flash.nvim",
  -- keys = { "s", mode = { "n", "x", "o" }, "c1" },
  keys = {
    -- Stupid flash overrrides the default vim command of s for substitute - get core vim functionality back
    { "s", mode = { "n", "x", "o" }, false },
    -- Use q instead of s since we hate the core vim q for recording mode
    {
      "q",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
  },
}
