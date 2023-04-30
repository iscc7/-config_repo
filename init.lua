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
          local dap = require('dap')
          dap.adapters = {
            python = {
              type = "executable",
              command = "python",
              args = { "-m", "debugpy.adapter" },
            },
          }
          dap.configurations = {
            python = {
              {
                type = "python",
                request = "launch",
                name = "launch file",
                program = "${file}",
                pythonPath = function()
                  return "python"
                end
              },
            },
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
      -- snippets
      {
        "L3MON4D3/LuaSnip",
        config = function(plugin, opts)
          require "plugins.configs.luasnip" (plugin, opts)                                       -- include the default astronvim config that calls the setup call
          require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/user/snippets" } } -- load snippets paths
        end,
      },
      -- markdown-preview
      {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        lazy = true,
        build = "cd app && npm install && git reset --hard",
        event = "VeryLazy",
      },
      -- code runner
      {
        "CRAG666/code_runner.nvim",
        config = function()
          require('code_runner').setup({
            mode = "toggleterm",
            -- put here the commands by filetype
            filetype = {
              python = "python -u",
            },
          })
          -- code runner key mapping
          local map = vim.api.nvim_set_keymap
          map("n", "<leader>r", ":RunCode<CR>", { desc = "Run Code" })
        end,
        event = "VeryLazy",
      },
    },
  },
}
