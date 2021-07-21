


function Event_on_configuration_changed()
	local Time = global.dyworld.game_stats.time_stamp
	if (global.dyworld and global.dyworld.story and global.dyworld.story.act) then
		global.dyworld.story = Story_Add(global.dyworld.story.act, global.dyworld.story.phase, false, 1, 1)
	end
	PlayerPrint("Update for DyWorld-Dynamics detected. Updating Story. Objectives reset. Migrated from version: "..global.dyworld.version.." to version: "..Version_Build)
	
	if global.dyworld.version == "0.7.99" then
		--for k,v in pairs(global.dyworld.players) do
		--end
		global.dyworld.game_stats.space_mining = {}
		for k,v in pairs(Dy_Metals) do
			global.dyworld.game_stats.space_mining[k] = {efficiency = 1, pure_rate = 0, pure_mined = 0, pure_storage = 100, impure_rate = 0, impure_mined = 0, impure_storage = 900, tier = v.Tier}
		end
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
end