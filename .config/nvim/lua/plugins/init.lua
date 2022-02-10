local M = {} local cmd = vim.cmd
local g = vim.g
local o = vim.o
local map = vim.api.nvim_set_keymap
local CONFIG_PATH = vim.fn.stdpath('config')
-- plugin setting
M.init = function()
o.packpath = vim.fn.stdpath('config')
o.runtimepath = vim.fn.stdpath('config') .. '/pack/packer' .. ',' .. o.runtimepath

vim.cmd "packadd packer.nvim"
local present, packer = pcall(require, "packer")

-- install packer
if not present then
   local installpath =  o.packpath .. "/pack/packer/opt/packer.nvim"

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

packer.startup{function()

    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim" 
    use "rktjmp/lush.nvim"

    use {
	"wbthomason/packer.nvim",
	event = "VimEnter",
   }

    use {
      "kyazdani42/nvim-web-devicons",
      config = function()
         require "plugins.configs.icons"
      end,
   }

    use {
      "famiu/feline.nvim",
      after = "nvim-web-devicons",
      config = function()
         require "plugins.configs.statusline"
      end,
   }

    use {
      "akinsho/bufferline.nvim",
      after = "nvim-web-devicons",
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
      event = "BufRead",
      config = function()
         require("plugins.configs.others").blankline()
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

	    use{
	'williamboman/nvim-lsp-installer',
	opt = true,
	setup = function()
	         require("utils").packer_lazy_load "nvim-lsp-installer"
	-- vim.defer_fn(function()
	--             vim.cmd "silent! e %"
	-- end, 0)
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
       'tami5/lspsaga.nvim',
       after = "nvim-lspconfig",
       config = function()
          require("plugins.configs.others").saga()
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
      "andymass/vim-matchup",
      opt = true,
      setup = function()
         require("utils").packer_lazy_load "vim-matchup"
      end,
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
         require("plugins.configs.others").luasnip()
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
      after = "cmp-nvim-lua",
   }

   use {
      "hrsh7th/cmp-buffer",
      after = "cmp-nvim-lsp",
   }

   use {
      "rafamadriz/friendly-snippets",
      after = "cmp-buffer",
   }

   use {
      "hrsh7th/cmp-path",
      after = "cmp-nvim-lsp",
   }

   use {
      "hrsh7th/cmp-cmdline",
      after = "cmp-nvim-lsp",
   }

   -- misc plugins
   use {
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = function()
         require("plugins.configs.others").autopairs()
      end,
   }

   use {
      "glepnir/dashboard-nvim",
      config = function()
         require "plugins.configs.dashboard"
      end,
   }

   use {
      "sbdchd/neoformat",
      cmd = "Neoformat",
   }

    use {
        'lambdalisue/suda.vim',
        cmd = {"SudaRead", "SudaWrite"},
   }
    use {
        'chrisbra/csv.vim',
        ft = {'csv', 'tsv'}
   }
    use {'dstein64/vim-startuptime',
        cmd = "StartupTime"
    }

    use {'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        cmd = 'MarkdownPreview'
    }

    use {'windwp/nvim-spectre',
        cmd = "Spectre"
    }
    use {'sindrets/diffview.nvim',
        cmd = "DiffviewOpen"
    }

    use {
      'terrortylor/nvim-comment',
      cmd = "CommentToggle",
      config = function()
         require("plugins.configs.others").comment()
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
      -- because cheatsheet is not activated by a teleacope command
      module = "cheatsheet",
      requires = {
         {
            "sudormrfbin/cheatsheet.nvim",
            after = "telescope.nvim",
            config = function()
               require "plugins.configs.chadsheet"
            end,
         },
         {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make",
         },
	{
         'nvim-telescope/telescope-dap.nvim',
         after = { 'telescope.nvim', 'nvim-dap' },
	},
    },

      config = function()
         require "plugins.configs.telescope"
      end,
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

    use {'mfussenegger/nvim-dap',
	opt = true,
	ft = {'python','py'},
    }
    use {'mfussenegger/nvim-dap-python', 
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
         return require("packer.util").float { border = "single" }
      end,
      prompt_border = "single",
   },
   git = {
      clone_timeout = 6000, -- seconds
   },
   auto_clean = true,
   compile_on_sync = true,
}
}
end

return M