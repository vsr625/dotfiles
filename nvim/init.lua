-- Speed up neovim setup
require("impatient")

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
vim.opt.scrolloff = 10
vim.opt.listchars:append { tab = "  " }

-- Keymaps
vim.g.mapleader = " "
vim.keymap.set({ "n", "v" }, "ga", "0")
vim.keymap.set({ "n", "v" }, "gl", "$")
vim.keymap.set("i", "<C-h>", "<C-w>")
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set({ "n", "v" }, "s", "<cmd>HopChar1<Cr>")

vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")

vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>s", ":so %<Cr>")
vim.keymap.set("n", "<leader>q", ":q<Cr>")
vim.keymap.set("n", "<leader>Q", ":q!<Cr>")
vim.keymap.set("n", "<leader>x", ":Bdelete<Cr>")

vim.keymap.set("n", "<leader>A", ":Alpha<Cr>")
vim.keymap.set("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<cr>")
vim.keymap.set("n", "<leader>o", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>")
vim.keymap.set("n", "<leader>O", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>")
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<Cr>")
vim.keymap.set("n", "<leader>g", ":LazyGit<Cr>")
vim.keymap.set("n", "<leader>G", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
vim.keymap.set("n", "<leader>f", ":Format<Cr>")
vim.keymap.set("n", "<leader>F", "<cmd>lua require('telescope.builtin').find_files()<cr>")

vim.keymap.set("n", "gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>")
vim.keymap.set("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")

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
})

-- Auto reload file if there were any changes
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})

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
      vim.cmd("colorscheme gruvbox-material")
    end,
  }

  -- Scroll bar thingy
  use {
    "lewis6991/satellite.nvim",
    config = function()
      require("satellite").setup {
        excluded_filetypes = {
          "NvimTree",
        },
      }
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
        show_current_context = true,
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

  -- Zen mode
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {}
    end,
  }

  -- Change cut and delete vim functionality
  use {
    "gbprod/cutlass.nvim",
    config = function()
      require("cutlass").setup {
        -- Don't modify the behaviour of 'd'
        exclude = { "nd", "xd" },
      }
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
          lsp_document_symbols = {
            theme = "dropdown",
          },
          lsp_implementations = {
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
    end,
  }

  -- buffer-deletes without ruining window layouts
  use {
    "famiu/bufdelete.nvim",
  }

  -- File explorer
  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
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

  -- Additional text objects
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      require("nvim-treesitter.configs").setup {
        textobjects = {
          select = {
            enable = true,
            keymaps = {
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
            },
          },
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
        -- settings = {
        --   gopls = {
        --     hints = {
        --       parameterNames = true,
        --     },
        --   },
        -- },
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
          go = {
            function()
              return {
                exe = "goimports | gofmt",
                stdin = true,
              }
            end,
          },
        },
      }
    end,
  }

  -- Highlight word under cursor intelligently
  use {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure {
        delay = 0,
        filetypes_denylist = {
          "NvimTree",
          "TelescopePrompt",
        },
      }
    end,
  }

  -- Golang
  -- TODOs
  -- 1. Make search UI nicer and more intuitive
  -- 2. Run Go tests and figure out some bindings
  use {
    "ray-x/go.nvim",
    requires = { "ray-x/guihua.lua" },
    config = function()
      require("go").setup {}
    end,
  }
end)
