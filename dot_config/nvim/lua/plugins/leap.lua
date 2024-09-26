-- Leap motions to easily navigate document
return {
  'ggandor/leap.nvim',
  config = function(plugin, opts)
    require('leap').add_default_mappings()
  end,
  event = 'BufEnter',
}
