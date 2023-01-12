vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "conjure-log*",
  callback = function()
    -- Detach all LSP clients from Conjure log files
    -- and disable diagnostics if they're on
    local clients = vim.lsp.buf_get_clients()
    for _, c in ipairs(clients) do
      vim.lsp.buf_detach_client(0, c.id)
    end
  end,
  desc = "Turns off LSP for Conjure's buffer",
})

local job = require('plenary.job')

-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "*.clj",
--   callback = function()
--     local file = vim.fn.expand("%")
--     job:new({
--       command = 'zprint',
--       args = { "-w", file },
--       on_exit = function(_, exit_code)
--         if exit_code ~= 0 then
--           require("notify")('Could not format file!', vim.log.levels.ERROR)
--           return
--         end
--       end,
--     }):start()
--   end
-- })


-- Extend LSP configuration
return {
  -- enable servers that you already have installed without mason
  servers = {
    -- "pyright"
  },
  formatting = {
    -- control auto formatting on save
    format_on_save = {
      enabled = false, -- enable or disable format on save globally
      allow_filetypes = { -- enable format on save for specified filetypes only
        -- "go",
      },
      ignore_filetypes = { -- disable format on save for specified filetypes
        -- "python",
      },
    },
    disabled = { -- disable formatting capabilities for the listed language servers
      -- "sumneko_lua",
    },
    timeout_ms = 1000, -- default format timeout
    -- filter = function(client) -- fully override the default formatting function
    --   return true
    -- end
  },
  -- easily add or disable built in mappings added during LSP attaching
  mappings = {
    n = {
      -- ["<leader>lf"] = false -- disable formatting keymap
    },
  },
  -- add to the global LSP on_attach function
  -- on_attach = function(client, bufnr)
  -- end,

  -- override the mason server-registration function
  -- server_registration = function(server, opts)
  --   require("lspconfig")[server].setup(opts)
  -- end,

  -- Add overrides for LSP server settings, the keys are the name of the server
  ["server-settings"] = {
    -- example for addings schemas to yamlls
    -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
    --   settings = {
    --     yaml = {
    --       schemas = {
    --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
    --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
    --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
    --       },
    --     },
    --   },
    -- },
  },
}
