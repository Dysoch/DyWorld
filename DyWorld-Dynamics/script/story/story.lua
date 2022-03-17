


function Story_Init()
	local Story = {
		act = 1,
		phase = 1,
		side_objectives = debugger and {
			done = {},
			locked = {},
			unlocked = {},
			all = {},
			locked_amount = 0,
			unlocked_amount = 0,
			done_amount = 0,
		} or nil,
		acts = {
			[1] = Story_Table_Base[1],
			[2] = Story_Table_Base[2],
			[3] = Story_Table_Base[3],
			[4] = Story_Table_Base[4],
			[5] = Story_Table_Base[5],
		},
	}
	return Story
end

function Story_Migrate(Act_On, Phase_On, Override)
	-- AllPlayersPrint("Story_Migrate - " .. inspect.inspect(global.dyworld.story.acts[Act_On][Phase_On]))
	for Act, ActTable in pairs(Story_Table_Base) do
		for Phase, PhaseTable in pairs(ActTable) do
			if global.dyworld.story.acts[Act] and global.dyworld.story.acts[Act][Phase] then
				if Override then
					if global.dyworld.story.acts[Act] and global.dyworld.story.acts[Act][Phase] then
						global.dyworld.story.acts[Act][Phase] = PhaseTable
					end
				else
					local last_act_index = Story_tablelength(Story_Table_Base)
					local last_act_last_phase_index = Story_tablelength(Story_Table_Base[last_act_index])
					local updated_phasetable = PhaseTable

					if (
						-- current act's current phase only
						(Act == Act_On and Phase == Phase_On)
						-- don't update objectives if player is on last Act's last phase and they completed it
						and not
						(
							Act_On == last_act_index and
							Phase_On == last_act_last_phase_index and
							global.dyworld.story.acts[Act][Phase].done
						)
				 	) then
						local main_objectives_completed_count = 0
						local side_objectives_completed_count = 0

						updated_phasetable.started = true

						-- update objectives (also automatically drops off old objectives that have been removed)
						for objective_index,objective in pairs(updated_phasetable.objectives) do
							local found = false
							-- check if an existing objective matches
							for existing_objective_index,existing_objective in pairs(global.dyworld.story.acts[Act][Phase].objectives) do
								if (
									objective.type_1 == existing_objective.type_1 and
									objective.type_2 == existing_objective.type_2 and
									objective.name == existing_objective.name
								) then
									found = true
									if objective.amount_needed then

										-- objective had already existed, let's just use it as is
										objective.amount_done = existing_objective.amount_done
										-- keep existing requirement? or should we randomize it??
										-- seems wrong to randomize it...
										objective.amount_needed = existing_objective.amount_needed
										if objective.amount_done >= objective.amount_needed then
											objective.done = true
											main_objectives_completed_count = main_objectives_completed_count + 1
										end
									else
										objective.done = existing_objective.done
										if objective.done then
											main_objectives_completed_count = main_objectives_completed_count + 1
										end
									end
								end
							end
							-- if we didn't get a match, we need to take the new objective as is or adjust it for difficulty/randomization
							if not found then
								-- apply randomization for newly added objective
								if objective.amount_needed then
									objective.amount_needed = GetAdjustedObjectiveAmount(objective)
								end
							end
						end

						-- check amount of objectives (part 1)
						local Main_Amount = Story_tablelength(updated_phasetable.objectives)
						local Side_Amount = 0
						if updated_phasetable.objectives_side then
							Side_Amount = 10 - Main_Amount
						end
						local Total_Amount = Main_Amount + Side_Amount

						-- update side objectives
						if (
							updated_phasetable.objectives_side and
							global.dyworld.story.acts[Act][Phase].objectives_side and
							global.dyworld.story.acts[Act][Phase].amount and
							Story_tablelength(global.dyworld.story.acts[Act][Phase].amount) >= 3
						) then
							Side_Amount = Side_Amount - global.dyworld.story.acts[Act][Phase].amount[2]
						end

						-- check amount of objectives (part 2)
						Main_Amount = Main_Amount - main_objectives_completed_count
						Side_Amount = Side_Amount - side_objectives_completed_count
						updated_phasetable.amount = {Main_Amount, Side_Amount, Total_Amount}

						-- update phase done
						if (Main_Amount == 0 and Side_Amount == 0) then
							updated_phasetable.done = true
						end
					end

					-- if the player has passed the chapter, mark it started & done
					if (
						(Act < Act_On) or
						(Act == Act_On and Phase < Phase_On)
				 	) then
						updated_phasetable.started = true
						updated_phasetable.done = true
					end

					global.dyworld.story.acts[Act][Phase] = updated_phasetable
				end
			end
		end
	end
end
