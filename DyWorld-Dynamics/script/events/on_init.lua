
function GetDefaultDyworldStruct()
	 return {
		version = Version_Build,
		players = {},
		research_done = {},
		game_stats = {
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
			radars = 0,
			inserters = 0,
			labs = 0,
			ghosts = 0,
			research = 0,
			dyson = {
				power_total = 0,
				power = 0,
				power_used = 0,
				effect = 0,
				sats = 0,
				structures = 0,
			},
			dyson_1 = {},
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
		story = Story_Init(),
	}
end

function FixupDyworldStruct()
	-- AllPlayersPrint("testing")
	if not global.dyworld then
		-- AllPlayersPrint("no global.dyworld")
		global.dyworld = GetDefaultDyworldStruct()
	else
		local defaults = GetDefaultDyworldStruct()

		-- AllPlayersPrint("has global.dyworld")

		-- add missing
		for k,v in pairs(defaults) do
			if not global.dyworld[k] then
				-- AllPlayersPrint(k)
				global.dyworld[k] = v
			end
		end
		-- remove old
		for k,v in pairs(global.dyworld) do
			if not defaults[k] then
				global.dyworld[k] = nil
			end
		end

		-- add missing
		for k,v in pairs(defaults.game_stats) do
			if not global.dyworld.game_stats[k] then
				-- AllPlayersPrint(k)
				global.dyworld.game_stats[k] = v
			end
		end
		-- remove old
		for k,v in pairs(global.dyworld.game_stats) do
			if not defaults.game_stats[k] then
				global.dyworld.game_stats[k] = nil
			end
		end

		-- add missing
		for k,v in pairs(defaults.game_stats.dyson) do
			if not global.dyworld.game_stats.dyson[k] then
				-- AllPlayersPrint(k)
				global.dyworld.game_stats.dyson[k] = v
			end
		end
		-- remove old
		for k,v in pairs(global.dyworld.game_stats.dyson) do
			if not defaults.game_stats.dyson[k] then
				global.dyworld.game_stats.dyson[k] = nil
			end
		end
	end
end

function Event_on_init()
	FixupDyworldStruct()
	FixupUnlockedStoryTechnologies()
	Populate_Side_Objectives_Table_Startup()
	if remote.interfaces["silo_script"] then
		remote.call("silo_script", "set_no_victory", true)
	end
end
