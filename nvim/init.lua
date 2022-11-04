-- Options
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
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
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

-- Keymaps
vim.g.mapleader = " "
vim.keymap.set({ "n", "v" }, "ga", "0")
vim.keymap.set({ "n", "v" }, "gl", "$")
vim.keymap.set("i", "<C-h>", "<C-w>")
vim.keymap.set("n", "U", "<C-r>")

vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")

vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>h", ":nohl<Cr>")
vim.keymap.set("n", "<leader>e", ":Explore<Cr>")
vim.keymap.set("n", "<leader>q", ":q<Cr>")
vim.keymap.set("n", "<leader>s", ":so %<Cr>")
vim.keymap.set("n", "<leader>Q", ":q!<Cr>")
vim.keymap.set("n", "<leader>w", ":w<Cr>")
vim.keymap.set("n", "<leader>F", ":Format<Cr>")
vim.keymap.set("n", "<leader>T", ":NvimTreeToggle<Cr>")
vim.keymap.set("n", "<leader>f", ":Format<Cr>")
vim.keymap.set("n", "<leader>g", ":LazyGit<Cr>")

vim.keymap.set("n", "<leader>F", function()
  require("telescope.builtin").find_files()
end)
vim.keymap.set("n", "<leader>G", function()
  require("telescope.builtin").live_grep()
end)
vim.keymap.set("n", "<leader>b", function()
  require("telescope.builtin").buffers()
end)

vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")

-- Plugins
require("packer").startup(function(use)
  -- Packer can manage itself
  use {
    "wbthomason/packer.nvim",
  }

  -- Colorscheme
  use {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd("colorscheme tokyonight-storm")
    end,
  }

  -- Git signs
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        numhl = true,
      }
    end,
  }

  -- Smooth Scrolling
  use {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup {
        easing_function = "quadratic",
      }
    end,
  }

  -- Indent guides
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {}
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
    config = function()
      require("lualine").setup {
        options = {
          theme = "tokyonight",
          icons_enabled = false,
        },
        sections = {
          lualine_b = { "branch", "diagnostics" },
          lualine_x = { "filetype" },
        },
      }
    end,
  }

  -- Fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("telescope").setup {
        pickers = {
          find_files = {
            theme = "dropdown",
          },
        },
      }
    end,
  }

  -- File explorer
  -- TODO - maybe try different alternative for this
  use {
    "nvim-tree/nvim-tree.lua",
    config = function()
      -- Auto close vim if file explorer is the last thing open
      vim.api.nvim_create_autocmd("BufEnter", {
        nested = true,
        callback = function()
          if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
            vim.cmd("quit")
          end
        end,
      })

      require("nvim-tree").setup {
        renderer = {
          icons = {
            show = {
              file = false,
              folder = false,
              folder_arrow = false,
            },
          },
        },
      }
    end,
  }

  -- Git integration
  use {
    "kdheepak/lazygit.nvim",
  }

  -- Auto save files - so you don't have to
  use {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {}
    end,
  }

  -- Comment support
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "lua", "go" },
        sync_install = true,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      }
    end,
  }

  -- LSP Config
  use {
    "neovim/nvim-lspconfig",
    config = function()
      -- Pretify lsp windows
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

      -- Lua setup
      require("lspconfig").sumneko_lua.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      }
    end,
  }

  -- External Server installer
  use {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  }

  use {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        automatic_installation = true,
      }
    end,
  }

  -- Autocomplete stuff
  use {
    "hrsh7th/nvim-cmp",
    requires = { { "hrsh7th/cmp-buffer" }, { "hrsh7th/cmp-path" }, { "hrsh7th/cmp-nvim-lsp" }, { "L3MON4D3/LuaSnip" } },
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
          ["<CR>"] = cmp.mapping.confirm { select = true },
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
    end,
  }

  -- Formatter
  use {
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup {
        filetype = {
          lua = {
            require("formatter.filetypes.lua").stylua,
          },
        },
      }
    end,
  }
end)
