-- Mapping data with "desc" stored directly by vim.keymap.set().
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

local mappings = { n = {}, v = {}, o = {}, t = {} }

local nvchad = {
  disable = {
    n = {
      ["<leader>C"] = false,
      ["<leader>c"] = false,
      ["<leader>/"] = false,
      ["<leader>h"] = false,
      ["<leader>w"] = false,
      ["<leader>e"] = false,
      ["<leader>o"] = false,
      ["<C-q>"] = false,
      ["<S-l>"] = false,
      ["<S-h>"] = false,
      ["N"] = false,
      -- ["k"] = false,
      ["<C-k>"] = false,
      ["gx"] = false,
      ["<leader>gk"] = false,
      ["<leader>gj"] = false,
      ["<leader>gh"] = false,
      ["<leader>gp"] = false,
      ["<C-i>"] = false,
      ["<M-e>"] = false
    },
    t = {
      ["<C-h>"] = false,
      ["<C-j>"] = false,
      ["<C-k>"] = false,
      ["<C-l>"] = false,
    }
  },
  changed = {
    n = {
      ["<leader>x"] = { function() require("bufdelete").bufdelete(0, false) end, desc = "Close buffer" },
      ["<tab>"] = { "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer tab" },
      ["<S-tab>"] = { "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer tab" },

      -- git
      ["<leader>ge"] = { function() require("gitsigns").prev_hunk() end, desc = "Previous git hunk" },
      ["<leader>gn"] = { function() require("gitsigns").next_hunk() end, desc = "Next git hunk" },
      ["<leader>gr"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset git hunk" },
      ["<leader>gR"] = { function() require("gitsigns").reset_buffer() end, desc = "Reset git buffer" }
    },
  },
  clojure = {
    n = {
      ["<localleader>tt"] = { ":CcaNreplRunCurrentTest<CR>", desc = "Run current test" },
      ["<localleader>tn"] = { ":CcaNreplRunTestsInTestNs<CR>", desc = "Run ns tests" },
      ["<localleader>tT"] = { ":CcaNreplJumpToFailingCljTest<CR>", desc = "Go to failing test" },
    }
  },
  zen_mode = {
    n = {
      ["<leader>uo"] = { ":TZAtaraxis<CR>", desc = "center" },
      ["<leader>uO"] = { ":TZMinimalist<CR>", desc = "center2" },

    }

  },
  telescope = {
    n = {
      ["<leader>fa"] =  {"<cmd>Telescope dir live_grep<CR>", desc = "live grep in dir"},
      ["<leader>fg"] =  {"<cmd>Telescope dir find_files<CR>", desc = "find files in dir"}
    }
  },
  colemak = {
    n = {
      ["n"] = { "<down>", desc = "down" },
      ["e"] = { "<up>", desc = "up" },
      ["s"] = { "h", desc = "left" },
      ["t"] = { "l", desc = "right" },
      ["h"] = { "n", desc = "next" },
      ["<S-h>"] = { "N", desc = "prev" },
      -- ["E"] = { "e|", desc = "end" },
      ["<C-m>"] = { "m|", desc = "mark" }
    },
    v = {
      ["n"] = { "gj|", desc = "down" },
      ["e"] = { "gk|", desc = "up" },
      ["s"] = { "h", desc = "left" },
      ["t"] = { "l", desc = "right" },
      ["h"] = { "n", desc = "next" },
      ["<S-h>"] = { "N", desc = "prev" },
      -- ["E"] = { "e|", "end" },
      ["<C-m>"] = { "m|", desc = "mark" }
    },

    o = {
      ["n"] = { "<down>", desc = "down" },
      ["e"] = { "<up>", desc = "up" },
      ["s"] = { "h", desc = "left" },
      ["t"] = { "l", desc = "right" },
      ["h"] = { "n", desc = "next" },
      ["<S-h>"] = { "N", desc = "prev" },
      -- ["E"] = { "e|", desc = "end" },
      ["k"] = { "t", desc = "till" },
    }
  },
  default = {
    n = {
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      ["gd"] = {function() vim.lsp.buf.definition() end, desc = "go to definition my"}

    }
  },
  navigation = {
    n = {
      ["<Leader>ws"] = { "<C-W>s", desc = "Horizontal split" },
      ["<C-t>"] = { "<C-w>l", desc = "Go to right window" },
      ["<C-s>"] = { "<C-w>h", desc = "Go to left window" },
      ["<C-n>"] = { "<C-w>j", desc = "Go to bottom window" },
      ["<C-e>"] = { "<C-w>k", desc = "Go to upper window" },
      ["<Leader>wv"] = { "<C-W>v", desc = "Vertical split" },
      ["<Leader>wd"] = { ":q<CR>", desc = "Close buffer" },
      ["<leader>op"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
      ["k"] = { '<cmd>ConjureEvalCurrentForm<cr>', desc = "eval form conjure"},
      ["<S-s>"] = { '<cmd>ConjureEvalCurrentForm<cr>', desc = "eval form conjure"},
      ["<S-n>"] = { '<cmd>ConjureEvalCurrentForm<cr>', desc = "eval form conjure"},
      -- ["k"] = { '<Plug>(leap-cross-window)', desc = "Leap cross window"},
      -- ["<S-e>"] = { '<Plug>(leap-backward)', desc = "Leap backward"},
      ["<leader>bl"] = { ':bprevious<cr>', desc = "Previous buffer"},
      -- ["H"] = { '?<cr>', desc = "search backwards"},
      -- ["h"] = { '/<cr>', desc = "search"},

    },
    v = {

    },
    t = {
      ["<C-s>"] = { "<c-\\><c-n><c-w>h", desc = "Terminal left window navigation" },
      ["<C-t>"] = { "<c-\\><c-n><c-w>j", desc = "Terminal down window navigation" },
      ["<C-e>"] = { "<c-\\><c-n><c-w>k", desc = "Terminal up window navigation" },
      ["<C-n>"] = { "<c-\\><c-n><c-w>l", desc = "Terminal right window navigation" },
      ["<C-o>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
    }
  },
  sexp = {
    n = {
      ["gcb"] = { "i#_<esc>", desc = "my comment" },
      ["<leader>rr"] = { "<Plug>(sexp_raise_element)", desc = "raise" },
      ["<leader>("] = { "<Plug>(sexp_round_head_wrap_list)", desc = "wrap(" },
      ["<leader>)"] = { "<Plug>(sexp_round_tail_wrap_list)", desc = "wrap)" },
      ["<leader>["] = { "<Plug>(sexp_square_head_wrap_list)", desc = "wrap[" },
      ["<leader>]"] = { "<Plug>(sexp_square_tail_wrap_list)", desc = "wrap]" },
      ["<leader>{"] = { "<Plug>(sexp_curly_head_wrap_list)", desc = "wrap{" },
      ["<leader>}"] = { "<Plug>(sexp_curly_tail_wrap_list)", desc = "wrap}" },
      ["<leader>r("] = { "<Plug>(sexp_round_head_wrap_element)", desc = "wrapel(" },
      ["<leader>r)"] = { "<Plug>(sexp_round_tail_wrap_element)", desc = "wrapel)" },
      ["<leader>r["] = { "<Plug>(sexp_square_head_wrap_element)", desc = "wrapel[" },
      ["<leader>r]"] = { "<Plug>(sexp_square_tail_wrap_element)", desc = "wrapel]" },
      ["<leader>r{"] = { "<Plug>(sexp_curly_head_wrap_element)", desc = "wrapel{" },
      ["<leader>r}"] = { "<Plug>(sexp_curly_tail_wrap_element)", desc = "wrapel}" },
      ["<leader>rw"] = { "<Plug>(sexp_round_head_wrap_element)", desc = "wrap(" },
      ["<leader>rv"] = { "<Plug>(sexp_indent)", desc = "indent" },
      ["<leader>r,"] = { "<Plug>(sexp_capture_prev_element)", desc = "slurp left" },
      ["<leader>r."] = { "<Plug>(sexp_capture_next_element)", desc = "slurp right" },
      ["Y"] = { "y<Plug>(sexp_outer_element)", desc = "yank element" },

      [")"] = {"<Plug>(sexp_flow_to_next_open)", desc = "hz1n"},
      ["("] = {"<Plug>(sexp_flow_to_prev_open)", desc = "hz1na"},
      ["<silent>ae"] = {"<Plug>(sexp_outer_element)", desc = "ae"},
      ["<silent>ie"] = {"<Plug>(sexp_inner_element)", desc = "ie"},

      -- \ 'sexp_outer_list':                'af',

      -- \ 'sexp_inner_element':             'ie',
      -- ["("] = {"<Plug>(sexp_move_to_next_bracket)", desc = "hz2"},
      -- ['sexp_flow_to_next_open'] = {"<M-e>", desc ="abc"}
      -- \ 'sexp_flow_to_prev_close':        '<M-[>',
      -- \ 'sexp_flow_to_next_open':         '<M-]>',
      -- \ 'sexp_flow_to_prev_open':         '<M-{>',
      -- \ 'sexp_flow_to_next_close':        '<M-}>',

      -- \ 'sexp_outer_list':                'af',
      -- \ 'sexp_inner_list':                'if',
      -- \ 'sexp_outer_top_list':            'aF',
      -- \ 'sexp_inner_top_list':            'iF',
      -- \ 'sexp_outer_string':              'as',
      -- \ 'sexp_inner_string':              'is',
      -- \ 'sexp_outer_element':             'ae',
      -- \ 'sexp_inner_element':             'ie',
      -- \ 'sexp_move_to_prev_bracket':      '(',
      -- \ 'sexp_move_to_next_bracket':      ')',
      -- \ 'sexp_move_to_prev_element_head': '<M-b>',
      -- \ 'sexp_move_to_next_element_head': '<M-w>',
      -- \ 'sexp_move_to_prev_element_tail': 'g<M-e>',
      -- \ 'sexp_move_to_next_element_tail': '<M-e>',
      -- \ 'sexp_flow_to_prev_close':        '<M-[>',
      -- \ 'sexp_flow_to_next_open':         '<M-]>',
      -- \ 'sexp_flow_to_prev_open':         '<M-{>',
      -- \ 'sexp_flow_to_next_close':        '<M-}>',
      -- \ 'sexp_flow_to_prev_leaf_head':    '<M-S-b>',
      -- \ 'sexp_flow_to_next_leaf_head':    '<M-S-w>',
      -- \ 'sexp_flow_to_prev_leaf_tail':    '<M-S-g>',
      -- \ 'sexp_flow_to_next_leaf_tail':    '<M-S-e>',
      -- \ 'sexp_move_to_prev_top_element':  '[[',
      -- \ 'sexp_move_to_next_top_element':  ']]',
      -- \ 'sexp_select_prev_element':       '[e',
      -- \ 'sexp_select_next_element':       ']e',
      -- \ 'sexp_insert_at_list_head':       '<LocalLeader>h',
      -- \ 'sexp_insert_at_list_tail':       '<LocalLeader>l',
      -- \ 'sexp_splice_list':               '<LocalLeader>@',
      -- \ 'sexp_convolute':                 '<LocalLeader>?',
      -- \ 'sexp_swap_list_backward':        '<M-k>',
      -- \ 'sexp_swap_list_forward':         '<M-j>',
      -- \ 'sexp_swap_element_backward':     '<M-h>',
      -- \ 'sexp_swap_element_forward':      '<M-l>',
      -- \ 'sexp_emit_head_element':         '<M-S-j>',
      -- \ 'sexp_emit_tail_element':         '<M-S-k>',
    }
  }
}


for name, v in pairs(nvchad) do
  for modd, moddtable in pairs(v) do
    for keyname, keyvaltable in pairs(moddtable) do
      mappings[modd][keyname] = keyvaltable
    end
  end
end

return mappings
