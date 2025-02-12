-- -- https://neovimcraft.com/plugin/nvim-neotest/neotest
-- -- Define a function to get the path
-- function getPath(str)
--   return str:match("(.*[/\\])")
-- end
-- -- Define a custom function to run neotest in the 'rails' subdirectory
-- function RailsDirectory(params)
--   local basePath = vim.uv.cwd()
--   -- .. "/rails"
--   if params.file then
--     basePath = getPath(params.file)
--   end
--   -- Append '/rails' to the current working directory path
--   local railsDirPath = basePath .. "/rails"
--
--   -- Execute neotest run command using the modified directory path
--   require("neotest").run.run(railsDirPath)
-- end
-- local plugin = "CHRIS TEST"
-- vim.notify("This is an error message.\nSomething went wrong!", "error", {
--   title = plugin,
--   on_open = function()
--     vim.notify("Attempting recovery.", vim.log.levels.WARN, {
--       title = plugin,
--     })
--     local timer = vim.loop.new_timer()
--     timer:start(2000, 0, function()
--       vim.notify("Fixing problem.\rPlease wait...", "info", {
--         title = plugin,
--         timeout = 3000,
--         on_close = function()
--           vim.notify("Problem solved", nil, { title = plugin })
--           vim.notify("Error code 0x0395AF", 1, { title = plugin })
--         end,
--       })
--     end)
--   end,
-- })

-- local railsRoot = vim.uv.cwd() .. "/rails"
-- vim.notify("ROOT:" .. railsRoot, vim.log.levels.WARN, {
--   title = "RAILS ROOT",
-- })

