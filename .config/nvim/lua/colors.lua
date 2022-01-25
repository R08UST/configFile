local M = {}

local lush = require('lush')
local hsl = lush.hsl

M.jelly = function()
    colors = {
    foreground = hsl("#e8e8d3"),
    background = hsl("#353535"),
    grey       = hsl("#888888"),
    grey_one   = hsl("#1c1c1c"),
    grey_two   = hsl("#f0f0f0"),
    grey_three = hsl("#333333"),
    regent_grey = hsl("#9098A0"),
    scorpion   = hsl("#606060"),
    cod_grey   = hsl("#101010"),
    tundora    = hsl("#404040"),
    zambezi    = hsl("#605958"),
    silver_rust = hsl("#ccc5c4"),
    silver     = hsl("#c7c7c7"),
    alto       = hsl("#dddddd"),
    gravel     = hsl("#403c41"),
    boulder    = hsl("#777777"),
    cocoa_brown = hsl("#302028"),
    grey_chateau = hsl("#a0a8b0"),
    bright_grey = hsl("#384048"),
    shuttle_grey = hsl("#535d66"),
    mine_shaft = hsl("#1f1f1f"),
    temptress = hsl("#40000a"),
    bayoux_blue = hsl("#556779"),
    total_white = hsl("#ffffff"),
    total_black = hsl("#000000"),
    cadet_blue = hsl("#b0b8c0"),
    perano     = hsl("#b0d0f0"),
    wewak      = hsl("#f0a0c0"),
    mantis     = hsl("#70b950"),
    raw_sienna = hsl("#cf6a4c"),
    highland   = hsl("#799d6a"),
    hoki       = hsl("#668799"),
    green_smoke = hsl("#99ad6a"),
    costa_del_sol = hsl("#556633"),
    biloba_flower = hsl("#c6b6ee"),
    morning_glory = hsl("#8fbfdc"),
    goldenrod = hsl("#fad07a"),
    ship_cove = hsl("#8197bf"),
    koromiko = hsl("#ffb964"),
    brandy = hsl("#dad085"),
    old_brick = hsl("#902020"),
    dark_blue = hsl("#0000df"),
    ripe_plum = hsl("#540063"),
    casal = hsl("#2D7067"),
    purple = hsl("#700089"),
    tea_green  =hsl("#d2ebbe"),
    dell = hsl("#437019"),
    calypso = hsl("#2B5B77"),
}
return colors

end


M.get = function()
    local colors = {
        white = "#abb2bf",
        darker_black = "#1b1f27",
        black = "#1e222a", --  nvim bg
        black2 = "#252931",
        one_bg = "#282c34", -- real bg of onedark
        one_bg2 = "#353b45",
        one_bg3 = "#30343c",
        grey = "#42464e",
        grey_fg = "#565c64",
        grey_fg2 = "#6f737b",
        light_grey = "#6f737b",
        red = "#d47d85",
        baby_pink = "#DE8C92",
        pink = "#ff75a0",
        line = "#2a2e36", -- for lines like vertsplit
        green = "#A3BE8C",
        vibrant_green = "#7eca9c",
        nord_blue = "#81A1C1",
        blue = "#61afef",
        yellow = "#e7c787",
        sun = "#EBCB8B",
        purple = "#b4bbc8",
        dark_purple = "#c882e7",
        teal = "#519ABA",
        orange = "#fca2aa",
        cyan = "#a3b8ef",
        statusline_bg = "#22262e",
        lightbg = "#2d3139",
        lightbg2 = "#262a32",
        pmenu_bg = "#A3BE8C",
        folder_bg = "#61afef",
    }
    return colors
end
return M
