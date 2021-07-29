


function Event_on_configuration_changed()
	local Time = global.dyworld.game_stats.time_stamp
	if (global.dyworld and global.dyworld.story and global.dyworld.story.act) then
		Story_Migrate(global.dyworld.story.act, global.dyworld.story.phase)
	end
	PlayerPrint("Update for DyWorld-Dynamics detected. Updating Story. Objectives reset. Migrated from version: "..global.dyworld.version.." to version: "..Version_Build)
	
	if global.dyworld.version == "0.7.99" then
		global.dyworld.game_stats.story_pause = false
	end

	global.dyworld.version = Version_Build
	
	if game.players and game.players[1] then
		for k,v in pairs(game.players) do
			v.force.reset_technology_effects()
			Dy_update_overhead_buttons(game.players[v.index])
		end
	end
	
	for k,v in pairs(game.forces.player.technologies) do
		if v.researched then
			Story_Objectives_Research(v.name)
		end
	end
	
	Reunlock_Recipes()
	Repopulate_Side_Objectives_Table()
end