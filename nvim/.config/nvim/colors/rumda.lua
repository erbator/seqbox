-- rumda: follows the desktop flavour + light/dark mode (~/.cache/rumda-{flavour,theme}),
-- same palette as kitty, GTK and rofi. theme.sh sends SIGUSR1 so open nvims recolor.

local function read(name, default)
  local f = io.open(vim.fn.expand('~/.cache/rumda-' .. name))
  local value = f and f:read 'l' or default
  if f then f:close() end
  return value
end

local ansi = {
  red = '#be100e', green = '#858162', yellow = '#d08b30', blue = '#426a79',
  magenta = '#97522c', cyan = '#989a9c', grey = '#968c83',
}

local palettes = {
  light = { bg = '#F5DCC6', alt = '#EDD0B6', sel = '#E6C0A1', fg = '#45373c', dim = '#968c83', accent = '#97522c', border = '#c47c4f' },
  dark  = { bg = '#1C1612', alt = '#2b221a', sel = '#3d2e21', fg = '#f0c997', dim = '#968c83', accent = '#d68e60', border = '#784d37' },
  warm  = { bg = '#F0C997', alt = '#f0bb90', sel = '#dba380', fg = '#4E2E1F', dim = '#a87358', accent = '#a1694d', border = '#c47c4f' },
}

local mode = read('theme', 'light') == 'dark' and 'dark' or 'light'
local p = palettes[read('flavour', 'main') == 'warm' and 'warm' or mode]
local c = setmetatable(vim.deepcopy(ansi), { __index = p })

vim.cmd 'highlight clear'
vim.g.colors_name = 'rumda'
vim.o.background = mode

local hl = function(group, spec) vim.api.nvim_set_hl(0, group, spec) end

