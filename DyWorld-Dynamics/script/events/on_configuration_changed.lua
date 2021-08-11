
function One_Time_Migration()
    if not global.dyworld.migrations then global.dyworld.migrations = {} end
    -- Reset implants for dev builds
    if not global.dyworld.migrations.Reset_Implants then
	    remote.call("DyWorld", "Reset_Implants")
        global.dyworld.migrations.Reset_Implants = true
        debug("Migration: Implants Reset")
    end
end

function Event_on_configuration_changed()
	local Time = global.dyworld.game_stats.time_stamp
    
    -- Migrate the story to new version. Changes all above the current phase/act to its new database
	if (global.dyworld and global.dyworld.story and global.dyworld.story.act) then
		Story_Migrate(global.dyworld.story.act, global.dyworld.story.phase)
	end

    -- Checks every Migration. These are single changes, done to ensure migrated scripts
    One_Time_Migration()

	PlayerPrint("Update for DyWorld-Dynamics detected. Updating Story. Objectives reset. Migrated from version: "..global.dyworld.version.." to version: "..Version_Build)
	global.dyworld.version = Version_Build
	
    -- Checks every Migration. Done to ensure new buttons and changes will be done
	if game.players and game.players[1] then
		for k,v in pairs(game.players) do
			v.force.reset_technology_effects()
			Dy_update_overhead_buttons(game.players[v.index])
		end
	end
	
    -- Checks every Migration. Done to ensure new technologies are searched against story
	for k,v in pairs(game.forces.player.technologies) do
		if v.researched then
			Story_Objectives_Research(v.name)
		end
	end
	
    -- Checks every Migration. Done to ensure new recipes and changes will be unlocked
	Reunlock_Recipes()
	Repopulate_Side_Objectives_Table()
    if global.dyworld.game_stats.inserters then
        InserterCheck(global.dyworld.game_stats.inserters)
    end
end