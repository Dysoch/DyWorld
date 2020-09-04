
script.on_event("DyWorld_Menu", function(event)
local id = event.player_index
local player = game.players[id]
	--debug("Player "..id..": pressed DyWorld_Menu")
	--Main_GUI(player, id)
	if global.dyworld.players[id].story_gui then
		global.dyworld.players[id].story_gui = false
		Close_Story_GUI(player, id)
	end
	if global.dyworld.players[id].stats_gui then
		global.dyworld.players[id].stats_gui = false
		Close_Main_GUI(player, id)
	else 
		global.dyworld.players[id].stats_gui = true
		Main_GUI(player, id)
	end
end)

script.on_event("DyWorld_Story", function(event)
local id = event.player_index
local player = game.players[id]
	--debug("Player "..id..": pressed DyWorld_Story")
	--Story_GUI(player, id)
	if global.dyworld.players[id].stats_gui then
		global.dyworld.players[id].stats_gui = false
		Close_Main_GUI(player, id)
	end
	if global.dyworld.players[id].story_gui then
		global.dyworld.players[id].story_gui = false
		Close_Story_GUI(player, id)
	else 
		global.dyworld.players[id].story_gui = true
		Story_GUI(player, id)
	end
end)