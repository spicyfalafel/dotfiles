-- If you need more control, you can use the function()...end notation
-- options = function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end,
return {
  opt = {
    -- set to true or false etc.
    relativenumber = true, -- sets vim.opt.relativenumber
    number = true, -- sets vim.opt.number
    spell = false, -- sets vim.opt.spell
    signcolumn = "yes",
    wrap = false, -- sets vim.opt.wrap
    linebreak = true
    -- vim.opt.python3_host_prog = '/usr/bin/python3'
    -- vim.opt.UltiSnipsExpandTrigger = "<tab>"
    -- vim.opt.UltiSnipsJumpForwardTrigger = "<tab>"
    -- vim.opt.UltiSnipsJumpBackwardTrigger = "<s-tab>"
  },
  g = {

    -- sexp_filetypes = '',
    mapleader = " ", -- sets vim.g.mapleader
    maplocalleader = "m",
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_enabled = true, -- enable diagnostics at start
    status_diagnostics_enabled = true, -- enable diagnostics in statusline
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    gitblame_message_template = '[<date>] <committer> <summary>',
    gitblame_date_format = '%x',

    ['conjure#completion#omnifunc'] = nil,
    ['conjure#client#clojure#nrepl#mapping#refresh_changed'] = nil,
    ['conjure#client#clojure#nrepl#mapping#refresh_all'] = nil,
    ['conjure#client#clojure#nrepl#mapping#refresh_clear'] = nil,
    ['conjure#highlight#enabled'] = true,
    ['conjure#highlight#timeout'] = 200,
    ['conjure#log#hud#width'] = 0.5,
    ['conjure#log#hud#height'] = 0.5,
    ['conjure#log#hud#overlap_padding'] = 0.0,
    ['conjure#log#hud#border'] = "rounded",
    ['conjure#log#wrap'] = true,
    ['conjure#log#jump_to_latest#enabled'] = true,
    ['conjure#mapping#doc_word'] = false,
    ['conjure.log.jump_to_latest.enabled'] = true,
    ['conjure.log.wrap'] = true,
  },
}
