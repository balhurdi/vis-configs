require('vis')
require('io')

local fzf_command = 'fzf'
local fzf_args = "--style full --preview 'cat {}' --bind 'focus:transform-header:file --brief {}'"
local key_bind = '<C-p>'

vis:map(vis.modes.NORMAL, key_bind, function(keys)
	local file = io.popen(fzf_command .. ' ' .. fzf_args)
	local output = file:read()
    local success, msg, status = file:close()
	
    if status == 0 then 
        vis:command(string.format(":e '%s'", output))
    elseif status == 1 then
        vis:info(string.format("fzf-open: No match. Command %s exited with return value %i." , command, status))
    elseif status == 2 then
        vis:info(string.format("fzf-open: Error. Command %s exited with return value %i." , command, status))
    elseif status == 130 then
        vis:info(string.format("fzf-open: Interrupted. Command %s exited with return value %i" , command, status))
    else
        vis:info(string.format("fzf-open: Unknown exit status %i. command %s exited with return value %i" , status, command, status, status))
    end

	vis:feedkeys("<vis-redraw>")
	return true
end)
