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
    vim.opt.list = true
    --vim.opt.listchars:append("space:⋅")
    vim.opt.listchars:append("eol:↴")

    require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
    }
    vim.g.indentLine_enabled = 1
    vim.g.indent_blankline_char = "▏"

    vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard", "packer", "lspinfo" }
    vim.g.indent_blankline_buftype_exclude = { "terminal", 'dashboard' }

    vim.g.indent_blankline_show_trailing_blankline_indent = false
    vim.g.indent_blankline_show_first_indent_level = false
end

M.colorizer = function()
   local present, colorizer = pcall(require, "colorizer")
   if present then
      colorizer.setup({ "*" }, {
         RGB = true, -- #RGB hex codes
         RRGGBB = true, -- #RRGGBB hex codes
         names = true, -- "Name" codes like Blue
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

M.notify = function()
    local present, notify = pcall(require, "notify")
    if not present then
	    return 
    end

    notify.setup({
        -- Animation style (see below for details)
        stages = "fade_in_slide_out",
    
        -- Function called when a new window is opened, use for changing win settings/config
        on_open = nil,
    
        -- Function called when a window is closed
        on_close = nil,
    
        -- Render function for notifications. See notify-render()
        render = "default",
    
        -- Default timeout for notifications
        timeout = 5000,
    
        -- Max number of columns for messages
        max_width = nil,
        -- Max number of lines for a message
        max_height = nil,
    
        -- For stages that change opacity this is treated as the highlight behind the window
        -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
        background_colour = "Normal",
    
        -- Minimum width for notification windows
        minimum_width = 50,
    
        -- Icons for the different levels
        icons = {
    	ERROR = "",
    	WARN = "",
    	INFO = "",
    	DEBUG = "",
    	TRACE = "✎",
    	},
    })

    vim.notify = notify

end 

M.lightspeed = function()
    require'lightspeed'.setup {
	ignore_case = false,
	exit_after_idle_msecs = { unlabeled = 1000, labeled = nil },
	--- s/x ---
	jump_to_unique_chars = { safety_timeout = 400 },
	match_only_the_start_of_same_char_seqs = true,
	force_beacons_into_match_width = false,
	-- Display characters in a custom way in the highlighted matches.
	substitute_chars = { ['\r'] = '¬', },
	-- Leaving the appropriate list empty effectively disables "smart" mode,
	-- and forces auto-jump to be on or off.
	--safe_labels = { . . . },
	--labels = { . . . },
	-- These keys are captured directly by the plugin at runtime.
	special_keys = {
	next_match_group = '<tab>',
	prev_match_group = '<s-tab>',
	},
	--- f/t ---
	limit_ft_matches = 4,
	repeat_ft_with_target_char = false,
    }
end

return M
