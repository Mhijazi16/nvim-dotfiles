return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  { "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
      "nvimdev/dashboard-nvim",
      event = "VimEnter",
      opts = function()
        local logo = [[
                                                                                 
                   ████ ██████           █████      ██                     
                  ███████████             █████                             
                  █████████ ███████████████████ ███   ███████████   
                 █████████  ███    █████████████ █████ ██████████████   
                █████████ ██████████ █████████ █████ █████ ████ █████   
              ███████████ ███    ███ █████████ █████ █████ ████ █████  
             ██████  █████████████████████ ████ █████ █████ ████ ██████ 
          ]]

        logo = string.rep("\n", 8) .. logo .. "\n\n"

        local opts = {
          theme = "doom",
          hide = {
            -- this is taken care of by lualine
            statusline = false,
          },
          config = {
            header = vim.split(logo, "\n"),
            center = {
              { action = "Telescope find_files", desc = " Find file", icon = "🔍", key = "f" },
              { action = "ene | startinsert", desc = " New file", icon = "📄", key = "n" },
              { action = "Telescope oldfiles", desc = " Recent files", icon = "📂", key = "r" },
              { action = "Telescope live_grep", desc = " Find text", icon = "🔎", key = "g" },
              {
                action = [[lua require("lazyvim.util").telescope.config_files()()]],
                desc = " Config",
                icon = "⚙️",
                key = "c"
              },
              { action = 'lua require("persistence").load()', desc = " Restore Session", icon = "💾", key = "s" },
              { action = "LazyExtras", desc = " Lazy Extras", icon = "🛠️", key = "x" },
              { action = "Lazy", desc = " Lazy", icon = "🌀", key = "l" },
              { action = "qa", desc = " Quit", icon = "🚪", key = "q" },
            },
            footer = function()
              local stats = require("lazy").stats()
              local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
              return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
            end,
          },
        }

        return opts
      end,
    },
-- lazy.nvim
{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
        lsp = {
          signature = {
            enabled = false
          }
        },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    },
},
{
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
},
{
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "vim", "lua", "vimdoc",
     "html", "css"
    },
  },
},
}
