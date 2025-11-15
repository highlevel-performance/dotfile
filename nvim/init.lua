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

-- Load keymaps and autocmds after lazy setup
require("config.keymaps")
require("config.autocmds")
