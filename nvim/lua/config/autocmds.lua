-- ================================
-- Autocmds Configuration
-- ================================

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General Settings
local general = augroup("General", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
  group = general,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Remove whitespace on save
autocmd("BufWritePre", {
  group = general,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Don't auto comment new lines
autocmd("BufEnter", {
  group = general,
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- Restore cursor position
autocmd("BufReadPost", {
  group = general,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- DevSecOps File Types
local devsecops = augroup("DevSecOps", { clear = true })

-- Dockerfile
autocmd("FileType", {
  group = devsecops,
  pattern = { "dockerfile", "Dockerfile" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- YAML (Kubernetes, Ansible, etc.)
autocmd("FileType", {
  group = devsecops,
  pattern = "yaml",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

-- Terraform
autocmd("FileType", {
  group = devsecops,
  pattern = "terraform",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

-- Shell scripts
autocmd("FileType", {
  group = devsecops,
  pattern = { "sh", "bash", "zsh" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

-- Python
autocmd("FileType", {
  group = devsecops,
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})

-- Go
autocmd("FileType", {
  group = devsecops,
  pattern = "go",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = false
  end,
})

-- Auto format on save for specific file types
autocmd("BufWritePre", {
  group = devsecops,
  pattern = { "*.tf", "*.py", "*.go", "*.rs", "*.js", "*.ts", "*.lua" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Terminal settings
local terminal = augroup("Terminal", { clear = true })

autocmd("TermOpen", {
  group = terminal,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert")
  end,
})

-- Check for external file changes
autocmd({ "FocusGained", "BufEnter" }, {
  group = general,
  command = "checktime",
})

-- Security: Alert on suspicious files
autocmd("BufRead", {
  group = devsecops,
  pattern = { "*.pem", "*.key", "*secret*", "*password*", "*.env" },
  callback = function()
    vim.notify("⚠️  Sensitive file detected! Be careful.", vim.log.levels.WARN)
  end,
})
