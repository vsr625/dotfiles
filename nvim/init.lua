-- Options
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.colorcolumn = "100"
vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.signcolumn = "yes"
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.pumheight = 20
vim.opt.list = true
vim.opt.undofile = true
vim.opt.guicursor:append("a:blinkon1")
vim.opt.autoread = true
vim.opt.scrolloff = 8
vim.opt.listchars:append { tab = "  " }
vim.opt.fixeol = false

-- Keymaps
vim.g.mapleader = " "
vim.keymap.set({ "n", "v", "o" }, "ga", "0")
vim.keymap.set({ "n", "v", "o" }, "gl", "$")
vim.keymap.set("i", "<C-h>", "<C-w>")
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set({ "n", "v" }, "s", vim.cmd.HopChar1)

vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")

local function bang_it(vim_cmd)
  return function()
    vim_cmd { bang = true }
  end
end

vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>Q", bang_it(vim.cmd.q))

-- Autocmds
-- Smart disabling of hlsearch - very neat!
vim.on_key(function(char)
  if vim.fn.mode() == "n" then
    vim.opt.hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/" }, vim.fn.keytrans(char))
  end
end, vim.api.nvim_create_namespace("auto_hlsearch"))

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 100 }
  end,
  group = config_group,
})

-- Auto reload file if there were any changes
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
  group = config_group,
})

-- Retain window position when switching buffers
vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*",
  callback = function()
    vim.b.winview = vim.fn.winsaveview()
  end,
  group = config_group,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    if vim.b.winview then
      vim.fn.winrestview(vim.b.winview)
      vim.b.winview = nil
    end
  end,
  group = config_group,
})

-- Plugins
require("packer").startup(function(use)
  -- Packer can manage itself
  use {
    "wbthomason/packer.nvim",
  }

  -- Colorscheme
  use {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.cmd("colorscheme gruvbox-material")
    end,
  }

  -- Auto detect indentations
  use {
    "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup {}
    end,
  }

  -- Git signs
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {}
    end,
  }

  -- Smooth Scrolling
  use {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup {}
      local t = {}
      t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "50" } }
      t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "50" } }
      t["zt"] = { "zt", { "50" } }
      t["zz"] = { "zz", { "50" } }
      t["zb"] = { "zb", { "50" } }
      require("neoscroll.config").set_mappings(t)
    end,
  }

  -- Indent guides
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
      }
    end,
  }

  -- Fast motion for pro coding
  use {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup {}
    end,
  }

  -- Auto brace closer
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  }

  -- Status line
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("lualine").setup {
        options = {
          theme = "gruvbox-material",
          icons_enabled = true,
        },
        sections = {
          lualine_c = { { "filename", file_status = false, path = 1 } },
          lualine_b = { { "branch", icon = "" }, "diagnostics" },
          lualine_x = { "filetype" },
        },
      }
    end,
  }

  -- Autocomplete stuff
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-cmdline" },
      { "dmitmel/cmp-cmdline-history" },
      { "hrsh7th/cmp-calc" },
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local select_opts = { behavior = cmp.SelectBehavior.Select }
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "calc" },
        },
        window = {
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          fields = { "menu", "abbr", "kind" },
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = "λ",
              luasnip = "⋗",
              buffer = "Ω",
              path = "🖫",
            }

            item.menu = menu_icon[entry.source.name]
            return item
          end,
        },
        mapping = {
          ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
          ["<Down>"] = cmp.mapping.select_next_item(select_opts),
          ["<CR>"] = cmp.mapping.confirm { select = true, behavior = cmp.ConfirmBehavior.Insert },
          ["<Tab>"] = cmp.mapping(function(fallback)
            local col = vim.fn.col(".") - 1

            if cmp.visible() then
              cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
              fallback()
            else
              cmp.complete()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item(select_opts)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
      }

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline" },
          { name = "path" },
          { name = "cmdline_history" },
        },
      })
    end,
  }
end)
