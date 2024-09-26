return {
  'folke/trouble.nvim',
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble',
  keys = {
    {
      '<leader>dx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Trouble: [D]iag... Toggle [X]',
    },
    {
      '<leader>dX',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Trouble: [D]iag... Buffer [X]',
    },
    {
      '<leader>ds',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Trouble: [D]iag... [S]ymbols',
    },
    {
      '<leader>dl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'Trouble: [D]iag... [L]SP Definitions / references / ... ',
    },
    {
      '<leader>dL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Trouble: [D]iag... [L]ocation List',
    },
    {
      '<leader>dQ',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Trouble: [D]iag... [Q]uickfix List',
    },
  },
}
