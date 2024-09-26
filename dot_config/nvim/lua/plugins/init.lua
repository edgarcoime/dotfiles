return {
  'nvim-lua/plenary.nvim', -- lua functions that many plugins use

  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  --  This is equivalent to:
  --    require('Comment').setup({})
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Auto pairing
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
}
