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

-- Prevent lazy UI from opening automatically on startup
-- Override lazy.nvim to not show UI automatically
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    -- Clear any pending tasks that might trigger UI
    vim.g.lazyvim_pending_tasks = false
  end,
  once = true,
})

-- Install plugins silently in background without showing UI
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    local lazy = require("lazy")
    local stats = lazy.stats()
    if stats.missing > 0 or stats.new > 0 then
      -- Install/update plugins silently in background
      vim.schedule(function()
        lazy.install({ wait = false, show = false })
      end)
    end
  end,
  once = true,
})

-- Override LazyVim's function that shows lazy UI on pending tasks
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Prevent LazyVim from showing lazy UI automatically
    local lazyvim = package.loaded["lazyvim"]
    if lazyvim then
      -- Override any function that might show the UI
      vim.g.lazyvim_pending_tasks = false
    end
  end,
  once = true,
})

-- Load keymaps and autocmds after lazy setup
require("config.keymaps")
require("config.autocmds")
