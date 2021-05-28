


function Event_on_configuration_changed()
	local Time = global.dyworld.game_stats.time_stamp
	if (global.dyworld and global.dyworld.story and global.dyworld.story.act) then
		global.dyworld.story = Story_Add(global.dyworld.story.act, global.dyworld.story.phase, false, 1, 1)
	end
	PlayerPrint("Update for DyWorld-Dynamics detected. Updating Story. Objectives reset. Migrated from version: "..global.dyworld.version.." to version: "..Version_Build)
	global.dyworld.version = Version_Build
	
	Reunlock_Recipes()
	
	for k,v in pairs(global.dyworld.research_done) do
		if game.forces.player.technologies[v].researched then
			game.forces.player.technologies[v].researched = false
			game.forces.player.technologies[v].researched = true
		end
	end
end