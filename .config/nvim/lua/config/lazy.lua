-- 1. Bootstrap Lazy
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
vim.opt.rtp:prepend(lazypath)

-- 2. Setup Lazy
require("lazy").setup({
	-- Theme
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nightfox").setup({
				options = {
					transparent = false,
					styles = { comments = "italic", keywords = "bold", types = "italic,bold" },
				},
				palettes = {
					carbonfox = { bg1 = "#000000", bg0 = "#000000", bg3 = "#161616", sel0 = "#002200" },
				},
				specs = {
					carbonfox = { syntax = { bracket = "#ffff00" } },
				},
			})
			vim.opt.guicursor = "a:block-Cursor"
			vim.cmd("colorscheme carbonfox")
		end,
	},

	-- UI: Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = { options = { theme = "auto" } },
	},

	-- Utility: Colorizer
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ user_default_options = { mode = "background" } })
		end,
	},

	-- Utility: Undotree
	{
		"mbbill/undotree",
		keys = { { "<leader>u", vim.cmd.UndotreeToggle } },
	},

	-- Syntax: Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local status, ts_config = pcall(require, "nvim-treesitter.configs")
			if not status then
				vim.notify("nvim-treesitter not found.", vim.log.levels.WARN)
				return
			end
			ts_config.setup({
				ensure_installed = {
					"bash",
					"css",
					"html",
					"javascript",
					"lua",
					"markdown",
					"ron",
					"rust",
					"svelte",
					"toml",
					"typescript",
				},
				highlight = { enable = true, additional_vim_regex_highlighting = false },
				indent = { enable = true },
			})
		end,
	},

	-- Tool Installer
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-tool-installer").setup({
				ensure_installed = { "stylua", "black", "prettierd", "clang-format", "alejandra" },
			})
		end,
	},

	-- Navigation: Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = { { "<leader>pf", "<cmd>Telescope find_files<cr>" } },
	},

	-- Editing
	{ "olrtg/nvim-emmet" },
	{ "kylechui/nvim-surround", version = "*", config = true },

	-- Formatting

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
				javascript = { "prettierd", "prettier", stop_after_first = false },
				-- ... rest of your ft list
			},

			-- In your conform.nvim block:
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
				-- Switch from prettierd to prettier to avoid daemon argument crashes
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				nix = { "alejandra" },
			},

			formatters = {
				prettier = {
					-- Use the absolute path to the Mason binary
					command = vim.fn.stdpath("data") .. "/mason/bin/prettier",
					-- Pass the config file strictly via the --config flag
					args = {
						"--config",
						vim.fn.stdpath("config") .. "/prettier-global.json",
						"--stdin-filepath",
						"$FILENAME",
					},
				},
			},
			format_on_save = {
				timeout_ms = 2000,
				lsp_fallback = true,
			},
		},
	},
})
