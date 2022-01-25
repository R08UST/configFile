local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
   return
end

ts_config.setup {

    ensure_installed = {
        "bash",
        "lua",
        "json",
        "python",
        "cpp",
        --   "rust",
    },
    autopairs = {enable = true},
    matchup = {enable = true},
    rainbow = {enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  },
    highlight = {
        enable = true,
        use_languagetree = true
    },
}
