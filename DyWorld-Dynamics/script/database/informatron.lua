

function dyworld_menu(player_index)
	local Table = {
		tips = 1,
		info = 1,
		entities = {
			enemy = {
			},
		},
		story = {
			act_1 = {
				phase_1_1 = 1,
			},
		  },
		}
	
		-- Main Pages --
	
	if (global.dyworld.story.act >= 2) then
		Table.story.act_2 = {}
	end
	if (global.dyworld.story.act >= 3) then
		Table.story.act_3 = {}
	end
	if (global.dyworld.story.act >= 4) then
		Table.story.act_4 = {}
	end
	if (global.dyworld.story.act >= 5) then
		Table.story.act_5 = {}
	end
	
		-- Act 1 --
	
	if ((global.dyworld.story.act >= 1 and global.dyworld.story.phase >= 2) or global.dyworld.story.act >= 2) then 
		Table.story.act_1.phase_1_2 = 1
	end
	if ((global.dyworld.story.act >= 1 and global.dyworld.story.phase >= 3) or global.dyworld.story.act >= 2) then 
		Table.story.act_1.phase_1_3 = 1
	end
	if ((global.dyworld.story.act >= 1 and global.dyworld.story.phase >= 4) or global.dyworld.story.act >= 2) then 
		Table.story.act_1.phase_1_4 = 1
	end
	if ((global.dyworld.story.act >= 1 and global.dyworld.story.phase >= 5) or global.dyworld.story.act >= 2) then 
		Table.story.act_1.phase_1_5 = 1
	end
	if ((global.dyworld.story.act >= 1 and global.dyworld.story.phase >= 6) or global.dyworld.story.act >= 2) then 
		Table.story.act_1.phase_1_6 = 1
	end
	if ((global.dyworld.story.act >= 1 and global.dyworld.story.phase >= 7) or global.dyworld.story.act >= 2) then 
		Table.story.act_1.phase_1_7 = 1
	end
	if ((global.dyworld.story.act >= 1 and global.dyworld.story.phase >= 8) or global.dyworld.story.act >= 2) then 
		Table.story.act_1.phase_1_8 = 1
	end
	if ((global.dyworld.story.act >= 1 and global.dyworld.story.phase >= 9) or global.dyworld.story.act >= 2) then 
		Table.story.act_1.phase_1_9 = 1
	end
	if ((global.dyworld.story.act >= 1 and global.dyworld.story.phase >= 10) or global.dyworld.story.act >= 2) then 
		Table.story.act_1.phase_1_10 = 1
	end
	
		-- Act 2 --
	
	if ((global.dyworld.story.act >= 2 and global.dyworld.story.phase >= 2) or global.dyworld.story.act >= 3) then 
		Table.story.act_2.phase_2_2 = 1
	end
	if ((global.dyworld.story.act >= 2 and global.dyworld.story.phase >= 3) or global.dyworld.story.act >= 3) then 
		Table.story.act_2.phase_2_3 = 1
	end
	if ((global.dyworld.story.act >= 2 and global.dyworld.story.phase >= 4) or global.dyworld.story.act >= 3) then 
		Table.story.act_2.phase_2_4 = 1
	end
	if ((global.dyworld.story.act >= 2 and global.dyworld.story.phase >= 5) or global.dyworld.story.act >= 3) then 
		Table.story.act_2.phase_2_5 = 1
	end
	if ((global.dyworld.story.act >= 2 and global.dyworld.story.phase >= 6) or global.dyworld.story.act >= 3) then 
		Table.story.act_2.phase_2_6 = 1
	end
	if ((global.dyworld.story.act >= 2 and global.dyworld.story.phase >= 7) or global.dyworld.story.act >= 3) then 
		Table.story.act_2.phase_2_7 = 1
	end
	if ((global.dyworld.story.act >= 2 and global.dyworld.story.phase >= 8) or global.dyworld.story.act >= 3) then 
		Table.story.act_2.phase_2_8 = 1
	end
	if ((global.dyworld.story.act >= 2 and global.dyworld.story.phase >= 9) or global.dyworld.story.act >= 3) then 
		Table.story.act_2.phase_2_9 = 1
	end
	if ((global.dyworld.story.act >= 2 and global.dyworld.story.phase >= 10) or global.dyworld.story.act >= 3) then 
		Table.story.act_2.phase_2_10 = 1
	end
  return Table
