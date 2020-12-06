


function Event_on_init()
	if not global.dyworld then
		global.dyworld = {
			version = Version_Build,
			players = {},
			research_done = {},
			game_stats = {
				ticks = 0,
				players = 0,
				chunks = 0,
				sector_scanned = 0,
				rockets_launched = 0,
				crafted_amount = 0,
				crafted_names = {},
				mined_amount = 0,
				mined_names = {},
				build_amount = 0,
				build_names = {},
				killed_amount = 0,
				killed_names = {},
				picked_amount = 0,
				picked_names = {},
				build = {},
				killed = {},
				mined = {},
				days = 0,
				attack_warning_1 = false,
				attack_warning_2 = false,
				attack_warning_3 = false,
				attack_loc_x = 0,
				attack_loc_y = 0,
				attack_loc_amount = 0,
				difficulty = 1,
				time_stamp = "",
				building_locations = {},
			},
			story = Story_Add(1, 1, false, 1, 1),
		}
	end
	Reunlock_Recipes()
	if remote.interfaces["silo_script"] then
		remote.call("silo_script", "set_no_victory", true)
		--[[local tracked_items = remote.call("silo_script", "get_tracked_items")
		if not tracked_items["asteroid-miner-iron"] then
			remote.call("silo_script", "add_tracked_item", "asteroid-miner-iron")
		end
		if not tracked_items["asteroid-miner-tin"] then
			remote.call("silo_script", "add_tracked_item", "asteroid-miner-tin")
		end
		if not tracked_items["asteroid-miner-copper"] then
			remote.call("silo_script", "add_tracked_item", "asteroid-miner-copper")
		end
		if not tracked_items["asteroid-miner-random"] then
			remote.call("silo_script", "add_tracked_item", "asteroid-miner-random")
		end
		if not tracked_items["asteroid-miner-titanium"] then
			remote.call("silo_script", "add_tracked_item", "asteroid-miner-titanium")
		end
		if not tracked_items["asteroid-miner-stone"] then
			remote.call("silo_script", "add_tracked_item", "asteroid-miner-stone")
		end
		if not tracked_items["asteroid-miner-coal-1"] then
			remote.call("silo_script", "add_tracked_item", "asteroid-miner-coal-1")
		end
		if not tracked_items["asteroid-miner-coal-2"] then
			remote.call("silo_script", "add_tracked_item", "asteroid-miner-coal-2")
		end
		if not tracked_items["asteroid-miner-coal-3"] then
			remote.call("silo_script", "add_tracked_item", "asteroid-miner-coal-3")
		end]]
	end
end

