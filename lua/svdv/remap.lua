vim.g.mapleader = " "
vim.keymap.set("n", "<leader>vd", ":NvimTreeToggle<CR>", { silent = true })

vim.keymap.set("i", "jk", "<Esc>")

-- Move selected lines in visual mode up or down, awesome!
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Tabline
vim.keymap.set("n", "<Tab>", ":TablineBufferNext<CR>", {silent = true})
vim.keymap.set("n", "<S-Tab>", ":TablineBufferPrevious<CR>", {silent = true})

-- Window hopping wit Alt
vim.keymap.set("n", "<A-h>", "<C-w>h<CR>")
vim.keymap.set("n", "<A-j>", "<C-w>j<CR>")
vim.keymap.set("n", "<A-k>", "<C-w>k<CR>")
vim.keymap.set("n", "<A-l>", "<C-w>l<CR>")

-- close buffer
vim.keymap.set("n", "<leader>c", ":bd<CR>")

-- Open horizontal terminal
vim.keymap.set("n", "<leader>th", ":below 18 sp<CR>:term<CR>i", {silent = true})
vim.keymap.set("t", "<leader>tc", "exit<CR>", {silent = true})

vim.keymap.set("n", "<leader>cc", ":below 18 sp<CR>:term<CR>ig++ std=c++2a -o ", {silent = true})

-- Color picker
vim.keymap.set("n", "<C-c>", "<cmd>PickColor<cr>", {silent = true})
vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", {silent = true})

vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Colorizer attach to buffer
vim.keymap.set("n", "<leader>sc", ":ColorizerAttachToBuffer<CR>", {silent = true})
-- Colorizer detach from buffer
vim.keymap.set("n", "<leader>hc", ":ColorizerDetachFromBuffer<CR>", {silent = true})

-- Paste from clipboard
vim.keymap.set("x", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>p", "\"+p")

-- Yank from clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


