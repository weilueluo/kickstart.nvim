local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- make sure mapleader is setup before loading lazy.nvim so that mappings are correct
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- setup lazy.nvim
require('lazy').setup {
  spec = {
    -- import plugins
    { import = 'plugins' },
  },
  -- other settings here...
  -- colorscheme used when installing plugins
  install = { colorscheme = { 'habamax' } },
  -- auto check plugins update
  checker = { enabled = true },
}
