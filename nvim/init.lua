-- ================================
-- DevSecOps LazyVim Configuration
-- ================================

-- Load essential options first (before plugins) so editor is usable immediately
require("config.options")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Prevent LazyVim from showing lazy UI automatically
vim.g.lazyvim_pending_tasks = false

-- Override lazy.nvim's open function to prevent automatic UI display
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  callback = function()
    vim.schedule(function()
      local lazy = require("lazy")
      if lazy and lazy.open then
        local original_open = lazy.open
        lazy.open = function(opts)
          -- Only show UI if explicitly requested
          if opts and opts.show == true then
            return original_open(opts)
          end
          return nil
        end
      end
    end)
  end,
  once = true,
})

-- Load LazyVim with optimized settings
require("lazy").setup({
  spec = {
    -- LazyVim core
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    
    -- DevSecOps Language Support
    { import = "lazyvim.plugins.extras.lang.docker" },
    { import = "lazyvim.plugins.extras.lang.terraform" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    
    -- Editor enhancements
    { import = "lazyvim.plugins.extras.editor.telescope" },
    { import = "lazyvim.plugins.extras.editor.aerial" },
    { import = "lazyvim.plugins.extras.editor.navic" },
    
    -- UI enhancements
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
    
    -- Coding
    { import = "lazyvim.plugins.extras.coding.copilot" },
    
    -- Import custom plugins
    { import = "plugins" },
  },
  defaults = {
    lazy = true, -- Enable lazy loading for faster startup
    version = false,
  },
  install = { 
    colorscheme = { "tokyonight", "habamax" },
    missing = true, -- Auto-install missing plugins
  },
  checker = { 
    enabled = false, -- Disable startup checker (run manually with :Lazy check)
    notify = false, -- Don't notify on startup
  },
  change_detection = {
    enabled = false, -- Disable auto-check for changes (faster startup)
    notify = false,
  },
  ui = {
    -- Don't show lazy UI automatically
    backdrop = 100,
    border = "rounded",
    browser = nil, -- Disable browser
    custom_keys = nil,
    icons = {
      cmd = " ",
      config = " ",
      event = " ",
      ft = " ",
      init = " ",
      keys = " ",
      plugin = " ",
      runtime = " ",
      source = " ",
      start = " ",
      task = " ",
      lazy = " ",
    },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "netrwPlugin", -- Use neo-tree instead
      },
    },
  },
})

-- Override lazy.nvim's open function immediately after setup
vim.defer_fn(function()
  local lazy = require("lazy")
  if lazy and lazy.open then
    local original_open = lazy.open
    lazy.open = function(opts)
      -- Only show UI if explicitly requested with show=true
      if opts and opts.show == true then
        return original_open(opts)
      end
      -- Don't show UI automatically
      return nil
    end
  end
end, 50)

-- Prevent LazyVim from showing lazy UI on pending tasks
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Override LazyVim's pending tasks check
    vim.g.lazyvim_pending_tasks = false
    
    -- Install missing plugins silently in background
    vim.defer_fn(function()
      local lazy = require("lazy")
      if lazy then
        -- Ensure open function is overridden
        local original_open = lazy.open
        lazy.open = function(opts)
          if opts and opts.show == true then
            return original_open(opts)
          end
          return nil
        end
        
        -- Install missing plugins silently
        local stats = lazy.stats()
        if stats.missing > 0 then
          lazy.install({ wait = false, show = false })
        end
      end
    end, 200)
  end,
  once = true,
})

-- Load keymaps and autocmds after lazy setup
require("config.keymaps")
require("config.autocmds")

-- Load LazyVim config overrides (if it exists)
pcall(require, "config.lazyvim")
