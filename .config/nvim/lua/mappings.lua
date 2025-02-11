-- var
local g = vim.g
local map = vim.api.nvim_set_keymap
local opt = { noremap = true }
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
    map("v", "gv", 'y/<C-r>"<CR>', opt)

    map("n", "<F7>", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opt)
    map("n", "<F6>", "<cmd>lua require'dap'.stop()<cr>", opt)
    map("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opt)
    map("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>", opt)
    map("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>", opt)
    map("n", "<F12>", "<cmd>lua require'dap'.step_out()<cr>", opt)

    --lsp
    map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    map("n", "H", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    map("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
    vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
    vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
    vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
    -- moving between splits
    vim.keymap.set("n", "<C-A-h>", require("smart-splits").move_cursor_left)
    vim.keymap.set("n", "<C-A-j>", require("smart-splits").move_cursor_down)
    vim.keymap.set("n", "<C-A-k>", require("smart-splits").move_cursor_up)
    vim.keymap.set("n", "<C-A-l>", require("smart-splits").move_cursor_right)
end
-- whichkey leader

M.whichkey = {
    {
        mode = { "v" },
        { "<leader>A", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", desc = "selected Action" },
        { "<leader>c", ":CommentToggle <CR>", desc = "comment" },
        { "<leader>m", "<cmd>lua vim.lsp.buf.range_formatting<CR>", desc = "selected format" },
        { "<leader>q", ":q<CR>", desc = "quit" },
        { "<leader>v", "<Cmd>lua require('spectre').open_visual()<CR>", desc = "spectre selected" },
    },
    {
        { "<leader>Q", ":q!<CR>", desc = "quit" },
        { "<leader>a", group = "lsp" },
        { "<leader>aa", "<Cmd>lua vim.lsp.buf.code_action()<CR>", desc = "code action" },
        { "<leader>ad", "<Cmd>lua vim.lsp.buf.definition()<CR>", desc = "preview definition" },
        { "<leader>ag", group = "go" },
        { "<leader>agc", "<Cmd>lua vim.lsp.buf.declaration()<CR>", desc = "declaration" },
        { "<leader>agf", "<Cmd>lua vim.lsp.buf.definition()<CR>", desc = "definition" },
        { "<leader>agi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "implementation" },
        { "<leader>agr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "references" },
        { "<leader>ah", "<Cmd>lua vim.lsp.buf.hover()<CR>", desc = "hover document" },
        { "<leader>aj", "<Cmd>lua vim.diagnostic.goto_next()<CR>", desc = "diagnostic jump next" },
        { "<leader>ak", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "diagnostic jump prev" },
        { "<leader>am", "<Cmd>lua vim.lsp.buf.format()<CR>", desc = "format" },
        { "<leader>ar", "<Cmd>lua vim.lsp.buf.rename()<CR>", desc = "rename" },
        { "<leader>as", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "signature_help" },
        { "<leader>at", "<cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "type definition" },
        { "<leader>aw", group = "workspace" },
        { "<leader>awa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", desc = "add workspace folder" },
        {
            "<leader>awl",
            "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
            desc = "list workspace folder",
        },
        { "<leader>awr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", desc = "remove workspace folder" },
        { "<leader>aws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", desc = "workspace symbol" },
        { "<leader>b", group = "buffer" },
        { "<leader>bd", "<Cmd>bdelete<CR>", desc = "delete" },
        { "<leader>bh", "<Cmd>BufferLineMovePrev<CR>", desc = "move previous" },
        { "<leader>bj", "<Cmd>BufferLineCyclePrev<CR>", desc = "cycle previous" },
        { "<leader>bk", "<Cmd>BufferLineCycleNext<CR>", desc = "cycle next" },
        { "<leader>bl", "<Cmd>BufferLineMoveNext<CR>", desc = "move next" },
        { "<leader>bx", "<Cmd>BufOnly<CR>", desc = "delete All" },
        { "<leader>c", ":CommentToggle <CR>", desc = "comment" },
        { "<leader>d", group = "Debug" },
        { "<leader>dC", "<cmd>lua require'dap'.stop()<cr>", desc = "Cancle(F6)" },
        { "<leader>dS", "<cmd>lua require'dap'.session()<cr>", desc = "Session" },
        { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint(F7)" },
        { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue(F5)" },
        { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into(F11)" },
        { "<leader>dl", "<cmd>lua require'osv'.run_this()<cr>", desc = "debug current lua file" },
        { "<leader>dn", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over(F10)" },
        { "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Over(F12)" },
        { "<leader>dr", "<cmd>lua require'dap'.repl.open()<cr>", desc = "Toggle Repl" },
        { "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", desc = "Start" },
        { "<leader>f", group = "Find" },
        { "<leader>fB", "<cmd>Telescope bibtex<cr>", desc = "Bibtex" },
        { "<leader>fM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
        { "<leader>fR", "<cmd>Telescope registers<cr>", desc = "Registers" },
        { "<leader>fa", "<Cmd>AerialToggle!<CR>", desc = "symbol" },
        { "<leader>fb", "<Cmd>Telescope buffers<CR>", desc = "buffers" },
        { "<leader>fc", group = "C" },
        { "<leader>fcf", "<Cmd>lua require('spectre').open_file_search()<CR>", desc = "spectre current file" },
        { "<leader>fch", "<Cmd>Telescope command_history<CR>", desc = "command history" },
        { "<leader>fcs", "<Cmd>Telescope colorscheme<CR>", desc = "colorscheme" },
        { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Document Diagnostics" },
        { "<leader>ff", "<Cmd>Telescope find_files<CR>", desc = "files" },
        { "<leader>fg", group = "git" },
        { "<leader>fgb", "<Cmd>Telescope git_branches<CR>", desc = "branches" },
        { "<leader>fgc", "<Cmd>Telescope git_bcommits<CR>", desc = "buffer commits" },
        { "<leader>fgg", "<Cmd>Telescope git_commits<CR>", desc = "commits" },
        { "<leader>fgs", "<Cmd>Telescope git_status<CR>", desc = "status" },
        { "<leader>fh", "<Cmd>Telescope help_tags<CR>", desc = "help tags" },
        { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks" },
        { "<leader>fo", "<Cmd>Telescope oldfiles<CR>", desc = "old files" },
        { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
        { "<leader>fs", "<Cmd>lua require('spectre').open()<CR>", desc = "open spectre" },
        { "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Text" },
        { "<leader>fw", "<Cmd>lua require('spectre').open_visual({select_word=true})<CR>", desc = "spectre word" },
        { "<leader>fx", group = "quickfix" },
        { "<leader>fxX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
        { "<leader>fxl", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
        { "<leader>fxq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
        { "<leader>fxx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
        { "<leader>fy", "<cmd>Telescope symbols<cr>", desc = "symbol" },
        { "<leader>q", ":q<CR>", desc = "quit" },
        { "<leader>t", group = "tree" },
        { "<leader>ta", "<Cmd>AerialToggle!<CR>", desc = "symbol" },
        { "<leader>tf", "<Cmd>NvimTreeFindFile<CR>", desc = "find file(locate)" },
        { "<leader>tr", "<Cmd>NvimTreeRefresh<CR>", desc = "refresh" },
        { "<leader>tt", "<Cmd>NvimTreeToggle<CR>", desc = "toggle" },
        { "<leader>u", group = "utils" },
        { "<leader>ut", group = "term" },
        { "<leader>utf", "<cmd>ToggleTerm direction=float<cr>", desc = "float term" },
        { "<leader>utt", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "horizon term" },
        { "<leader>utv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "vertical term" },
        { "<leader>uv", "<Cmd>rightbelow vsp $MYVIMRC<CR>", desc = "vim config" },
        { "<leader>uz", group = "zen" },
        { "<leader>uzf", "<cmd>TZAtaraxis<CR>", desc = "ataraxisMode" },
        { "<leader>uzm", "<cmd>TZMinimalist<CR>", desc = "minimalisticMode" },
        { "<leader>uzz", "<cmd>TZFocus<CR>", desc = "focusMode" },
        { "<leader>w", ":w<CR>", desc = "save file" },
    },
}

return M
