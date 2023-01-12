return {
    config = function()
        vim.g['conjure#completion#omnifunc'] = nil
        vim.g['conjure#client#clojure#nrepl#mapping#refresh_changed'] = nil
        vim.g['conjure#client#clojure#nrepl#mapping#refresh_all'] = nil
        vim.g['conjure#client#clojure#nrepl#mapping#refresh_clear'] = nil
        vim.g['conjure#highlight#enabled'] = true
        vim.g['conjure#highlight#timeout'] = 200
        vim.g['conjure#log#hud#width'] = 0.5
        vim.g['conjure#log#hud#height'] = 0.5
        vim.g['conjure#log#hud#overlap_padding'] = 0.0
        vim.g['conjure#log#hud#border'] = "rounded"
        vim.g['conjure#log#wrap'] = true
        vim.g['conjure#log#jump_to_latest#enabled'] = true
        vim.g['conjure#mapping#doc_word'] = false

        vim.g.gitblame_message_template = '[<date>] <committer> <summary>'
        vim.g.gitblame_date_format = '%x'
        vim.g['conjure.log.jump_to_latest.enabled'] = true
        vim.g['conjure.log.wrap'] = true
    end
}
