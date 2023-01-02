-- Additions own

vim.cmd [[
  augroup filetypedetect
      autocmd BufRead,BufNewFile Jenkinsfile set filetype=groovy
  augroup END
]]

vim.cmd('source ~/.config/nvim/after/plugin/neovide.vim')

vim.o.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.laststatus = 3

vim.o.splitbelow = true -- force all horizontal splits to go below current window
vim.o.splitright = true -- force all vertical splits to go to the right of current window
vim.o.cursorline = true
vim.o.relativenumber = true -- set relative numbered lines
vim.o.spell = false
vim.o.spelllang = "nl,en_us"
vim.o.title = true

vim.g['netrw_keepdir'] = 1
vim.g['netrw_banner'] = 0

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local term_opts = { silent = true }

-- Terminal --
keymap("t", "<C-e>", "<C-\\><C-n>", term_opts)

keymap('n', '<leader>f', ':Lex 30<cr>', opts)

-- Resize with arrows
-- keymap("n", "<C-j>", ":resize -2<CR>", opts)
-- keymap("n", "<C-k>", ":resize +2<CR>", opts)
-- keymap("n", "<C-l>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-h>", ":vertical resize +2<CR>", opts)

-- nnoremap <silent> <C-Up> :resize +3<CR>
-- nnoremap <silent> <C-Down> :resize -3<CR>
-- nnoremap <silent> <C-Left> :vertical resize +2<CR>
-- nnoremap <silent> <C-Right> :vertical resize -2<CR>
--

keymap("n", "<S-b>", ":resize -2<CR>", opts)
keymap("n", "<S-n>", ":resize +2<CR>", opts)
keymap("n", "<S-v>", ":vertical resize +2<CR>", opts)
keymap("n", "<S-m>", ":vertical resize -2<CR>", opts)

-- Tree sitter
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help', 'hcl', 'vim', 'java','terraform' },
}
-- LSP Settings
-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
local servers = { 'pyright', 'tsserver', 'sumneko_lua', 'gopls', 'terraformls', 'tflint', 'jdtls' }

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
}


-- Telscope keymap
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').git_status, { desc = '[S]earch Git [S]tatus' })
vim.keymap.set('n', 'gf', vim.lsp.buf.format, { desc = '[G]o [F]ormat'})

-- Lualine

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
--    globalstatus=true
  },
}

-- Debugging setup
require('dap-python').setup('~/pythonprojects/debugpy/bin/python')

require('dap-go').setup {
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
  -- delve configurations
  delve = {
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port
    port = "${port}"
  },
}

require("dapui").setup({
  icons = { expanded = "", collapsed = "", current_frame = "" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Use this to override mappings for specific elements
  element_mappings = {
    -- Example:
    -- stacks = {
    --   open = "<CR>",
    --   expand = "o",
    -- }
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7") == 1,
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "",
      terminate = "",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})

-- debugging keymaps

vim.keymap.set('n', '<F5>', ':lua require("dap").continue()<CR>', { desc = 'Continue' })
vim.keymap.set('n', '<F6>', ':lua require("dap").step_over()<CR>', { desc = 'Step Over' })
vim.keymap.set('n', '<F7>', ':lua require("dap").step_into()<CR>', { desc = 'Step Into' })
vim.keymap.set('n', '<F8>', ':lua require("dap").step_out()()<CR>', { desc = 'Step Out' })
vim.keymap.set('n', '<leader>b', ':lua require("dap").toggle_breakpoint()<CR>', { desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<leader>B', ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
  { desc = 'Breakpoint Condition' })
vim.keymap.set('n', '<leader>n', ':lua require("dapui").toggle()<CR>', { desc = 'Toggle Debug UI' })

--- End Additions of my own
