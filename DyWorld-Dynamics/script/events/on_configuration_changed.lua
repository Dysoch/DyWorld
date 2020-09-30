


function Event_on_configuration_changed()
	if (global.dyworld and global.dyworld.story and global.dyworld.story.act) then
		global.dyworld.story = Story_Add(global.dyworld.story.act, global.dyworld.story.phase, false, 1, 1)
	end
	PlayerPrint("Updated DyWorld-Dynamics Build detected. Updating Story. Objectives reset. Migrated from version: "..global.dyworld.version.." to version: "..Version_Build)
	global.dyworld.version = Version_Build
	
	Reunlock_Recipes()
	
	for k,v in pairs(game.forces.player.technologies) do
		if v.researched then
			v.researched = false
			v.researched = true
		end
	end
	if remote.interfaces["silo_script"] then
		remote.call("silo_script", "set_no_victory", true)
		local tracked_items = remote.call("silo_script", "get_tracked_items")
		if not tracked_items["asteroid-miner-iron"] then
			remote.call("silo_script", "add_tracked_item", "asteroid-miner-iron")
		end
		if not tracked_items["asteroid-miner-tin"] then
			remote.call("silo_script", "add_tracked_item", "asteroid-miner-tin")
		end
		if not tracked_items["asteroid-miner-copper"] then
			remote.call("silo_script", "add_tracked_item", "asteroid-miner-copper")
		end
	end
end