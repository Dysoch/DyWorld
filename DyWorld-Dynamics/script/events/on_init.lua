


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
				phases = {
					[1] = {
						done = false,
						amount_left = 4,
						objectives_amount = 4,
						recipes = true,
						objectives = {
							[1] = {
								type_1 = "build", 
								type_2 = "name", 
								name = "basic-kiln", 
								amount_needed = math.random(8,12),
								amount_done = 0,
								done = false,
							},
							[2] = {
								type_1 = "mine", 
								type_2 = "item", 
								name = "limestone", 
								amount_needed = math.random(25,125),
								amount_done = 0,
								done = false,
							},
							[3] = {
								type_1 = "mine", 
								type_2 = "item", 
								name = "wood", 
								amount_needed = math.random(20,75),
								amount_done = 0,
								done = false,
							},
							[4] = {
								type_1 = "craft", 
								type_2 = "item", 
								name = "small-storage", 
								amount_needed = math.random(4,8),
								amount_done = 0,
								done = false,
							},
						},
					},
					[2] = {
						done = false,
						amount_left = 1,
						objectives_amount = 1,
						message = "DyDs-story.message-phase-2",
						recipes = true,
						objectives = {
							[1] = {
								type_1 = "died", 
								type_2 = "name", 
								name = "small-biter", 
								amount_needed = math.random(4,16),
								amount_done = 0,
								done = false,
							},
						},
					},
					[3] = {
						done = false,
						amount_left = 1,
						objectives_amount = 1,
						--message = "DyDs-story.message-phase-2",
						recipes = true,
						objectives = {
							[1] = {
								type_1 = "died", 
								type_2 = "name", 
								name = "small-biter", 
								amount_needed = 10,
								amount_done = 0,
								done = false,
							},
						},
					},
					[4] = {
						done = false,
						amount_left = 1,
						objectives_amount = 1,
						--message = "DyDs-story.message-phase-2",
						recipes = true,
						objectives = {
							[1] = {
								type_1 = "died", 
								type_2 = "name", 
								name = "small-biter", 
								amount_needed = 10,
								amount_done = 0,
								done = false,
							},
						},
					},
					[5] = {
						done = false,
						amount_left = 1,
						objectives_amount = 1,
						--message = "DyDs-story.message-phase-2",
						recipes = true,
						objectives = {
							[1] = {
								type_1 = "died", 
								type_2 = "name", 
								name = "small-biter", 
								amount_needed = 10,
								amount_done = 0,
								done = false,
							},
						},
					},
					[6] = {
						done = false,
						amount_left = 1,
						objectives_amount = 1,
						--message = "DyDs-story.message-phase-2",
						recipes = true,
						objectives = {
							[1] = {
								type_1 = "died", 
								type_2 = "name", 
								name = "small-biter", 
								amount_needed = 10,
								amount_done = 0,
								done = false,
							},
						},
					},
					[7] = {
						done = false,
						amount_left = 1,
						objectives_amount = 1,
						--message = "DyDs-story.message-phase-2",
						recipes = true,
						objectives = {
							[1] = {
								type_1 = "died", 
								type_2 = "name", 
								name = "small-biter", 
								amount_needed = 10,
								amount_done = 0,
								done = false,
							},
						},
					},
					[8] = {
						done = false,
						amount_left = 1,
						objectives_amount = 1,
						--message = "DyDs-story.message-phase-2",
						recipes = true,
						objectives = {
							[1] = {
								type_1 = "died", 
								type_2 = "name", 
								name = "small-biter", 
								amount_needed = 10,
								amount_done = 0,
								done = false,
							},
						},
					},
					[9] = {
						done = false,
						amount_left = 1,
						objectives_amount = 1,
						--message = "DyDs-story.message-phase-2",
						recipes = true,
						objectives = {
							[1] = {
								type_1 = "died", 
								type_2 = "name", 
								name = "small-biter", 
								amount_needed = 10,
								amount_done = 0,
								done = false,
							},
						},
					},
				},
			},
		}
	end
end

