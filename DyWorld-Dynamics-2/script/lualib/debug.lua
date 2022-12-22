


function DyWorld_debug(str)
local Time = "[color=red]["..global.dyworld.time.log.."][/color]"
local DyWorld = Time.." - [color=red]DyWorld-Dynamics-2:[/color] "
	if not global.debug then global.debug = {} end
	table.insert(global.debug, (Time.." = "..str))
	if debugger then
		game.players[1].print(DyWorld..str)
	end
end
