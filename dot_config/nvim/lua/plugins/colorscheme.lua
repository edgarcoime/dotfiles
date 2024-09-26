return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'catppuccin'
  end,
  opts = {
    flavour = 'mocha',
    -- WARN: is integrations even needed? looks like plugins automatically detect
    integrations = {},
  },
}
