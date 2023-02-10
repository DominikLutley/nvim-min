local cmd = vim.cmd
local fn = vim.fn
local api = vim.api

-- Space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "


local packer_bootstrap = false -- Indicate first time installation

-- packer.nvim configuration
local conf = {
    profile = {
        enable = true,
        threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },
    display = {
        open_fn = function()
          return require("packer.util").float({ border = "rounded" })
        end,
    },
}

local function packer_init()
  -- Check if packer.nvim is installed
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path,
        })
    cmd([[packadd packer.nvim]])
  end

  -- Run PackerCompile if there are changes in this file
  local packerGrp = api.nvim_create_augroup("packer_user_config", { clear = true })
  api.nvim_create_autocmd(
      { "BufWritePost" },
      { pattern = "init.lua", command = "source <afile> | PackerCompile", group = packerGrp }
  )
end

-- Plugins
local function plugins(use)
  use({ "wbthomason/packer.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({
      "echasnovski/mini.nvim",
      config = function()
        require("config.mini")
      end,
  })
  use({
      "neoclide/coc.nvim",
      branch = "release",
      config = function()
        require("config.coc")
      end,
  })
  use({
      "folke/which-key.nvim",
      tag = "stable",
      config = function()
        require("config.which-key")
      end
  })
  use({
      "nvim-telescope/telescope.nvim",
      tag = "0.1.1",
      -- or                            , branch = "0.1.x",
      requires = { { "nvim-lua/plenary.nvim" } },
      config = function()
        require("config.telescope")
      end
  })
  use({
      "lewis6991/gitsigns.nvim",
      tag = "release",
      config = function()
        require("gitsigns").setup({})
      end
  })


  -- Bootstrap Neovim
  if packer_bootstrap then
    print("Restart Neovim required after installation!")
    require("packer").sync()
  end
end

-- packer.nvim
packer_init()
local packer = require("packer")
packer.init(conf)
packer.startup(plugins)
