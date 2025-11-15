-- ================================
-- LazyVim Configuration Overrides
-- ================================

-- Prevent LazyVim from showing lazy UI automatically
-- This file is loaded by LazyVim to override default behavior

-- Disable pending tasks flag
vim.g.lazyvim_pending_tasks = false

-- Override lazy.nvim's open function IMMEDIATELY
-- This must run before LazyVim checks for pending tasks
vim.schedule(function()
  local lazy = require("lazy")
  if lazy and lazy.open then
    local original_open = lazy.open
    lazy.open = function(opts)
      -- Only show UI if explicitly requested
      if opts and opts.show == true then
        return original_open(opts)
      end
      -- Don't show UI automatically
      return nil
    end
  end
end)

-- Override on LazyVimStarted to ensure it stays disabled
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    -- Ensure open function is still overridden
    local lazy = require("lazy")
    if lazy and lazy.open then
      local original_open = lazy.open
      lazy.open = function(opts)
        if opts and opts.show == true then
          return original_open(opts)
        end
        return nil
      end
    end
    
    -- Install missing plugins silently
    local stats = lazy.stats()
    if stats.missing > 0 then
      lazy.install({ wait = false, show = false })
    end
  end,
  once = true,
})

