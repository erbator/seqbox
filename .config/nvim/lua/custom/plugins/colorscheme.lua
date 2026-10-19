-- No colorscheme plugin: colors/rumda.lua follows the desktop's rumda theme.
vim.cmd.colorscheme 'rumda'

-- theme.sh sends SIGUSR1 when the flavour or light/dark mode changes
vim.api.nvim_create_autocmd('Signal', {
  pattern = 'SIGUSR1',
  callback = function() if vim.g.colors_name == 'rumda' then vim.cmd.colorscheme 'rumda' end end,
})

return {}
