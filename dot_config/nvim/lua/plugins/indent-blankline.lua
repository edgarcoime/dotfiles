-- Blank line
return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    scope = {
      exclude = {
        language = {
          'python',
        },
      },
    },
  },
}
