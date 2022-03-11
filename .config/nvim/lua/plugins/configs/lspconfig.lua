local present1, lspconfig = pcall(require, "lspconfig")
local present2, lsp_installer = pcall(require, "nvim-lsp-installer")

if not (present1 or present2) then
   return
end

local function onAttach(client, bufnr)
    local function buf_set_option(...)
	vim.api.nvim_buf_set_option(bufnr, ...)
    end
    -- attach aerial and signature
    require("aerial").on_attach(client, bufnr)
    require("lsp_signature").on_attach()

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
   properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
   },
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
   virtual_text = {
      prefix = "",
      spacing = 0,
   },
   signs = true,
   underline = true,
   update_in_insert = false, -- update diagnostics insert mode
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
   border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
   border = "single",
})

-- local servers = lsp_installer.get_installed_servers()

local servers = {'pyright', 'zk', 'bashls'}
for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found and not server:is_installed() then
	vim.notify("Installing " .. name)
	server:install()
    end
    if server:is_installed() then
	require('lspconfig')[name].setup {
	    on_attach = onAttach,
	    root_dir = function()
		return vim.fn.getcwd()
	    end,
	    flags = {
	    -- This will be the default in neovim 0.7+
	    debounce_text_changes = 150,
	    }
	}
    end
end

