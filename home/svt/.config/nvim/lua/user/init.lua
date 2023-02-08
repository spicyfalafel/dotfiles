local function conjure_eval_with_dbg_prefix(clojure_fun_str)
  local start_args_index = string.find(clojure_fun_str, "[")
  local end_args_index = string.find(clojure_fun_str, "]")

  return sum
end

local config = {
  updater = require "user.updater",
  colorscheme = require "user.default_theme",
  -- Add highlight groups in any theme
  highlights = require "user.highlights",
  options = require "user.options",
  header = require "user.header",
  default_theme = require "user.default_theme",
  diagnostics = require "user.diagnostics",
  lsp = require "user.lsp",
  mappings = require "user.mappings",
  plugins = require "user.plugins",
  luasnip = require "user.luasnip",
  cmp = require "user.cmp",
  ["which-key"] = require "user.which-key",
  polish = require "user.polish",
}

return config
