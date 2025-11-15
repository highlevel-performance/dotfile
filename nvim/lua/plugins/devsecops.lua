-- ================================
-- DevSecOps Custom Plugins
-- ================================

return {
  -- Git integration
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Better syntax highlighting for DevSecOps files
  {
    "towolf/vim-helm",
    ft = "helm",
  },

  -- Ansible
  {
    "pearofducks/ansible-vim",
    ft = { "yaml.ansible", "ansible" },
  },

  -- Dockerfile
  {
    "ekalinin/Dockerfile.vim",
    ft = "dockerfile",
  },

  -- Jenkins
  {
    "martinda/Jenkinsfile-vim-syntax",
    ft = "Jenkinsfile",
  },

  -- Security scanning integrations
  -- Note: plantuml.nvim removed due to git-lfs dependency issues
  -- If needed, install git-lfs first: brew install git-lfs

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- REST client (temporarily disabled to prevent build issues)
  -- Uncomment when needed: rest.nvim requires luarocks and builds on install
  -- {
  --   "rest-nvim/rest.nvim",
  --   ft = "http",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("rest-nvim").setup({
  --       result_split_horizontal = false,
  --       result_split_in_place = false,
  --       skip_ssl_verification = false,
  --       encode_url = true,
  --       highlight = {
  --         enabled = true,
  --         timeout = 150,
  --       },
  --     })
  --   end,
  -- },

  -- YAML companion (K8s schema validation)
  {
    "someone-stole-my-name/yaml-companion.nvim",
    ft = "yaml",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
    end,
  },

  -- Database client
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  -- Better quickfix
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },

  -- Terminal enhancement
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = { "<c-\\>" }, -- Only load when key is pressed
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_terminals = true,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
      })
    end,
  },

  -- GitHub Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        panel = { enabled = false },
      })
    end,
  },

  -- Color schemes
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
        },
      })
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  -- Indent guides (version 3 compatible)
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope = { enabled = false },
      })
    end,
  },
}
