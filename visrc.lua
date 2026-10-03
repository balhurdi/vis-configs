require('vis')
require('third-party/vis-fzf-open')

local lspc = require('third-party/vis-lspc')

lspc.universal_root_globs = {'.git'}
lspc.ls_map.c.formatting_options = {tabSize = 4, insertSpaces = false}
lspc.ls_map.lua = {
	name = 'lua-language-server',
	cmd = 'lua-language-server',
	roots = {'.luarc.json', '.git'},
	settings = {
		Lua = {
			diagnostics = {globals = {'vis'}},
			telemetry = {enable = false},
			workspace = {checkThirdParty = false},
		},
	},
	formatting_options = {tabSize = 4, insertSpaces = false},
}

vis.events.subscribe(vis.events.INIT, function()	
	require('third-party/vis-colors/wryan')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win) -- luacheck: no unused args
	win.options.numbers = true
	win.options.tabwidth = 4
	win.options.showtabs = false
end)
