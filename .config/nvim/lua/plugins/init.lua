local M = {}
-- plugin setting
M.load = function()
    local lazypath = vim.fn.stdpath("config") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)

    local present, lazy = pcall(require, "lazy")
    local plugins = require("plugins.list")
    local opts = require("plugins.configs.lazy")
    lazy.setup(plugins, opts)
end
return M
