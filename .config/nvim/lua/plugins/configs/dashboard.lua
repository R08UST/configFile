local g = vim.g
local fn = vim.fn
local M = {}
local db = require("dashboard")

local github = {
    "                                          ",
    "             ▄▄████████████▄▄_            ",
    "         ▄██████████████████████▄         ",
    "      ╔▄███████████████████████████_      ",
    "     ██████▀██████████████████▀██████,    ",
    "   _██████    ~▀▀▀▀ª~~ª▀▀▀▀~    ▓█████▄   ",
    "  ε███████                      ▓██████▄  ",
    " ╔███████▀                      ▀███████, ",
    " ▓███████                        ▓███████ ",
    " ███████ª                        ║███████ ",
    " ███████▄                        δ███████ ",
    " ▓███████                        ████████ ",
    " ╚████████_                    ╔████████ª ",
    "  ▀████▀████▄▄_            __▄█████████▀  ",
    "   ▀████_ ▀██████        ▀████████████▀   ",
    "    ~▓███▄ ~▀▀▀▀          ███████████ª    ",
    "      ~▓███▄▄▄▄▄          █████████ª      ",
    "        ^▀██████          ██████▀^        ",
    "            ~▀▀▀          ▀▀▀~            ",
    "                                          ",
}

local lambda = {
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣴⣦⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
    "⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀ ",
    "⠀⠀⠀⠀⣠⣾⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣶⡀⠀⠀⠀⠀ ",
    "⠀⠀⠀⣴⣿⣿⠟⠁⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀ ",
    "⠀⠀⣼⣿⣿⠋⠀⠀⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀⠀ ",
    "⠀⢸⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡇⠀ ",
    "⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀ ",
    "⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⠀ ",
    "⠀⣿⣿⣷⠀⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀ ",
    "⠀⢸⣿⣿⡆⠀⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀⣰⣿⣿⠇⠀ ",
    "⠀⠀⢻⣿⣿⣄⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀⣰⣿⣿⡟⠀⠀ ",
    "⠀⠀⠀⠻⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⠀⠀⠀ ",
    "⠀⠀⠀⠀⠈⠻⣿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀ ",
    "⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀ ",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
}

local pikacu = {
    "          ▀████▀▄▄              ▄█ ",
    "            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ",
    "    ▄        █          ▀▀▀▀▄  ▄▀  ",
    "   ▄▀ ▀▄      ▀▄              ▀▄▀  ",
    "  ▄▀    █     █▀   ▄█▀▄      ▄█    ",
    "  ▀▄     ▀▄  █     ▀██▀     ██▄█   ",
    "   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ",
    "    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ",
    "   █   █  █      ▄▄           ▄▀   ",
}

M.hyper = function()
    db.setup({
        theme = "hyper",
        footer = { "-------------" }, --your footer
        config = {
            week_header = {
                enable = true,
            },
            shortcut = {
                {
                    icon = " ",
                    icon_hl = "@variable",
                    desc = "Update",
                    group = "Label",
                    action = "Lazy update",
                    key = "u",
                },
                {
                    icon = " ",
                    icon_hl = "@variable",
                    desc = "Files",
                    group = "Label",
                    action = "Telescope find_files",
                    key = "f",
                },
                {
                    icon = "﬒ ",
                    icon_hl = "@variable",
                    desc = "Dotfiles",
                    group = "Label",
                    action = "Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍",
                    key = "d",
                },
            },
        },
    })
end

M.doom = function()
    db.setup({
        theme = "doom",
        config = {
            header = lambda, --your header
            center = {
                {
                    icon = " ",
                    icon_hl = "Title",
                    desc = "Find File           ",
                    desc_hl = "String",
                    key = "b",
                    keymap = "SPC f f",
                    key_hl = "Number",
                    action = "lua print(2)",
                },
                {
                    icon = " ",
                    desc = "Find Dotfiles",
                    key = "f",
                    keymap = "SPC f d",
                    action = "lua print(3)",
                },
            },
            footer = {}, --your footer
        },
    })
end

return M
