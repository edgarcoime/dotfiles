return {
  -- other plugins
  {
    'zbirenbaum/copilot-cmp',
    event = { 'BufRead', 'BufNewFile', 'InsertEnter' },
    config = function()
      require('copilot_cmp').setup()
    end,
    dependencies = {
      'zbirenbaum/copilot.lua',
      cmd = 'Copilot',
      enabled = true,
      config = function()
        require('copilot').setup {
          suggestion = { enabled = false },
          panel = { enabled = false },
        }
      end,
    },
  },
}
