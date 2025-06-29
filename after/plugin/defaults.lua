-- Additions own

vim.cmd 'source ~/.config/nvim/after/plugin/neovide.vim'

--vim.o.expandtab = true
--vim.o.tabstop = 2
--vim.o.shiftwidth = 2

-- Status bar at the bottm showing the current status
vim.o.laststatus = 3

--vim.o.relativenumber = true -- set relative numbered lines
vim.o.spell = false
vim.o.spelllang = 'nl,en_us'
vim.o.title = true

vim.g['netrw_keepdir'] = 1
vim.g['netrw_banner'] = 0
vim.g['netrw_liststyle'] = 3

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local term_opts = { silent = true }

-- Terminal --

vim.cmd [[ autocmd BufWinEnter,WinEnter term://* startinsert ]]
vim.cmd [[ autocmd TermOpen * startinsert ]]

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new { cmd = 'lazygit', direction = 'float', displayname = 'LazyGit', hidden = true }

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })

--keymap('n', '<leader>t', ':20 split | termi<cr>', opts)

-- Show explorer
--keymap('n', '<leader>f', ':Lex 30<cr>', opts)

-- move lines
-- Normal-mode commands
keymap('n', '<C-S-j>', ':m .+1<CR>==', opts)
keymap('n', '<C-S-k>', ':m .-2<CR>==', opts)

-- Insert-mode commands
keymap('i', '<C-S-j>', '<Esc>:m .+1<CR>==gi', opts)
keymap('i', '<C-S-k>', '<Esc>:m .-2<CR>==gi', opts)

-- Visual-mode commands
keymap('v', '<C-S-j>', ":m '>+1<CR>gv=gv", opts)
keymap('v', '<C-S-k>', ":m '<-2<CR>gv=gv", opts)

--end move line

-- keymap("n", "<S-b>", ":resize -2<CR>", opts)
-- keymap("n", "<S-n>", ":resize +2<CR>", opts)
-- keymap("n", "<S-v>", ":vertical resize +2<CR>", opts)
-- keymap("n", "<S-m>", ":vertical resize -2<CR>", opts)

-- Tree sitter

-- Telscope keymap
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').git_status, { desc = '[S]earch Git [S]tatus' })

--vim.keymap.set('n', '<leader>rf', vim.lsp.buf.format, { desc = '[R]un [F]ormat' })

vim.cmd [[colorscheme nordfox]]

--- End Additions of my own
