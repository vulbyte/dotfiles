-- 1. Bootstrap: Clone lazy.nvim if it's not already there
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- 2. Add lazy.nvim to the runtime path so Neovim can find the 'lazy' module
vim.opt.rtp:prepend(lazypath)

-- 3. Load lazy safely
local ok, lazy = pcall(require, "lazy")
if not ok then
  vim.api.nvim_echo({ { "Failed to load lazy.nvim!", "ErrorMsg" } }, true, {})
  return
end

-- 4. Your Plugin Setup
lazy.setup({
  -- UI: Carbonfox Theme

	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
	  "EdenEast/nightfox.nvim",
	  lazy = false,
	  priority = 1000,
	  config = function()
	    require("nightfox").setup({
	      options = {
		transparent = false, 
		styles = {
		  comments = "italic",
		  keywords = "bold",
		  types = "italic,bold",
		}
	      },
	      palettes = {
		carbonfox = {
		  bg1 = "#000000",
		  bg0 = "#000000",
		  bg3 = "#161616",
		  sel0 = "#002200",
		},
		dayfox = {
		  sel0 = "#000000", -- Selection background: Black
		  sel1 = "#ffffff", -- Selection text color: White
		},
	      },
	      specs = {
		carbonfox = {
		  syntax = {
		    bracket = "#ffff00",
		  },
		},
	      },
	      groups = {
		dayfox = {
		  Cursor = { bg = "#00ff00", fg = "#000000" }, 
		},
	      },
	    })

	    -- 🔴 ADD THIS LINE RIGHT HERE:
	    -- This forces all modes (a) to look like a block and respect the 'Cursor' highlight group.
	    vim.opt.guicursor = "a:block-Cursor"

	    vim.cmd("colorscheme carbonfox")
	  end,
	},
  -- UI: Lualine (Statusline)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('lualine').setup({
        options = { theme = 'auto' },
        -- You can drop your "evil_lualine" config here
      })
    end,
  },

  -- Utility: Colorizer
-- Utility: Colorizer (Swapped to maintained fork)
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        user_default_options = {
          mode = "background",
          -- These ensure it picks up all color types
          RGB = true,
          RRGGBB = true,
          names = true,
          RRGGBBAA = true,
          rgb_fn = true,
          hsl_fn = true,
          css = true,
          css_fn = true,
        },
      })
    end,
  },

  -- Utility: Undotree
  { "mbbill/undotree", config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
  end },

-- Syntax: Treesitter
{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- 'main' tells lazy which module to call .setup() on. 
    -- If 'nvim-treesitter.configs' fails, we use the core module.
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = { 
        "lua", "rust", "javascript", "typescript", 
        "bash", "html", "css", "ron", "toml" 
      },
      highlight = { 
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    },
    -- This safety net prevents the error from stopping your startup
    config = function(_, opts)
      local status_ok, ts_config = pcall(require, "nvim-treesitter.configs")
      if not status_ok then
        return
      end
      ts_config.setup(opts)
    end,
  },

  -- Navigation: Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    end,
  },

  -- Editing
  { "olrtg/nvim-emmet" },
  { "kylechui/nvim-surround", version = "*", config = true },

-- Formatting
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        python = { "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettier" },
        css = { "prettier" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        nix = { "alejandra" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },

  -- Tool Installer
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "stylua",
        "black",
        "prettierd",
        "clang-format",
        "alejandra",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      -- This little loop ensures the tools are installed automatically
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
})

