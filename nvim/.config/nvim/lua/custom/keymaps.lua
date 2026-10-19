-- Clear highlights on search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Split navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to upper window' })

-- Show diagnostics in the current line
vim.keymap.set('n', '<leader>i', function()
  vim.diagnostic.open_float { scope = 'line' }
end, { desc = 'Show line diagnostics' })

-- Save Changes
vim.keymap.set('n', '<leader>w', ':update<CR>', { desc = 'Save file (update)' })
vim.keymap.set('n', '<leader>W', ':wa<CR>', { desc = 'Save all files', silent = true })

-- Resize window height
vim.keymap.set('n', '<C-=>', ':resize +2<CR>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-->', ':resize -2<CR>', { desc = 'Decrease window height' })

-- Resize window width
vim.keymap.set('n', '<C-]>', ':vertical resize +2<CR>', { desc = 'Increase window width' })
vim.keymap.set('n', '<C-[>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })

-- SalesForce workspace
vim.keymap.set('n', '<leader>Sx', ':SF term toggle<CR>', { desc = 'Toggle output terminal' })

vim.keymap.set('n', '<leader>Sto', ':SF test allTestsInOrg<CR>', { desc = 'Test everything in org' })
vim.keymap.set('n', '<leader>Stf', ':SF test allTestsInThisFile<CR>', { desc = 'Test everything in this file' })
vim.keymap.set('n', '<leader>Stc', ':SF test currentTest<CR>', { desc = 'Test current' })
vim.keymap.set('n', '<leader>Sts', ':SF test select<CR>', { desc = 'Test select' })

vim.keymap.set('n', '<leader>Scap', ':SF create apex<CR>', { desc = 'Create apex' })
vim.keymap.set('n', '<leader>Scar', ':SF create aura<CR>', { desc = 'Create aura' })
vim.keymap.set('n', '<leader>Sct', ':SF create trigger<CR>', { desc = 'Create trigger' })
vim.keymap.set('n', '<leader>Scta', ':SF create ctags<CR>', { desc = 'Create ctags' })
vim.keymap.set('n', '<leader>Sctl', ':SF create ctagsAndList<CR>', { desc = 'Create ctags and list' })
vim.keymap.set('n', '<leader>Scl', ':SF create lwc<CR>', { desc = 'Create lwc' })

vim.keymap.set('n', '<leader>Soo', ':SF org open<CR>', { desc = 'Open organization' })
vim.keymap.set('n', '<leader>Sof', ':SF org openCurrentFile<CR>', { desc = 'Open current organization file' })
vim.keymap.set('n', '<leader>Sol', ':SF org fetchList<CR>', { desc = 'Fetch organization list' })
vim.keymap.set('n', '<leader>Sop', ':SF org pullLog<CR>', { desc = 'Pull organization log' })
vim.keymap.set('n', '<leader>Sot', ':SF org setTarget<CR>', { desc = 'Set organization target' })
vim.keymap.set('n', '<leader>Sogt', ':SF org setGlobalTarget<CR>', { desc = 'Set global organization target' })

vim.keymap.set('n', '<leader>Sr', function()
  require('sf').run_anonymous()
end, { desc = 'Run anonymous SF' })

vim.keymap.set('n', '<leader>Sw', function()
  require('sf').save_and_push()
end, { desc = 'Save & deploy current file to org' })

vim.keymap.set('n', '<leader>SW', function()
  require('sf').push_delta()
end, { desc = 'Deploy modified files to org' })

vim.keymap.set('n', '<leader>Se', function()
  require('sf').retrieve()
end, { desc = 'Retrieve current file' })

vim.keymap.set('n', '<leader>SE', function()
  require('sf').retrieve_delta()
end, { desc = 'Retrieve changed files' })

vim.keymap.set('v', '<leader>Sq', function()
  require('sf').run_highlighted_soql()
end, { desc = 'Run highlighted SOQL' })
