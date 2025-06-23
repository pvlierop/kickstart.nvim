-- File: lua/custom/plugins/telescope-filebrowser.lua

return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  -- open file_browser with the path of the current buffer
  keys = {
    { '<leader>bf', ':Telescope file_browser theme=ivy path=%:p:h select_buffer=true<CR>', desc = 'Telescope file browser', silent = true },
  },
}
