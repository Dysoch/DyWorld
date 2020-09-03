


function Event_on_init()
	if not global.dyworld then
		global.dyworld = {
			version = "0.9.0",
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
				time_stamp = "",
				building_locations = {},
			},
			story = {
				tier = 0,
				phase = 1,
				phase_001 = true,
				phase_002 = false,
				phase_003 = false,
				phase_004 = false,
				phase_005 = false,
				phase_006 = false,
				phase_007 = false,
				phase_008 = false,
				phase_009 = false,
				phase_101 = false,
				phase_102 = false,
				phase_103 = false,
				phase_104 = false,
				phase_105 = false,
				phase_106 = false,
				phase_107 = false,
				phase_108 = false,
				phase_109 = false,
			},
		}
	end
end

