require('vis')

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win) -- luacheck: no unused args
	win.options.numbers = true
	win.options.tabwidth = 4
	win.options.showtabs = false
end)
