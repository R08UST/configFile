local M = {} 
local o = vim.o
-- plugin setting
M.load = function()
    o.packpath = vim.fn.stdpath('config')
    o.runtimepath = vim.fn.stdpath('config') .. '/pack/packer' .. ',' .. o.runtimepath

	local installpath =  o.packpath .. "/pack/packer/opt/packer.nvim"

    -- install packer
    if vim.fn.empty(vim.fn.glob(installpath)) > 0 then

	    print "Cloning packer.."
	    -- remove the dir before cloning
	    vim.fn.delete(installpath, "rf")
	    vim.fn.system {
	        "git",
    	    "clone",
	        "https://github.com/wbthomason/packer.nvim",
	        "--depth",
    	    "20",
	        installpath,
	    }

    	vim.cmd "packadd packer.nvim"
	    present, packer = pcall(require, "packer")

    	if present then
    	    print "Packer installed."
    	else
    	    error("Couldn't install packer !\nPacker path: " .. installpath .. "\n" .. packer)
    	end
    end

    vim.cmd "packadd packer.nvim"
    local present, packer = pcall(require, "packer")

    packer.startup{function()
	    use "nvim-lua/plenary.nvim"
    	-- optimizer
    	use "lewis6991/impatient.nvim"
    	use {
    	    "nathom/filetype.nvim",
    	    config = function()
        		vim.g.did_load_filetypes = 1	    
    	    end,
    	}
    	-- notification
    	use {
    	    "rcarriga/nvim-notify",
    	    config = function()
        		require("plugins.configs.others").notify()
    	    end,
    	-- plugin manager
    	}
    	use {
    	    "wbthomason/packer.nvim",
    	    event = "VimEnter",
    	}
    	-- beautify
    	use "nvim-lua/popup.nvim" 
    	use "rktjmp/lush.nvim"
    	use {
    	    "kyazdani42/nvim-web-devicons",
    	    config = function()
        		require "plugins.configs.icons"
    	    end,
	    }

    	use {
    	    "norcalli/nvim-colorizer.lua",
    	    event = "BufRead",
    	    config = function()
        		require("plugins.configs.others").colorizer()
    	    end,
    	}

    	use {
    	    "feline-nvim/feline.nvim",
    	    config = function()
    		    require "plugins.configs.statusline"
    	    end,
   	    }

    	use {
    	    "akinsho/bufferline.nvim",
    	    after = "nvim-web-devicons",
            tag = "*",
    	    config = function()
    		    require "plugins.configs.bufferline"
    	    end,
        } 

	    use {
    	    "numtostr/BufOnly.nvim",
    	    cmd= "BufOnly"
        }

        use {
    	    "lukas-reineke/indent-blankline.nvim",
    	    event = "VimEnter",
    	    config = function()
        		require("plugins.configs.others").blankline()
    	    end,
	    }

    	use {
    	    "nvim-treesitter/nvim-treesitter",
    	    event = "BufRead",
    	    config = function()
        		require "plugins.configs.treesitter"
    	    end,
    	}

    	use {
    	    "p00f/nvim-ts-rainbow",
    	    event = "BufRead",
    	    config = function()
        		require "plugins.configs.treesitter"
    	    end,
    	}

	    -- git stuff
    	use {
    	    "lewis6991/gitsigns.nvim",
    	    opt = true,
    	    config = function()
        		require "plugins.configs.gitsigns"
    	    end,
    	    setup = function()
        		require("utils").packer_lazy_load "gitsigns.nvim"
    	    end,
    	}

	    -- smooth scroll
	    use {
	        "karb94/neoscroll.nvim",
	        opt = true,
	        config = function()
		        require("plugins.configs.others").neoscroll()
	        end,
	        setup = function()
		        require("utils").packer_lazy_load "neoscroll.nvim"
	        end,
	    }

	    -- lsp stuff
	    use {
	        'williamboman/nvim-lsp-installer',
	        opt = true,
	        setup = function()
	            require("utils").packer_lazy_load "nvim-lsp-installer"
	        end,
	    }

	    use {
	        "neovim/nvim-lspconfig",
	        after = 'nvim-lsp-installer',
	        config = function()
		        require "plugins.configs.lspconfig"
	    end,
	    }

	    use {
	        'jose-elias-alvarez/null-ls.nvim',
	        after = "nvim-lspconfig",
	        config = function()
	            require("plugins.configs.nulls")
	        end,
	    }

        use {
            "ThePrimeagen/refactoring.nvim",
            after = 'nvim-lspconfig',
	        config = function()
                require('refactoring').setup({})
	        end,
    	    setup = function()
                require("utils").packer_lazy_load "refactoring.nvim"
    	    end,
        }

	    use {
	        "ray-x/lsp_signature.nvim",
	        after = "nvim-lspconfig",
	        config = function()
		        require("plugins.configs.others").signature()
	        end,
	    }

        use {
	        'stevearc/aerial.nvim',
	        after = "nvim-lspconfig",
	        config = function()
		        require "plugins.configs.aerial"
	        end,
	        cmd = "AerialToggle!"
        }

	    -- load luasnips + cmp related in insert mode only

	    use {
    	    "hrsh7th/nvim-cmp",
    	    event = "InsertEnter",
    	    config = function()
    		    require "plugins.configs.cmp"
    	    end,
    	}

    	use {
    	    "L3MON4D3/LuaSnip",
    	    wants = "friendly-snippets",
    	    after = "nvim-cmp",
    	    config = function()
    		    require "plugins.configs.snip"
    	    end,
    	}
	
        use {
	    "saadparwaiz1/cmp_luasnip",
	    after = "LuaSnip",
        }

        use {
	    "hrsh7th/cmp-nvim-lua",
	    after = "cmp_luasnip",
        }

        use {
	    "hrsh7th/cmp-nvim-lsp",
	    after = "nvim-cmp",
        }

    	use {
    	    "hrsh7th/cmp-buffer",
    	    after = "nvim-cmp",
        }

    	use {
    	    "rafamadriz/friendly-snippets",
    	    after = "cmp-buffer",
        }

    	use {
    	    "hrsh7th/cmp-path",
    	    after = "nvim-cmp",
        }

    	use {
            "hrsh7th/cmp-cmdline",
    	    after = "nvim-cmp",
        }

       -- misc plugins
    	use {
    	    "rafcamlet/nvim-luapad",
    	    cmd = {'Luapad', 'LuaRun'}

    	}
    	use {
    	    "ggandor/lightspeed.nvim",
    	    event = "BufRead",
    	    config = function()
        		require("plugins.configs.others").lightspeed()
    	    end
    	}
        use {
            "antoinemadec/FixCursorHold.nvim",
            event = "BufRead",
            config = function()
                vim.g.cursorhold_updatetime = 100
            end,
        }
	    use {
       	    "andymass/vim-matchup",
    	    opt = true,
    	    setup = function()
        		require("utils").packer_lazy_load "vim-matchup"
    	    end,
    	}

    	use {
    	    "windwp/nvim-autopairs",
    	    after = "nvim-cmp",
    	    config = function()
        		require("plugins.configs.others").autopairs()
    	    end,
    	}

    	use {
    	    "glepnir/dashboard-nvim",
            after = 'indent-blankline.nvim', -- make sure exclude filetype in indent work
        	config = function()
    		    require "plugins.configs.dashboard"
    	    end,
    	}

	    use {
	    "sbdchd/neoformat",
	    cmd = "Neoformat",
        config = function()
            vim.g.neoformat_try_node_exe = 1
        end
        }

        use {
            'lambdalisue/suda.vim',
            cmd = {"SudaRead", "SudaWrite"},
    	}
        use {
            'chrisbra/csv.vim',
            ft = {'csv', 'tsv'}
	    }
        use {
	        'dstein64/vim-startuptime',
            cmd = "StartupTime"
        }

        use {
	        'windwp/nvim-spectre',
    	    setup = function()
        		require("utils").packer_lazy_load "nvim-spectre"
    	    end,
        }
        use {
	        'sindrets/diffview.nvim',
            cmd = "DiffviewOpen"
        }

        use {
	        'terrortylor/nvim-comment',
	        cmd = "CommentToggle",
	        config = function()
		        require("plugins.configs.others").comment()
	        end,
	    }
        -- md, latex and notetaking
        use {
	        'iamcco/markdown-preview.nvim',
            run = 'cd app && yarn install',
	        config = function()
		        vim.g.mkdp_browser = 'msedge.exe'
	        end,
        }
        -- Thesaurus
        use {
            'ron89/thesaurus_query.vim',
            ft = {'tex', 'md', 'markdown'},
            config = function()
                vim.g.tq_language={'en', 'cn'}
            end,
        }
	    -- file managing , picker etc
	    use {
	        "kyazdani42/nvim-tree.lua",
	        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	        config = function()
		        require "plugins.configs.nvimtree"
	        end,
	    }

	    use {
	        "nvim-telescope/telescope.nvim",
            cmd = "Telescope",
    	    config = function()
      		    require "plugins.configs.telescope"
    	    end,
	        requires = {
	        	{
		            "nvim-telescope/telescope-fzf-native.nvim",
	                run = "make",
	            },
	       	    {
	                'nvim-telescope/telescope-dap.nvim',
	                after = { 'telescope.nvim', 'nvim-dap' },
	            },
	            {
	        	    'nvim-telescope/telescope-symbols.nvim',
	        	    after = 'telescope.nvim',
	    		},
	            {
	                'nvim-telescope/telescope-bibtex.nvim',
	            	after = 'telescope.nvim',
	            },
	        },
    	}

    	use {
	       "Pocco81/TrueZen.nvim",
	       cmd = {
	    	"TZAtaraxis",
	    	"TZMinimalist",
	    	"TZFocus",
	       },
	        config = function()
    	    	require "plugins.configs.zenmode"
    	    end,
    	}

        use {
    	    'folke/which-key.nvim',
    	    config = function()
        		require "plugins.configs.whichkey"
    	    end,
    	}

        use {
	        'mfussenegger/nvim-dap',
	        opt = true,
	        ft = {'python','py', 'c', 'cc'},
        }

        use {
	    'mfussenegger/nvim-dap-python', 
	        after = 'nvim-dap',
	        ft = {'python','py'},
	        config = function()
		    require('plugins.configs.dap').python()
	        end,
	    }

        use {'rcarriga/nvim-dap-ui',
	        after = 'nvim-dap',
	        config = function()
		        require('plugins.configs.dap').ui()
	        end,
	    }
    end,
    config = {
	    -- The root has to be a directory named "pack"
	    package_root = o.packpath .. '/pack',
	    display = {
    	    open_fn = function()
    		    return require("packer.util").float{ border = "single" }
	        end,
	        prompt_border = "single",
	    },
	    git = {
	        clone_timeout = 6000, -- seconds
	    },
	    auto_clean = true,
	    compil_on_sync = true,
        ensure_dependencies = true,
	}
    }
end

return M
