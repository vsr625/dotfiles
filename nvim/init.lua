-- Options
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.shiftwidth = 2
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.colorcolumn = '100'
vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.signcolumn = 'yes'
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.pumheight = 20

-- Keymaps
vim.g.mapleader = ' '
vim.keymap.set({ 'n', 'v' }, 'ga', '0')
vim.keymap.set({ 'n', 'v' }, 'gl', '$')
vim.keymap.set('i', '<C-h>', '<C-w>')
vim.keymap.set('n', 'U', '<C-r>')

vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-j>', '<C-w>j')

vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>h', ':nohl<Cr>')
vim.keymap.set('n', '<leader>e', ':Explore<Cr>')
vim.keymap.set('n', '<leader>q', ':q<Cr>')
vim.keymap.set('n', '<leader>s', ':so %<Cr>')
vim.keymap.set('n', '<leader>Q', ':q!<Cr>')
vim.keymap.set('n', '<leader>w', ':w<Cr>')
