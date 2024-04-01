return {
  "nvimdev/dashboard-nvim",
  keys = {
    -- Stupid flash overrrides the default vim command of s for substitute - get core vim functionality back
    { "<leader>D", mode = { "n", "x" }, "<cmd>Dashboard<cr>", desc = "Dashboard" },
    -- Use q instead of s since we hate the core vim q for recording mode
  },
  opts = function(_, opts)
    local logo = [[
         ██████╗ ██╗██████╗ ██████╗  █████╗ ██████╗  ██████╗              
         ██╔══██╗██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔═══██╗             
         ██║  ██║██║██║  ██║██║  ██║███████║██║  ██║██║   ██║             
         ██║  ██║██║██║  ██║██║  ██║██╔══██║██║  ██║██║   ██║             
         ██████╔╝██║██████╔╝██████╔╝██║  ██║██████╔╝╚██████╔╝             
         ╚═════╝ ╚═╝╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝  ╚═════╝              
       ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
       ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
       ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
       ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
       ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
       ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           

[ Sometimes it pays to be lazy ]
    ]]
    logo = string.rep("\n", 8) .. logo .. "\n\n"

    -- opts.config.header = vim.split(logo, "\n", { triempty = true })
    opts.config.header = vim.split(logo, "\n")
  end,
}
