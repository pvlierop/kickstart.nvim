return function(use)
 -- Debugging
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use 'mfussenegger/nvim-dap-python'
  use 'leoluz/nvim-dap-go'

  -- diffview
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  -- nvim web devicons
  use 'kyazdani42/nvim-web-devicons'
end