return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- "nvim-neotest/neotest-minitest",
  },
  opts = {
    -- Can be a list of adapters like what neotest expects,
    -- or a list of adapter names,
    -- or a table of adapter names, mapped to adapter configs.
    -- The adapter will then be automatically loaded with the config.
    -- adapters = {
    -- require("neotest-minitest")({
    --   -- ["neotest-minitest"] = {},
    --   -- ["neotest-go"] = {
    --   --   args = { "-tags=integration" },
    --   -- },
    --   require("neotest-minitest")({
    --     -- any additional configuration
    --     test_cmd = function()
    --       return vim.tbl_flatten({
    --         "/var/www/www.tukios.com/rails/bin/bundle",
    --         "/var/www/www.tukios.com/rails/bin/rails",
    --       })
    --     end,
    --   }),
    -- },
    -- filter_dir = function(name, rel_path, root)
    --   -- see :h neotest.Config.discovery for defaults
    --   vim.notify("NAME:" .. name, vim.log.levels.WARN, {
    --     title = "CHRIS CHECK",
    --   })
    --   vim.notify("REL_PATH:" .. rel_path, vim.log.levels.WARN, {
    --     title = "CHRIS CHECK",
    --   })
    --   vim.notify("ROOT:" .. root, vim.log.levels.WARN, {
    --     title = "CHRIS CHECK",
    --   })
    --   return root .. "/rails"
    -- end,
    status = { virtual_text = true },
    output = { open_on_run = true },
    quickfix = {
      open = function()
        if LazyVim.has("trouble.nvim") then
          require("trouble").open({ mode = "quickfix", focus = false })
        else
          vim.cmd("copen")
        end
      end,
    },
    -- project = { vim.uv.cwd() .. "/rails" },
  },
  config = function(_, opts)
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          -- Replace newline and tab characters with space for more compact diagnostics
          local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)

    opts.adapters = {
      require("neotest-minitest")({
        -- test_cmd = function(position_type)
        --   if position_type == "test" then
        --     return vim.tbl_flatten({
        --       "bundle",
        --       "exec",
        --       "rspec",
        --       "--fail-fast",
        --     })
        --   else
        --     return vim.tbl_flatten({
        --       "bundle",
        --       "exec",
        --       "rspec",
        --     })
        --   end
        -- end,
        -- root = function(dir)
        --
        -- end
        -- Custom root directory detection
        -- root_dir = function(path)
        --   -- Look for the Gemfile in the ./rails subdirectory
        --   local root = vim.fs.find({ "Gemfile" }, { upward = false, path = path })[1]
        --   if root then
        --     -- If found, return the directory containing the Gemfile as the root
        --     return vim.fs.dirname(root)
        --   end
        --   -- Fall back to default behavior if not found
        --   return vim.fs.dirname(path)
        -- end,
        -- root_dir = function(path)
        --   return vim.fs.dirname(path .. "./rails/Gemfile")
        -- end,
        -- any additional configuration
        -- minitest.root = minitest.root .. "/rails"
        --   root =
        --
        --
        -- root = function()
        --   vim.notify("IN ROOT FUNC:" .. railsRoot, vim.log.levels.WARN, {
        --     title = "IN ROOT FUNC",
        --   })
        --   return railsRoot
        -- end,
        --
        --
        test_cmd = function()
          -- vim.cmd("cd rails")
          -- vim.cmd("pwd")
          --
          -- vim.notify("PWD:" .. railsRoot, vim.log.levels.WARN, {
          --   title = "RAILS ROOT",
          -- })

          return vim.tbl_flatten({
            -- "./rails/bin/bundle",
            -- "exec",
            -- "rails",
            -- "./rails/bin/rails",
            -- "db:migrate",
            -- "RAILS_ENV=test",
            -- "&&",
            -- "./rails/bin/rails",
            "./bin/rails",
            "test",
          })
        end,
      }),
    }
    -- command = "cd rails && ./bin/bundle exec", /
    -- test_cmd = function()
    --   return vim.tbl_flatten({
    --     "cd rails && var/www/www.tukios.com/rails/bin/bundle",
    --     "cd rails && var/www/www.tukios.com/rails/bin/exec",
    --     "cd rails && var/www/www.tukios.com/rails/bin/rails",
    --     "cd rails && var/www/www.tukios.com/rails/bin/test",
    --   })
    -- end,
    -- opts.test_cmd = function()
    --   return vim.tbl_flatten({
    --     "/var/www/www.tukios.com/rails/bin/bundle",
    --     "/var/www/www.tukios.com/rails/bin/rails",
    --   })
    -- end

    if LazyVim.has("trouble.nvim") then
      opts.consumers = opts.consumers or {}
      -- Refresh and auto close trouble after running tests
      ---@type neotest.Consumer
      opts.consumers.trouble = function(client)
        client.listeners.results = function(adapter_id, results, partial)
          if partial then
            return
          end
          local tree = assert(client:get_position(nil, { adapter = adapter_id }))

          local failed = 0
          for pos_id, result in pairs(results) do
            if result.status == "failed" and tree:get_key(pos_id) then
              failed = failed + 1
            end
          end
          vim.schedule(function()
            local trouble = require("trouble")
            if trouble.is_open() then
              trouble.refresh()
              if failed == 0 then
                trouble.close()
              end
            end
          end)
          return {}
        end
      end
    end

    if opts.adapters then
      local adapters = {}
      for name, config in pairs(opts.adapters or {}) do
        if type(name) == "number" then
          if type(config) == "string" then
            config = require(config)
          end
          -- local railsRoot = vim.uv.cwd() .. "/rails"
          -- config.root = function()
          --   vim.notify("IN ROOT FUNC 2:" .. railsRoot, vim.log.levels.WARN, {
          --     title = "IN ROOT FUNC 2",
          --   })
          --   return railsRoot
          -- end
          adapters[#adapters + 1] = config
        elseif config ~= false then
          local adapter = require(name)
          -- local railsRoot = vim.uv.cwd() .. "/rails"
          -- adapter.root = function()
          --   vim.notify("IN ROOT FUNC 3:" .. railsRoot, vim.log.levels.WARN, {
          --     title = "IN ROOT FUNC 3",
          --   })
          --   return railsRoot
          -- end
          if type(config) == "table" and not vim.tbl_isempty(config) then
            local meta = getmetatable(adapter)
            if adapter.setup then
              adapter.setup(config)
            elseif meta and meta.__call then
              adapter(config)
            else
              error("Adapter " .. name .. " does not support setup")
            end
          end
          adapters[#adapters + 1] = adapter
        end
      end
      opts.adapters = adapters
    end

    require("neotest").setup(opts)
  end,
  -- stylua: ignore
  keys = {
    {
      "<leader>tt",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run File",
    },
    {
      "<leader>tT",
      function()
        require("neotest").run.run(vim.uv.cwd() .. "/rails")
      end,
      desc = "Run All Test Files",
    },
    {
      "<leader>tr",
      function()
        require("neotest").run.run()
      end,
      desc = "Run Nearest",
    },
    {
      "<leader>tl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run Last",
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle Summary",
    },
    {
      "<leader>to",
      function()
        require("neotest").output.open({ enter = true, auto_close = true })
      end,
      desc = "Show Output",
    },
    {
      "<leader>tO",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "Toggle Output Panel",
    },
    {
      "<leader>tS",
      function()
        require("neotest").run.stop()
      end,
      desc = "Stop",
    },
  },
}
