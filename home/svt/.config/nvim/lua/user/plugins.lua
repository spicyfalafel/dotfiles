return {
  init = {
    -- You can disable default plugins as follows:
    -- ["goolord/alpha-nvim"] = { disable = true },

    -- You can also add new plugins here as well:
    -- Add plugins, the packer syntax without the "use"
    -- { "andweeb/presence.nvim" },
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },
    ["catppuccin/nvim"] = {
      config = function()
        require("catppuccin").setup {}
      end,
    },
    -- this is shitty
    ["cbochs/portal.nvim"] = {
      requires = {
        "cbochs/grapple.nvim",  -- Optional: provides the "grapple" query item
        "ThePrimeagen/harpoon", -- Optional: provides the "harpoon" query item
      },
    },
    ["Pocco81/true-zen.nvim"] = {
	    config = function()
		    require("true-zen").setup {
			    -- your config goes here
			    -- or just leave it empty :)
		    }
	    end,

    },
    --   ["nvim-neorg/neorg"] = {
    --     ft = "norg",
    --     after = "nvim-treesitter", -- You may want to specify Telescope here as well
    --     run = ":Neorg sync-parsers",
    --     config = function()
    --       require('neorg').setup {
    --         load = {
    --           ["core.defaults"] = {},
    --           ["core.norg.dirman"] = {
    --             config = {
    --               workspaces = {
    --                 work = "~/notes/work",
    --                 home = "~/notes/home",
    --               }
    --             }
    --           },
    --           ["core.norg.concealer"] = {},
    --           ["core.norg.completion"] = {
    --             engine = "nvim-cmp"
    --           },
    --           ["core.presenter"] = {
    --             config = { -- Note that this table is optional and doesn't need to be provided
    --             zen_mode = "truezen"
    --             -- Configuration here
    --           }
    --         }
    --       }
    --     }
    --   end
    -- },
    -- do not work for some reason
    ['LukasPietzschmann/telescope-tabs'] = {
	    requires = { 'nvim-telescope/telescope.nvim' },
	    config = function()
		    require'telescope-tabs'.setup{
			    -- Your custom config :^)
		    }
	    end

    },
    ["rareitems/hl_match_area.nvim"] = {
      config = function()
        require("hl_match_area").setup()
      end,
    },
    ["princejoogie/dir-telescope.nvim"] = {
      -- telescope.nvim is a required dependency
      requires = {"nvim-telescope/telescope.nvim"},
      config = function()
        require("dir-telescope").setup({
          hidden = true,
          respect_gitignore = true,
        })
        require("telescope").load_extension("dir")
      end
    },
    ["shortcuts/no-neck-pain.nvim"] = {
      tag = "*",
      config = function()
        require("no-neck-pain").setup({
          width = 1000
        })
      end,
    },
    ["folke/todo-comments.nvim"] = {
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    },
    ["p00f/nvim-ts-rainbow"] = { disable = true },
    ["Olical/conjure"] = require "user.plugins.conjure",
    ["Invertisment/conjure-clj-additions-cider-nrepl-mw"] = {},

    ['Pocco81/auto-save.nvim'] = require "user.plugins.auto-save",

    ['guns/vim-sexp'] = {},

    ["ggandor/leap.nvim"] = require "user.plugins.leap",

    ['f-person/git-blame.nvim'] = {
    },

    ["NTBBloodbath/rest.nvim"] = require "user.plugins.rest",

    -- ["TimUntersberger/neogit"] = {
    --   requires = { "nvim-lua/plenary.nvim" }
    -- },

    -- ['mfussenegger/nvim-lint'] = {
    --   config = function()
    --     require("lint").linters_by_ft = {
    --       clojure = {"clj-kondo"},
    --     }
    --   end,
    -- },



    -- We also support a key value style plugin definition similar to NvChad:
    -- ["ray-x/lsp_signature.nvim"] = {
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },
  },
  -- All other entries override the require("<key>").setup({...}) call for default plugins
  ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
    -- config variable is the default configuration table for the setup function call
    -- local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
    }
    return config -- return final config table
  end,

  ["nvim-autopairs"] = function(config)
    config.enable_check_bracket_line = false
    return config
  end,

  treesitter = { -- overrides `require("treesitter").setup(...)`
    -- ensure_installed = { "lua" },
  },


  ["nvim-treesitter.configs"] = function(config)
    local disable_function = function(lang)
      local buf_name = vim.fn.expand("%")
      if lang == "clojure" and string.find(buf_name, "conjure%-") then
        return true
      end
    end
    config.highlight = {
      enable = true, -- false will disable the whole extension
      disable = disable_function
    }
    return config
  end,




  -- use mason-lspconfig to configure LSP installations
  ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
    -- ensure_installed = { "sumneko_lua" },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
    -- ensure_installed = { "prettier", "stylua" },
  },
}
