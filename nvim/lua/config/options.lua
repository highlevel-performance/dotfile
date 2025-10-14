-- ================================
-- Options Configuration
-- ================================

local opt = vim.opt

-- General
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.mouse = "a" -- Enable mouse support

-- UI
opt.number = true -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.signcolumn = "yes" -- Always show sign column
opt.cursorline = true -- Highlight current line
opt.termguicolors = true -- True color support
opt.wrap = false -- Disable line wrap
opt.scrolloff = 8 -- Lines of context
opt.sidescrolloff = 8 -- Columns of context
opt.showmode = false -- Don't show mode (lualine does this)

-- Splits
opt.splitright = true -- Vertical split to the right
opt.splitbelow = true -- Horizontal split below

-- Indentation
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Size of an indent
opt.tabstop = 2 -- Number of spaces tabs count for
opt.softtabstop = 2
opt.smartindent = true -- Insert indents automatically
opt.shiftround = true -- Round indent

-- Search
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Don't ignore case with capitals
opt.hlsearch = true -- Highlight search results
opt.incsearch = true -- Incremental search

-- Files
opt.backup = false -- Don't create backup file
opt.writebackup = false
opt.swapfile = false -- Don't create swap file
opt.undofile = true -- Enable persistent undo
opt.undolevels = 10000

-- Timeout
opt.timeoutlen = 300 -- Time to wait for a mapped sequence
opt.updatetime = 200 -- Save swap file and trigger CursorHold

-- Format options
opt.formatoptions = "jcroqlnt" -- tcqj

-- Security
opt.modeline = false -- Disable modeline for security
opt.secure = true -- Secure mode for reading .vimrc in current dir

-- Performance
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight

-- Wildmenu
opt.wildmode = "longest:full,full" -- Command-line completion mode

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldenable = false

-- Spelling
opt.spelllang = { "en" }
opt.spell = false -- Disable spell check by default

-- DevSecOps specific settings
vim.g.python3_host_prog = vim.fn.exepath("python3")
