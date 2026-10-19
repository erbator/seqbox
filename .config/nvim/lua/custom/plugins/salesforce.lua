return {
  'xixiaofinland/sf.nvim',

  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'ibhagwan/fzf-lua',
  },

  config = function()
    require('sf').setup()

    local jar = vim.fn.expand '~/.local/share/nvim/mason/packages/apex-language-server/extension/dist/apex-jorje-lsp.jar'

    vim.lsp.config['apex_ls'] = {
      cmd = { 'java', '-jar', jar, '-data', '/tmp/apex-workspace' },
      filetypes = { 'apex', 'apexcode', 'cls', 'trigger' },
      root_dir = vim.fs.dirname(vim.fs.find({ 'sfdx-project.json', '.git' }, { upward = true })[1]),
      settings = {
        apex = { telemetry = { enable = false } },
      },
    }

    -- Optionally start immediately for this buffer if filetype matches
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'apex', 'apexcode', 'cls', 'trigger' },
      callback = function()
        vim.lsp.enable 'apex_ls'
      end,
    })
  end,
}