end

function dyworld_page_content(page_name, player_index, element)
  -- main page
  if page_name == "dyworld" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-1-phase-1-2"}}
  end
  
  if page_name == "tips" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-1-phase-1-2"}}
  end
  
  if page_name == "info" then
    element.add{type="label", name="text_1", caption={"DyWorld.page_info_text_1"}}
  end

  if page_name == "phase_1_1" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-1-phase-1-1", global.dyworld.game_stats.time_stamp}}
  end

  if page_name == "phase_1_2" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-1-phase-2", global.dyworld.game_stats.time_stamp}}
  end

  if page_name == "phase_1_3" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-1-phase-3", global.dyworld.game_stats.time_stamp}}
  end

  if page_name == "phase_1_4" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-1-phase-4", global.dyworld.game_stats.time_stamp}}
  end

  if page_name == "phase_1_5" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-1-phase-5", global.dyworld.game_stats.time_stamp}}
  end

  if page_name == "phase_1_6" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-1-phase-6", global.dyworld.game_stats.time_stamp}}
  end

  if page_name == "phase_1_7" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-1-phase-7", global.dyworld.game_stats.time_stamp}}
  end

  if page_name == "phase_1_8" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-1-phase-8", global.dyworld.game_stats.time_stamp}}
  end

  if page_name == "phase_1_9" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-1-phase-9", global.dyworld.game_stats.time_stamp}}
  end

  if page_name == "phase_1_10" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-1-phase-10-1", global.dyworld.game_stats.time_stamp}}
    element.add{type="label", name="text_1_1", caption="\n"}
    element.add{type="label", name="text_2", caption={"DyDs-story.message-act-1-phase-10-2"}}
    element.add{type="label", name="text_2_1", caption="\n"}
    element.add{type="label", name="text_3", caption={"DyDs-story.message-act-1-phase-10-3"}}
    element.add{type="label", name="text_3_1", caption="\n"}
    element.add{type="label", name="text_4", caption={"DyDs-story.message-act-1-phase-10-4"}}
    element.add{type="label", name="text_4_1", caption="\n"}
    element.add{type="label", name="text_5", caption={"DyDs-story.message-act-1-phase-10-5"}}
  end

  if page_name == "phase_2_1" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-2-phase-1"}}
  end

  if page_name == "phase_2_2" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-2-phase-2"}}
  end

  if page_name == "phase_2_3" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-2-phase-3"}}
  end

  if page_name == "phase_2_4" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-2-phase-4"}}
  end

  if page_name == "phase_2_5" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-2-phase-5"}}
  end

  if page_name == "phase_2_6" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-2-phase-6"}}
  end

  if page_name == "phase_2_7" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-2-phase-7"}}
  end

  if page_name == "phase_2_8" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-2-phase-8"}}
  end

  if page_name == "phase_2_9" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-2-phase-9"}}
  end

  if page_name == "phase_2_10" then
    element.add{type="label", name="text_1", caption={"DyDs-story.message-act-2-phase-10"}}
  end

  if page_name == "enemy" then
    element.add{type="label", name="text_1", caption={"DyWorld.page_enemy_text_1"}}
  end

  --[[if page_name == "penguin" then
    element.add{type="label", name="text_1", caption={"example.page_penguin_text_1"}}
    local image_container = element.add{type="frame", name="image_1", style="informatron_image_container", direction="vertical"}
    image_container.add{type="button", name="image_1", style="example_image_1"} -- defined in data.lua. MUST be a completely unique style name
  end]]
end