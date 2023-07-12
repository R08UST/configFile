local present, nulls = pcall(require, "null-ls")
if not present then
    return
end

nulls.setup({
    root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
    cmd = { "nvim", vim.fn.stdpath("config") .. "/mason/bin" },
    sources = {
        nulls.builtins.completion.luasnip,
        nulls.builtins.code_actions.gitsigns,
        nulls.builtins.diagnostics.flake8,
        nulls.builtins.formatting.black,
        nulls.builtins.formatting.stylua,
        nulls.builtins.formatting.clang_format,
    },
})
