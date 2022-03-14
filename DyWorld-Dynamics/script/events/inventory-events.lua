
function Event_on_player_inventory_changed(event)
	if not game.players[event.player_index].cheat_mode then
		if global.dyworld_story and not global.dyworld.game_stats.story_pause then
			----- Story Objective Check -----
			AllPlayersPrint("Event_on_player_inventory_changed")
			Story_Objectives("looted-item", event)
		end
	end
end
