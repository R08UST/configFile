local M = {}

M.autopairs = function()
    local present1, autopairs = pcall(require, "nvim-autopairs")
    local present2, autopairs_completion = pcall(require, "nvim-autopairs.completion.cmp")

    if not (present1 or present2) then
	return
    end

    autopairs.setup()
end


M.blankline = function()
   vim.g.indentLine_enabled = 1
   vim.g.indent_blankline_char = "▏"

   vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard", "packer" }
   vim.g.indent_blankline_buftype_exclude = { "terminal" }

   vim.g.indent_blankline_show_trailing_blankline_indent = false
   vim.g.indent_blankline_show_first_indent_level = false
end

M.colorizer = function()
   local present, colorizer = pcall(require, "colorizer")
   if present then
      colorizer.setup({ "*" }, {
         RGB = true, -- #RGB hex codes
         RRGGBB = true, -- #RRGGBB hex codes
         names = false, -- "Name" codes like Blue
         RRGGBBAA = false, -- #RRGGBBAA hex codes
         rgb_fn = false, -- CSS rgb() and rgba() functions
         hsl_fn = false, -- CSS hsl() and hsla() functions
         css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
         css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn

         -- Available modes: foreground, background
         mode = "background", -- Set the display mode.
      })
      vim.cmd "ColorizerReloadAllBuffers"
   end
end

M.comment = function()
    local present, nvim_comment = pcall(require, "nvim_comment")
    if present then
	nvim_comment.setup()
    end
end

M.luasnip = function()
   local present, luasnip = pcall(require, "luasnip")
   if not present then
      return
   end

   luasnip.config.set_config {
      history = true,
      updateevents = "TextChanged,TextChangedI",
   }
   require("luasnip/loaders/from_vscode").load()
end

M.lspkind = function()
   local present, lspkind = pcall(require, "lspkind")
   if present then
      lspkind.init()
   end
end

M.neoscroll = function()
   pcall(function()
    require('neoscroll').setup({
    -- All these keys will be mapped. Pass an empty table ({}) for no mappings
    mappings = {'<C-j>', '<C-k>'},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing = false,              -- easing_function will be used in all scrolling animations with some defaults
    -- easing_function = function(x) return math.pow(x, 1) end -- default easing function

})
    require('neoscroll.config').set_mappings({
['<C-j>'] = {'scroll', {'vim.api.nvim_win_get_height(0)', 'true', '250'}},
['<C-k>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '250'}}
})
   end)
end

M.signature = function()
   local present, lspsignature = pcall(require, "lsp_signature")
   if present then
      lspsignature.setup {
         bind = true,
         doc_lines = 2,
         floating_window = false,
         fix_pos = true,
         hint_enable = true,
         hint_prefix = " ",
         hint_scheme = "String",
         hi_parameter = "Search",
         max_height = 22,
         max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
         handler_opts = {
            border = "single", -- double, single, shadow, none
         },
         zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
         padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
      }
   end
end

M.saga = function()
    local present, saga = pcall(require, "lspsaga")
    if present then
        saga.init_lsp_saga({
            code_action_icon = '💡'
        })
    end
end

return M
