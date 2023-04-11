local present, nulls = pcall(require, "null-ls")
if not present then
    return
end

local api = vim.api

nulls.setup(
    {
        sources = {
            nulls.builtins.completion.spell,
            nulls.builtins.code_actions.gitsigns,
            nulls.builtins.code_actions.refactoring,
            nulls.builtins.diagnostics.flake8,
            nulls.builtins.formatting.autopep8
        }
    }
)
