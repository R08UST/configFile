-- var
local g = vim.g
local map = vim.api.nvim_set_keymap
local opt = {noremap = true}
local opts = { noremap = true, silent = true }
local M = {}

M.key = function()
    g.mapleader = " "
    
    map("n", "<C-p>", "+gp", opt)
    map("v", "<C-y>", "+y", opt)
    map("n", "<C-S-v>", "+gp", opt)
    map("v", "<C-S-c>", "+y", opt)
    map("v", "<C-S-x>", "+x", opt)
    map("t", "<ESC>", "<C-\\><C-n>", opt)
    map("v", 'gv', 'y/<C-r>\"<CR>', opt)
    
    map("n", '<F7>', "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opt)
    map("n", '<F6>', "<cmd>lua require'dap'.stop()<cr>", opt)
    map("n", '<F5>', "<cmd>lua require'dap'.continue()<cr>", opt)
    map("n", '<F11>', "<cmd>lua require'dap'.step_into()<cr>", opt)
    map("n", '<F10>', "<cmd>lua require'dap'.step_over()<cr>", opt)
    map("n", '<F12>', "<cmd>lua require'dap'.step_out()<cr>", opt)

    --lsp 
    map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    map("n", "H", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    map("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
end
-- whichkey leader
M.leaderv = {

    w = {':w<CR>', 'save file'}, -- set a single command and text
    q = {':q<CR>', "quit"},
    c = {":CommentToggle <CR>", "comment"},
    A = {"<cmd>lua vim.lsp.buf.range_code_action()<CR>", "selected Action"},
    m = {"<cmd>lua vim.lsp.buf.range_formatting<CR>", "selected format"},
    v = {"<Cmd>lua require('spectre').open_visual()<CR>", 'spectre selected'},
}

M.leadern = {
    w = {':w<CR>', 'save file'}, -- set a single command and text
    q = {':q<CR>', "quit"},
    Q = {':q!<CR>', "quit"},
    c = {":CommentToggle <CR>", "comment"},
    u = {
        name = "+utils",
        v = {"<Cmd>rightbelow vsp $MYVIMRC<CR>", "vim config"},
        n = {"<Cmd>Neoformat<CR>", "neoformat"},
        z = {
            name = 'zen',
            f = {'<cmd>TZAtaraxis<CR>', "ataraxisMode"},
            m = {'<cmd>TZMinimalist<CR>', "minimalisticMode"},
            z = {'<cmd>TZFocus<CR>', "focusMode"},
        }

 },
    f = { -- set a nested structure
        name = '+Find',
	    a = {"<Cmd>AerialToggle!<CR>", 'symbol'},
        f = {"<Cmd>Telescope find_files<CR>", "files"},
        b = {"<Cmd>Telescope buffers<CR>", "buffers"},
        h = {"<Cmd>Telescope help_tags<CR>", "help tags"},
        o = {"<Cmd>Telescope oldfiles<CR>", "old files"},
        d = {"<cmd>Telescope diagnostics<cr>", "Document Diagnostics"},
        m = {"<cmd>Telescope marks<cr>", "Marks"},
        M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        R = {"<cmd>Telescope registers<cr>", "Registers"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"},
        q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
        y = {"<cmd>Telescope symbol<cr>", "Quickfix"},
        s = {"<Cmd>lua require('spectre').open()<CR>", 'open spectre'},
        w = {"<Cmd>lua require('spectre').open_visual({select_word=true})<CR>", 'spectre word'},
        B = {"<cmd>Telescope bibtex<cr>", "Quickfix"},
        x = {"<cmd>cclose<cr>", "Close Quickfix"},
        n = {"<cmd>DashboardNewFile<CR>", "new file"},
        c = {
                name = "+C",
                s = {"<Cmd>Telescope colorscheme<CR>", "colorscheme"},
                h = {"<Cmd>Telescope command_history<CR>", "command history"},
                f = {"<Cmd>lua require('spectre').open_file_search()<CR>", 'spectre current file'},
            },
        g = {
            name = '+git',
            g = {'<Cmd>Telescope git_commits<CR>', 'commits'},
            c = {'<Cmd>Telescope git_bcommits<CR>', 'buffer commits'},
            b = {'<Cmd>Telescope git_branches<CR>', 'branches'},
            s = {'<Cmd>Telescope git_status<CR>', 'status'},
            },
	},
    b = {
        name = '+buffer',
        j = {"<Cmd>BufferLineCyclePrev<CR>", "cycle previous"},
        k = {"<Cmd>BufferLineCycleNext<CR>", "cycle next"},
        h = {"<Cmd>BufferLineMovePrev<CR>", "move previous"},
        l = {"<Cmd>BufferLineMoveNext<CR>", "move next"},
        d = {"<Cmd>bdelete<CR>", "delete"},
	    x = {"<Cmd>BufOnly<CR>", "delete All"}
        },
    t = {
        name = "+tree",
        t = {"<Cmd>NvimTreeToggle<CR>", "toggle"},
        r = {"<Cmd>NvimTreeRefresh<CR>", "refresh"},
        f = {"<Cmd>NvimTreeFindFile<CR>", "find file(locate)"},
	    a = {"<Cmd>AerialToggle!<CR>", 'symbol'},
        },
    d = {
        name = "+Debug",
        b = {"<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint(F7)"},
        c = {"<cmd>lua require'dap'.continue()<cr>", "Continue(F5)"},
	    C = {"<cmd>lua require'dap'.stop()<cr>", "Cancle(F6)"},
        i = {"<cmd>lua require'dap'.step_into()<cr>", "Step Into(F11)"},
        n = {"<cmd>lua require'dap'.step_over()<cr>", "Step Over(F10)"},
        o = {"<cmd>lua require'dap'.step_out()<cr>", "Step Over(F12)"},
        r = {"<cmd>lua require'dap'.repl.open()<cr>", "Toggle Repl"},
        s = {"<cmd>lua require'dap'.continue()<cr>", "Start"},
	    S = {"<cmd>lua require'dap'.session()<cr>", "Session"},
        l = {"<cmd>lua require'osv'.run_this()<cr>", "debug current lua file"}


    },
    a = {
        name = "+lsp",
        f = {"<Cmd>lua vim.diagnostic.open_float()<CR>", "LSP finder"},
        m = {"<Cmd>Neoformat<CR>", "Neoformat"},
        h = {"<Cmd>lua vim.lsp.buf.hover()<CR>", "hover document"},
        r = {"<Cmd>lua vim.lsp.buf.rename()<CR>", "rename"},
        R = {"<Cmd>lua require('refactoring').select_refactor()<CR>", "refactor"},
        j = {"<Cmd>lua vim.diagnostic.goto_next()<CR>", "diagnostic jump next"},
        k = {"<Cmd>lua vim.diagnostic.goto_prev()<CR>", "diagnostic jump prev"},
        s = {"<Cmd>lua vim.lsp.buf.signature_help()<CR>", "signature_help"},
        a = {"<Cmd>lua vim.lsp.buf.code_action()<CR>", "code action"},
        d = {"<Cmd>lua vim.lsp.buf.definition()<CR>", "preview definition"},
        t = {"<cmd>lua vim.lsp.buf.type_definition()<CR>", "type definition"},
        g = {
                name = "+go",
                c = {"<Cmd>lua vim.lsp.buf.declaration()<CR>", "declaration"},
                f = {"<Cmd>lua vim.lsp.buf.definition()<CR>", "definition"},
                i = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "implementation"},
                r = {"<cmd>lua vim.lsp.buf.references()<CR>", "references"}
            },
        w = {
                name = "+workspace",
                a = {"<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "add workspace folder"},
                r = {"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "remove workspace folder"},
                l = {"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "list workspace folder"},
                s = {"<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "workspace symbol"}
            }
        }
    }

-- all plugins related mappings
-- to get short info about a plugin, see the respective string in plugin_status, if not present, then info here
M.plugin = {
   bufferline = {
      next_buffer = "<TAB>", -- next buffer
      prev_buffer = "<S-Tab>", -- previous buffer
   },
   comment = {
      toggle = "<leader>/", -- trigger comment on a single/selected lines/number prefix
   },
   dashboard = {
      open = "<leader>db", -- open dashboard
      session_load = "<leader>l", -- load a saved session
      session_save = "<leader>s", -- save a session
   },
   -- note: this is an edditional mapping to escape, escape key will still work
   better_escape = {
      esc_insertmode = { "jk" }, -- multiple mappings allowed
   },
   nvimtree = {
      toggle = "<C-n>", -- file manager
   },
   neoformat = {
      format = "<leader>fm",
   },
   telescope = {
      buffers = "<leader>fb",
      find_files = "<leader>ff",
      git_commits = "<leader>cm",
      git_status = "<leader>gt",
      help_tags = "<leader>fh",
      live_grep = "<leader>fw",
      oldfiles = "<leader>fo",
      themes = "<leader>th",
   },
   telescope_media = {
      media_files = "<leader>fp",
   },
   truezen = { -- distraction free modes mapping, hide statusline, tabline, line numbers
      ataraxis_mode = "<leader>zz", -- center
      focus_mode = "<leader>zf",
      minimalistic_mode = "<leader>zm", -- as it is
   },
   vim_fugitive = {
      diff_get_2 = "<leader>gh",
      diff_get_3 = "<leader>gl",
      git = "<leader>gs",
      git_blame = "<leader>gb",
   },
}

return M
