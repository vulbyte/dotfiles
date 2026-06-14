-- In init.lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line Numbers
vim.opt.number = true          -- Show the absolute line number for the current line
vim.opt.relativenumber = true  -- Show relative numbers for all other lines

-- Tab management
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<Tab>", "<cmd>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<S-Tab>", "<cmd>tabprevious<CR>", { desc = "Previous tab" })
-- Move current tab left/right
vim.keymap.set("n", "<leader>th", "<cmd>-tabmove<CR>", { desc = "Move tab left" })
vim.keymap.set("n", "<leader>tl", "<cmd>+tabmove<CR>", { desc = "Move tab right" })
-- Move tab to index N (1-9)
for i = 1, 9 do
  vim.keymap.set("n", "<leader>t" .. i, "<cmd>" .. (i - 1) .. "tabmove<CR>", { 
    desc = "Move tab to position " .. i 
  })
end
-- Open a new tab with a terminal in insert mode
vim.keymap.set("n", "<leader>tt", function()
  vim.cmd.tabnew()
  vim.cmd.term()
  vim.cmd.startinsert()
end, { desc = "Terminal in new tab" })
-- Go to Definition in a new tab
vim.keymap.set("n", "gD", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", { desc = "Go to Definition in new tab" })
-- Go to File (under cursor) in a new tab
vim.keymap.set("n", "gF", "<C-w>gf", { desc = "Go to File in new tab" })

vim.keymap.set({'n', 'v'}, '<Leader>Y', '"+y', { desc = "Yank to system clipboard" })

-- Move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

require("config.lazy")
