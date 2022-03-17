require("script.events.on_init")
require("script.story.story")

function One_Time_Migration()
    if not global.dyworld.migrations then global.dyworld.migrations = {} end
end

function Event_on_configuration_changed()
	local Time = global.dyworld.game_stats.time_stamp

	AllPlayersPrint("[color=blue]DyWorld-Dynamics:[/color] [color=yellow]New mod configuration detected. Updating Story (to be safe). Migrated from version: [/color][color=blue]"..global.dyworld.version.."[/color][color=yellow] to version: [/color][color=blue]"..Version_Build.."[/color]")
	global.dyworld.version = Version_Build

	-- Make sure all of our variables exist in our global struct
	FixupDyworldStruct()

    -- Checks every Migration. These are single changes, done to ensure migrated scripts
	if Version_Build ~= global.dyworld.version then
		One_Time_Migration()
	end
	
    -- Checks every Migration. Done to ensure new buttons and changes will be done
	if game.players and game.players[1] then
		for k,v in pairs(game.players) do
			v.force.reset_technology_effects()
			Dy_update_overhead_buttons(game.players[v.index])
		end
	end
    
    -- Migrate the story to new version. Changes all above the current phase/act to its new database
	Story_Migrate(global.dyworld.story.act, global.dyworld.story.phase)
	
    -- Checks every Migration. Done to ensure new technologies are searched against story
	for k,v in pairs(game.forces.player.technologies) do
		if v.researched then
			Story_Objectives_Research(v.name)
		end
	end
	
    -- Checks every Migration. Done to ensure new recipes and changes will be unlocked
	FixupUnlockedStoryTechnologies()
	Repopulate_Side_Objectives_Table()
	remote.call("DyWorld", "Fix_Research")
end
