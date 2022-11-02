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
vim.keymap.set('n', '<leader>f', function() require('telescope.builtin').find_files() end)
vim.keymap.set('n', '<leader>g', function() require('telescope.builtin').live_grep() end)
vim.keymap.set('n', '<leader>b', function() require('telescope.builtin').buffers() end)

-- Plugins
require('packer').startup(function(use)
	-- Packer can manage itself
	use {
		'wbthomason/packer.nvim'
	}

	-- Colorscheme
	use {
		'folke/tokyonight.nvim',
		config = function()
			vim.cmd("colorscheme tokyonight-storm")
		end
	}

	-- Git signs
	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup {
				numhl = true,

			}
		end
	}


	-- Fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } },
		config = function()
			require('telescope').setup {
				pickers = {
					find_files = {
						theme = "dropdown",
					}
				},
			}
		end
	}
end)
