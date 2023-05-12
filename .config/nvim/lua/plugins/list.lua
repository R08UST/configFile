local M = {
    -- utils
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },
    { "lewis6991/impatient.nvim" },
    -- notification
    {
        "rcarriga/nvim-notify",
        config = function()
            require("plugins.configs.others").notify()
        end,
    },
    -- beautify ui
    {
        "rktjmp/lush.nvim",
        config = function()
            require("themes")
        end,
    },
    {
        "nvim-lua/popup.nvim",
        event = "VeryLazy",
    },
    {
        "stevearc/dressing.nvim",
        lazy = true,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },
    {
        "kyazdani42/nvim-web-devicons",
        config = function()
            require("plugins.configs.icons")
        end,
        dependencies = "lush.nvim", -- theme load first
    },
    {
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        config = function()
            require("plugins.configs.others").colorizer()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plugins.configs.statusline")
        end,
        dependencies = "lush.nvim", -- theme load first
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-web-devicons", "lush.nvim" },
        version = "*",
        config = function()
            require("plugins.configs.bufferline")
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.configs.others").noice()
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        config = function()
            require("plugins.configs.others").trouble()
        end,
    },
    {
        "MunifTanjim/nui.nvim",
        lazy = true,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("plugins.configs.others").blankline()
        end,
    },
    -- git
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.configs.gitsigns")
        end,
    },
    -- edit
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        config = function()
            require("plugins.configs.treesitter")
        end,
    },
    {
        "ggandor/leap.nvim",
        event = "BufRead",
        config = function()
            require("plugins.configs.others").leap()
        end,
        dependencies = {
            {
                "tpope/vim-repeat",
                event = "VeryLazy",
            },
        },
    },
    {
        "ggandor/flit.nvim",
        event = "BufRead",
        config = function()
            require("flit").setup()
        end,
        dependencies = {
            "leap.nvim",
        },
    },
    {
        "terrortylor/nvim-comment",
        cmd = "CommentToggle",
        config = function()
            require("plugins.configs.others").comment()
        end,
    },
    {
        "karb94/neoscroll.nvim",
        event = "BufRead",
        config = function()
            require("plugins.configs.others").neoscroll()
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = { "InsertEnter" },
        config = function()
            require("plugins.configs.others").autopairs()
        end,
        dependencies = "nvim-cmp",
    },
    {
        "echasnovski/mini.surround",
        event = { "BufRead" },
        config = function()
            require("plugins.configs.others").surround()
        end,
    },
    {
        "echasnovski/mini.ai",
        event = { "BufRead" },
        config = function()
            require("plugins.configs.others").ai()
        end,
    },
    -- load luasnips + cmp related in insert mode only
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter" },
        config = function()
            require("plugins.configs.cmp")
        end,
        dependencies = {
            {
                "saadparwaiz1/cmp_luasnip",
            },
            {
                "hrsh7th/cmp-nvim-lua",
            },
            {
                "hrsh7th/cmp-nvim-lsp",
            },
            {
                "hrsh7th/cmp-buffer",
            },
            {
                "rafamadriz/friendly-snippets",
            },
            {
                "hrsh7th/cmp-path",
            },
        },
    },
    {
        "L3MON4D3/LuaSnip",
        event = { "InsertEnter" },
        config = function()
            require("plugins.configs.snip")
        end,
    },

    -- lsp
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        opts = function()
            return require("plugins.configs.mason")
        end,
        configs = function()
            require("mason").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = "BufRead",
        dependencies = {
            {
                "mason.nvim",
            },
            {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                    require("mason-lspconfig").setup()
                end,
            },
        },
        config = function()
            require("plugins.configs.lspconfig")
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "BufRead",
        dependencies = "nvim-lspconfig",
        config = function()
            require("plugins.configs.nulls")
        end,
    },
    {
        "stevearc/aerial.nvim",
        dependencies = "nvim-lspconfig",
        config = function()
            require("plugins.configs.aerial")
        end,
        cmd = "AerialToggle",
    },
    {
        "windwp/nvim-spectre",
        cmd = "Spectre",
    },
    -- misc plugins
    {
        "numtostr/BufOnly.nvim",
        cmd = "BufOnly",
    },
    {
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        config = function()
            require("plugins.configs.others").toggleterm()
        end,
    },
    {
        "mrjones2014/smart-splits.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.configs.others").smartsplit()
        end,
    },
    {
        "rafcamlet/nvim-luapad",
        cmd = { "Luapad", "LuaRun" },
    },
    {
        "glepnir/dashboard-nvim",
        dependencies = "indent-blankline.nvim", -- make sure exclude filetype in indent work
        config = function()
            require("plugins.configs.dashboard").hyper()
        end,
    },
    {
        "lambdalisue/suda.vim",
        cmd = { "SudaRead", "SudaWrite" },
    },
    {
        "chrisbra/csv.vim",
        ft = { "csv", "tsv" },
    },
    {
        "sindrets/diffview.nvim",
        cmd = "DiffviewOpen",
    },

    -- md, latex and note taking
    {
        "iamcco/markdown-preview.nvim",
        ft = { "markdown", "md" },
        build = "cd app && yarn install",
        config = function()
            vim.g.mkdp_browser = "microsoft-edge"
        end,
    },
    {
        "gaoDean/autolist.nvim",
        cmd = "InsertEnter",
        ft = { "markdown", "md", "tex", "plaintex" },
        config = function()
            require("plugins.configs.others").autolist()
        end,
        dependencies = { "nvim-cmp", "nvim-autopairs" },
    },
    -- file managing , picker etc
    {
        "kyazdani42/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function()
            require("plugins.configs.nvimtree")
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = function()
            require("plugins.configs.telescope")
        end,
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                config = function()
                    require("telescope").load_extension("fzf")
                end,
            },
            {
                "nvim-telescope/telescope-bibtex.nvim",
                ft = { "markdown", "tex" },
                config = function()
                    require("telescope").load_extension("bibtex")
                end,
            },
            {
                "nvim-telescope/telescope-symbols.nvim",
            },
            {
                "debugloop/telescope-undo.nvim",
                dependencies = "telescope.nvim",
                config = function()
                    require("telescope").load_extension("undo")
                end,
            },
        },
    },

    {
        "Pocco81/TrueZen.nvim",
        cmd = {
            "TZAtaraxis",
            "TZMinimalist",
            "TZFocus",
        },
        config = function()
            require("plugins.configs.zenmode")
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.configs.whichkey")
        end,
    },
    -- debug
    {
        "mfussenegger/nvim-dap",
        ft = { "python", "py", "c", "cc" },
        lazy = true,
        dependencies = {
            {
                "mfussenegger/nvim-dap-python",
                dependencies = "nvim-dap",
                ft = { "python", "py" },
                config = function()
                    require("plugins.configs.dap").python()
                end,
            },
            {
                "rcarriga/nvim-dap-ui",
                dependencies = "nvim-dap",
                config = function()
                    require("plugins.configs.dap").ui()
                end,
            },
        },
    },
}

return M
