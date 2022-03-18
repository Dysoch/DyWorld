


function debug(str)
local Time = global.dyworld.game_stats.time_stamp
local DyWorld = "DyWorld-Dynamics: "
	if not global.debug then global.debug = {} end
	table.insert(global.debug, (Time.." = "..str))
	if debugger then
		AllPlayersPrint(Time.." = "..str)
	end
end
