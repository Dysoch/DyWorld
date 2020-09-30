


function Event_on_init()
	if not global.dyworld then
		global.dyworld = {
			version = Version_Build,
			players = {},
			game_stats = {
				ticks = 0,
				chunks = 0,
				sector_scanned = 0,
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
				days = 0,
				attack_warning_1 = false,
				attack_warning_2 = false,
				attack_warning_3 = false,
				attack_loc_x = 0,
				attack_loc_y = 0,
				attack_loc_amount = 0,
				time_stamp = "",
				building_locations = {},
			},
			story = Story_Add(1, 1, false, 1, 1),
		}
	end
end

