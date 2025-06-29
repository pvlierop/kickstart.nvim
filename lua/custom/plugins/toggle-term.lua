-- File: lua/custom/plugins/toggle-term.lua

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {},
  -- SIngle \ is eccaped here
  keys = {
    { '<leader>`', ':ToggleTerm size=20 name=Terminal <CR>', desc = 'ToggleTerm ', silent = true },
  },
}