-- editor (Normal stays transparent so kitty's matching background shows through)
hl('Normal', { fg = c.fg })
hl('NormalNC', { fg = c.fg })
hl('NormalFloat', { fg = c.fg, bg = c.alt })
hl('FloatBorder', { fg = c.border, bg = c.alt })
hl('FloatTitle', { fg = c.accent, bg = c.alt, bold = true })
hl('Cursor', { fg = c.bg, bg = c.accent })
hl('CursorLine', { bg = c.alt })
hl('CursorLineNr', { fg = c.accent, bold = true })
hl('LineNr', { fg = c.dim })
hl('SignColumn', {})
hl('ColorColumn', { bg = c.alt })
hl('Visual', { bg = c.sel })
hl('Search', { fg = c.bg, bg = c.yellow })
hl('IncSearch', { fg = c.bg, bg = c.accent })
hl('CurSearch', { link = 'IncSearch' })
hl('MatchParen', { fg = c.accent, bold = true, underline = true })
hl('Pmenu', { fg = c.fg, bg = c.alt })
hl('PmenuSel', { fg = c.accent, bg = c.sel, bold = true })
hl('PmenuSbar', { bg = c.alt })
hl('PmenuThumb', { bg = c.border })
hl('StatusLine', { fg = c.fg, bg = c.alt })
hl('StatusLineNC', { fg = c.dim, bg = c.alt })
hl('TabLine', { fg = c.dim, bg = c.alt })
hl('TabLineSel', { fg = c.accent, bg = c.bg, bold = true })
hl('TabLineFill', { bg = c.alt })
hl('WinSeparator', { fg = c.border })
hl('VertSplit', { link = 'WinSeparator' })
hl('Folded', { fg = c.dim, bg = c.alt })
hl('NonText', { fg = c.sel })
hl('Whitespace', { fg = c.sel })
hl('EndOfBuffer', { fg = c.sel })
hl('Directory', { fg = c.blue })
hl('Title', { fg = c.accent, bold = true })
hl('ErrorMsg', { fg = c.red })
hl('WarningMsg', { fg = c.yellow })
hl('MoreMsg', { fg = c.green })
hl('Question', { fg = c.blue })
hl('ModeMsg', { fg = c.accent, bold = true })
hl('WildMenu', { link = 'PmenuSel' })

-- syntax
hl('Comment', { fg = c.dim })
hl('Constant', { fg = c.red })
hl('String', { fg = c.green })
hl('Character', { link = 'String' })
hl('Number', { fg = c.yellow })
hl('Boolean', { fg = c.yellow })
hl('Float', { link = 'Number' })
hl('Identifier', { fg = c.fg })
hl('Function', { fg = c.blue })
hl('Statement', { fg = c.magenta })
hl('Keyword', { fg = c.magenta, bold = true })
hl('Conditional', { link = 'Keyword' })
hl('Repeat', { link = 'Keyword' })
hl('Operator', { fg = c.accent })
hl('Exception', { fg = c.red })
hl('PreProc', { fg = c.accent })
hl('Include', { fg = c.magenta })
hl('Type', { fg = c.yellow })
hl('StorageClass', { fg = c.magenta })
hl('Structure', { fg = c.yellow })
hl('Special', { fg = c.accent })
hl('Delimiter', { fg = c.dim })
hl('Tag', { fg = c.blue })
hl('Underlined', { underline = true })
hl('Todo', { fg = c.bg, bg = c.yellow, bold = true })
hl('Error', { fg = c.red })

-- tree-sitter
hl('@variable', { fg = c.fg })
hl('@variable.builtin', { fg = c.red })
hl('@variable.parameter', { fg = c.fg })
hl('@variable.member', { fg = c.fg })
hl('@property', { fg = c.fg })
hl('@constant', { link = 'Constant' })
hl('@constant.builtin', { fg = c.red, bold = true })
hl('@module', { fg = c.yellow })
hl('@string', { link = 'String' })
hl('@string.escape', { fg = c.accent })
hl('@string.special', { fg = c.accent })
hl('@function', { link = 'Function' })
hl('@function.builtin', { fg = c.blue })
hl('@function.method', { link = 'Function' })
hl('@constructor', { fg = c.yellow })
hl('@keyword', { link = 'Keyword' })
hl('@keyword.return', { fg = c.magenta, bold = true })
hl('@type', { link = 'Type' })
hl('@type.builtin', { fg = c.yellow })
hl('@punctuation', { fg = c.dim })
hl('@tag', { link = 'Tag' })
hl('@tag.attribute', { fg = c.yellow })
hl('@tag.delimiter', { fg = c.dim })
hl('@markup.heading', { fg = c.accent, bold = true })
hl('@markup.link', { fg = c.blue, underline = true })
hl('@markup.raw', { fg = c.green })
hl('@markup.strong', { bold = true })
hl('@markup.italic', { italic = true })

-- diagnostics + diffs
hl('DiagnosticError', { fg = c.red })
hl('DiagnosticWarn', { fg = c.yellow })
hl('DiagnosticInfo', { fg = c.blue })
hl('DiagnosticHint', { fg = c.green })
hl('DiagnosticUnderlineError', { undercurl = true, sp = c.red })
hl('DiagnosticUnderlineWarn', { undercurl = true, sp = c.yellow })
hl('DiagnosticUnderlineInfo', { undercurl = true, sp = c.blue })
hl('DiagnosticUnderlineHint', { undercurl = true, sp = c.green })
hl('LspReferenceText', { bg = c.sel })
hl('LspReferenceRead', { bg = c.sel })
hl('LspReferenceWrite', { bg = c.sel, bold = true })
hl('DiffAdd', { fg = c.green })
hl('DiffChange', { fg = c.yellow })
hl('DiffDelete', { fg = c.red })
hl('DiffText', { fg = c.bg, bg = c.yellow })
hl('Added', { link = 'DiffAdd' })
hl('Changed', { link = 'DiffChange' })
hl('Removed', { link = 'DiffDelete' })

-- plugins used by this config
hl('MiniStatuslineModeNormal', { fg = c.bg, bg = c.accent, bold = true })
hl('MiniStatuslineModeInsert', { fg = c.bg, bg = c.green, bold = true })
hl('MiniStatuslineModeVisual', { fg = c.bg, bg = c.yellow, bold = true })
hl('MiniStatuslineModeReplace', { fg = c.bg, bg = c.red, bold = true })
hl('MiniStatuslineModeCommand', { fg = c.bg, bg = c.blue, bold = true })
hl('MiniStatuslineModeOther', { fg = c.bg, bg = c.dim, bold = true })
hl('MiniStatuslineDevinfo', { fg = c.fg, bg = c.sel })
hl('MiniStatuslineFilename', { fg = c.fg, bg = c.alt })
hl('MiniStatuslineFileinfo', { fg = c.fg, bg = c.sel })
hl('MiniStatuslineInactive', { fg = c.dim, bg = c.alt })
hl('TelescopeNormal', { link = 'NormalFloat' })
hl('TelescopeBorder', { link = 'FloatBorder' })
hl('TelescopeTitle', { link = 'FloatTitle' })
hl('TelescopeSelection', { fg = c.accent, bg = c.sel, bold = true })
hl('TelescopeMatching', { fg = c.accent, bold = true })
hl('NeoTreeNormal', { fg = c.fg })
hl('NeoTreeNormalNC', { fg = c.fg })
hl('NeoTreeDirectoryIcon', { fg = c.accent })
hl('NeoTreeDirectoryName', { fg = c.fg })
hl('NeoTreeRootName', { fg = c.accent, bold = true })
hl('NeoTreeGitModified', { fg = c.yellow })
hl('NeoTreeGitAdded', { fg = c.green })
hl('NeoTreeGitUntracked', { fg = c.dim })
hl('IblIndent', { fg = c.sel, nocombine = true })
hl('IblScope', { fg = c.border, nocombine = true })
hl('BlinkCmpMenu', { link = 'Pmenu' })
hl('BlinkCmpMenuBorder', { link = 'FloatBorder' })
hl('BlinkCmpMenuSelection', { link = 'PmenuSel' })

-- terminal buffers use the same 16 colors as kitty
local term = { '#20111b', c.red, c.green, c.yellow, c.blue, c.magenta, c.cyan, c.grey,
               '#5e5252', c.red, c.green, c.yellow, c.blue, c.magenta, c.cyan, '#F5DCC6' }
for i, color in ipairs(term) do vim.g['terminal_color_' .. (i - 1)] = color end
