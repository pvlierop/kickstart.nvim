-- File: lua/custom/plugins/nvim-web-devicons.lua

return {
  "kyazdani42/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup {
      color_icons = true,
      default = true,
    }
  end,
}
