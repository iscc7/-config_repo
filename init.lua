return {
  colorscheme = "tokyonight",
  plugins = {
    {
      -- colortheme
      {
        "folke/tokyonight.nvim",
      },
      {
        "simrat39/symbols-outline.nvim",
        config = function()
          require("symbols-outline").setup()
        end,
        event = "VeryLazy",
      },
      -- debuger adapter
      {
        "mfussenegger/nvim-dap",
        enabled = true,
        config = function()
          require("mason-nvim-dap").setup {
            ensure_installed = { 'python' },
            automatic_setup = true,
            -- handlers = {
            --   function(config)
            --     require('mason-nvim-dap').default_setup(config)
            --   end,
            --   python = function(config)
            --     config.adapter = {
            --       type = "executable",
            --       command = "C:/Users/y00800069/AppData/Local/Programs/Python/Python310/python.exe",
            --       arg = {
            --         "-m",
            --         "debugpy.adapter",
            --       },
            --     }
            --     require('mason-nvim-dap').default_setup(config)
            --   end,
            -- },
          }
        end,
      },
      -- auto save
      {
        "Pocco81/auto-save.nvim",
        config = function()
          require("auto-save").setup {
          }
        end,
        event = "VeryLazy",
      },
      {
        "L3MON4D3/LuaSnip",
        config = function(plugin, opts)
          require "plugins.configs.luasnip" (plugin, opts)                                     -- include the default astronvim config that calls the setup call
          require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/user/snippets" } } -- load snippets paths
        end,
      },
    },
  },
}
