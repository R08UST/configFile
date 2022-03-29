local present, luasnip = pcall(require, "luasnip")
if not present then
    return
end
-- some shorthands...
-- local s = luasnip.snippet
-- local sn = luasnip.snippet_node
-- local t = luasnip.text_node
-- local i = luasnip.insert_node
-- local f = luasnip.function_node
-- local c = luasnip.choice_node
-- local d = luasnip.dynamic_node
-- local r = luasnip.restore_node
-- local l = require("luasnip.extras").lambda
-- local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
local types = require("luasnip.util.types")

luasnip.config.set_config({
    history = true,
    -- Update more often, :h events for more info.
    updateevents = "TextChanged,TextChangedI",
    ext_opts = {
	[types.choiceNode] = {
	    active = {
		virt_text = { { "choiceNode", "Comment" } },
	    },
	},
    },
    -- treesitter-hl has 100, use something higher (default is 200).
    ext_base_prio = 300,
    -- minimal increase in priority.
    ext_prio_increase = 1,
    enable_autosnippets = true,
})
luasnip.filetype_set("cpp", { "c" })
luasnip.filetype_extend("lua", { "c" })
luasnip.filetype_extend("all", { "math" })
-- load friendly snippets
require("luasnip.loaders.from_vscode").lazy_load() 
-- load my own snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" }})

