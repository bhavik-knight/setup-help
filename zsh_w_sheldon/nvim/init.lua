-- ==========================================================================
-- 1. YOUR CORE EDITING SETTINGS
-- ==========================================================================
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.laststatus = 3
vim.opt.cursorline = true
vim.opt.foldenable = true
vim.opt.showmode = true
vim.opt.showcmd = true

-- ==========================================================================
-- 2. THE MODERN THEME ENGINE SETUP
-- ==========================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "Mofiqul/dracula.nvim",
    priority = 1000,
    config = function()
      local dracula = require("dracula")
      dracula.setup({
        transparent_bg = true, -- Keeps your subtle Kitty transparent layout alive
      })
      vim.cmd.colorscheme("dracula")
    end
  }
})

