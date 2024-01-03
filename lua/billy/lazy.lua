local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    "nvim-lua/plenary.nvim", -- lua functions that many plugins use
    "christoomey/vim-tmux-navigator", -- tmux & split window navigation
    "inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
    { import = "billy.plugins.lsp" },
    { import = "billy.plugins" },
  },
  install = {
    colorscheme = { "darkplus" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
