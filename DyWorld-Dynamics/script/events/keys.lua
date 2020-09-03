
script.on_event("DyWorld_Menu", function(event)
local id = event.player_index
local player = game.players[id]
	--debug("Player "..id..": pressed DyWorld_Menu")
	Main_GUI(player, id)
end)

script.on_event("DyWorld_Story", function(event)
local id = event.player_index
local player = game.players[id]
	--debug("Player "..id..": pressed DyWorld_Story")
	Story_GUI(player, id)
end)