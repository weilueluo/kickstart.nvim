
vim.opt.number = true
vim.opt.relativenumber = true
-- enable mouse
vim.opt.mouse = 'a'
-- do not show mode since it is already done in status line
vim.opt.showmode = false
-- sync clipboard between os and vim, do it after 'UiEnter' as it can increase startup time
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)
-- multiline lines are indented starting from second line
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
-- min lines to show, up and down of current cursor
vim.opt.scrolloff = 10

-- keymaps
-- clear highlights on search when pressed esc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- easier way to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })


require 'config.lazy'
