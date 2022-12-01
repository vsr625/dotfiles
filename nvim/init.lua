-- Speed up neovim setup
require("impatient")

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
vim.opt.undofile = true

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
vim.keymap.set("n", "<leader>x", ":bdelete<Cr>")

-- Retain window position when switching buffers
vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*",
  callback = function()
    vim.b.winview = vim.fn.winsaveview()
  end,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    if vim.b.winview then
      vim.fn.winrestview(vim.b.winview)
      vim.b.winview = nil
    end
  end,
})

-- Filetype specific config
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

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

  -- More sleeker colorcolumn
  use {
    "xiyaowong/virtcolumn.nvim",
  }

  -- Smooth Scrolling
  use {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup {}
      local t = {}
      t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "100" } }
      t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "100" } }
      t["zt"] = { "zt", { "100" } }
      t["zz"] = { "zz", { "100" } }
      t["zb"] = { "zb", { "100" } }
      require("neoscroll.config").set_mappings(t)
    end,
  }

  -- Indent guides
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {}
    end,
  }

  -- Fast motion for pro coding
  use {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
      vim.keymap.set({ "n", "v" }, "s", ":HopChar1<Cr>")
    end,
  }

  -- Zen mode
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {}
    end,
  }

  -- Auto brace closer
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  }

  -- Speed up neovim - able to notice difference
  use { "lewis6991/impatient.nvim" }

  -- Status line
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("lualine").setup {
        options = {
          theme = "tokyonight",
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

  -- Fuzzy finders
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-fzf-native.nvim" } },
    config = function()
      require("telescope").setup {
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous,
              ["<C-h>"] = { "<c-s-w>", type = "command" },
            },
          },
        },
        pickers = {
          find_files = {
            theme = "dropdown",
          },
          lsp_dynamic_workspace_symbols = {
            theme = "dropdown",
          },
          buffers = {
            theme = "dropdown",
          },
          live_grep = {
            theme = "dropdown",
          },
          lsp_references = {
            theme = "dropdown",
          },
        },
      }

      require("telescope").load_extension("fzf")

      vim.keymap.set("n", "<leader>o", function()
        require("telescope.builtin").lsp_dynamic_workspace_symbols()
      end)
      vim.keymap.set("n", "<leader>F", function()
        require("telescope.builtin").find_files()
      end)
      vim.keymap.set("n", "<leader>G", function()
        require("telescope.builtin").live_grep()
      end)
      vim.keymap.set("n", "<leader>b", function()
        require("telescope.builtin").buffers()
      end)
    end,
  }

  -- File explorer
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      -- Icon support
      "nvim-tree/nvim-web-devicons",
    },
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
        filters = {
          dotfiles = true,
        },
        update_focused_file = {
          enable = true,
        },
      }

      vim.keymap.set("n", "<leader>T", ":NvimTreeToggle<Cr>")
    end,
  }

  -- Git integration
  use {
    "kdheepak/lazygit.nvim",
    config = function()
      vim.keymap.set("n", "<leader>g", ":LazyGit<Cr>")
    end,
  }

  -- Auto save files - so you don't have to
  use {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        execution_message = { message = "" },
      }
    end,
  }

  -- Startup dashboard
  use {
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)

      vim.keymap.set("n", "<leader>a", ":Alpha<Cr>")
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
    requires = { "hrsh7th/nvim-cmp" },
    config = function()
      -- Pretify lsp windows
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Lua setup
      require("lspconfig").sumneko_lua.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
        capabilities = capabilities,
      }

      require("lspconfig").gopls.setup {
        capabilities = capabilities,
      }

      vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
      vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
      vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
      vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
      vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
      vim.keymap.set("n", "gr", function()
        require("telescope.builtin").lsp_references()
      end)
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

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline" },
          { name = "path" },
          { name = "cmdline_history" },
        },
      })

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
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
          json = {
            require("formatter.filetypes.json").jq,
          },
        },
      }

      vim.keymap.set("n", "<leader>f", ":Format<Cr>")
    end,
  }
end)
