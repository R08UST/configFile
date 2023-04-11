local present, gitsigns = pcall(require, "gitsigns")
if not present then
    return
end

require("gitsigns").setup {
    signs = {
        -- TODO add hl to colorscheme
        add = {hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn"},
        change = {hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn"},
        delete = {hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn"},
        topdelete = {hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn"},
        changedelete = {hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn"}
    },
    count_chars = {
        [1] = "",
        [2] = "₂",
        [3] = "₃",
        [4] = "₄",
        [5] = "₅",
        [6] = "₆",
        [7] = "₇",
        [8] = "₈",
        [9] = "₉",
        ["+"] = "₊"
    },
    numhl = false,
    linehl = false,
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true
    },
    watch_gitdir = {
        interval = 1000
    },
    sign_priority = 6,
    update_debounce = 200,
    status_formatter = nil -- Use default
}
