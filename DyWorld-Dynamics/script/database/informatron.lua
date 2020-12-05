

function dyworld_menu(player_index)
	local Table = {
		tips = 1,
		info = 1,
		entities = {
			trees = 1,
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
	if (global.dyworld.game_stats.killed["small-biter"] or global.dyworld.game_stats.killed["medium-biter"] or global.dyworld.game_stats.killed["big-biter"] or global.dyworld.game_stats.killed["behemoth-biter"] or global.dyworld.game_stats.killed["small-spitter"] or global.dyworld.game_stats.killed["medium-spitter"] or global.dyworld.game_stats.killed["big-spitter"] or global.dyworld.game_stats.killed["behemoth-spitter"]) then
		Table.entities.enemy = {}
		Table.entities.enemy.arthropod = {}
	end
	if (global.dyworld.game_stats.killed["small-biter"] or global.dyworld.game_stats.killed["medium-biter"] or global.dyworld.game_stats.killed["big-biter"] or global.dyworld.game_stats.killed["behemoth-biter"]) then
		Table.entities.enemy.arthropod.arachnid = {}
	end
	if (global.dyworld.game_stats.killed["small-biter"]) then
		Table.entities.enemy.arthropod.arachnid.small_arachnid = 1
	end
	if (global.dyworld.game_stats.killed["medium-biter"]) then
		Table.entities.enemy.arthropod.arachnid.medium_arachnid = 1
	end
	if (global.dyworld.game_stats.killed["big-biter"]) then
		Table.entities.enemy.arthropod.arachnid.big_arachnid = 1
	end
	if (global.dyworld.game_stats.killed["behemoth-biter"]) then
		Table.entities.enemy.arthropod.arachnid.behemoth_arachnid = 1
	end
	if (global.dyworld.game_stats.killed["small-spitter"] or global.dyworld.game_stats.killed["medium-spitter"] or global.dyworld.game_stats.killed["big-spitter"] or global.dyworld.game_stats.killed["behemoth-spitter"]) then
		Table.entities.enemy.arthropod.myriapods = {}
	end
	if (global.dyworld.game_stats.killed["small-spitter"]) then
		Table.entities.enemy.arthropod.myriapods.small_myriapods = 1
	end
	if (global.dyworld.game_stats.killed["medium-spitter"]) then
		Table.entities.enemy.arthropod.myriapods.medium_myriapods = 1
	end
	if (global.dyworld.game_stats.killed["big-spitter"]) then
		Table.entities.enemy.arthropod.myriapods.big_myriapods = 1
	end
	if (global.dyworld.game_stats.killed["behemoth-spitter"]) then
		Table.entities.enemy.arthropod.myriapods.behemoth_myriapods = 1
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
	
	if ((global.dyworld.story.act >= 2 and global.dyworld.story.phase >= 1) or global.dyworld.story.act >= 3) then 
		Table.story.act_2.phase_2_1 = 1
	end
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

  if page_name == "trees" then
    element.add{type="label", name="text_1", caption={"DyWorld.page_trees_text_1"}}
	if (global.dyworld.game_stats.mined["tree-wetland-a"] or global.dyworld.game_stats.mined["tree-wetland-b"] or global.dyworld.game_stats.mined["tree-wetland-c"] or global.dyworld.game_stats.mined["tree-wetland-d"] or global.dyworld.game_stats.mined["tree-wetland-e"] or global.dyworld.game_stats.mined["tree-wetland-f"] or global.dyworld.game_stats.mined["tree-wetland-g"] or global.dyworld.game_stats.mined["tree-wetland-h"] or global.dyworld.game_stats.mined["tree-wetland-i"] or global.dyworld.game_stats.mined["tree-wetland-j"] or global.dyworld.game_stats.mined["tree-wetland-k"] or global.dyworld.game_stats.mined["tree-wetland-l"] or global.dyworld.game_stats.mined["tree-wetland-m"] or global.dyworld.game_stats.mined["tree-wetland-n"] or global.dyworld.game_stats.mined["tree-wetland-o"]) then
		element.add{type="label", name="text_2", caption={"DyWorld.page_trees_wetland"}}
	end
	if (global.dyworld.game_stats.mined["tree-grassland-a"] or global.dyworld.game_stats.mined["tree-grassland-b"] or global.dyworld.game_stats.mined["tree-grassland-c"] or global.dyworld.game_stats.mined["tree-grassland-d"] or global.dyworld.game_stats.mined["tree-grassland-e"] or global.dyworld.game_stats.mined["tree-grassland-f"] or global.dyworld.game_stats.mined["tree-grassland-g"] or global.dyworld.game_stats.mined["tree-grassland-h"] or global.dyworld.game_stats.mined["tree-grassland-i"] or global.dyworld.game_stats.mined["tree-grassland-j"] or global.dyworld.game_stats.mined["tree-grassland-k"] or global.dyworld.game_stats.mined["tree-grassland-l"] or global.dyworld.game_stats.mined["tree-grassland-m"] or global.dyworld.game_stats.mined["tree-grassland-n"] or global.dyworld.game_stats.mined["tree-grassland-o"] or global.dyworld.game_stats.mined["tree-grassland-p"] or global.dyworld.game_stats.mined["tree-grassland-q"]) then
		element.add{type="label", name="text_3", caption={"DyWorld.page_trees_grassland"}}
	end
	if (global.dyworld.game_stats.mined["tree-dryland-a"] or global.dyworld.game_stats.mined["tree-dryland-b"] or global.dyworld.game_stats.mined["tree-dryland-c"] or global.dyworld.game_stats.mined["tree-dryland-d"] or global.dyworld.game_stats.mined["tree-dryland-e"] or global.dyworld.game_stats.mined["tree-dryland-f"] or global.dyworld.game_stats.mined["tree-dryland-g"] or global.dyworld.game_stats.mined["tree-dryland-h"] or global.dyworld.game_stats.mined["tree-dryland-i"] or global.dyworld.game_stats.mined["tree-dryland-j"] or global.dyworld.game_stats.mined["tree-dryland-k"] or global.dyworld.game_stats.mined["tree-dryland-l"] or global.dyworld.game_stats.mined["tree-dryland-m"] or global.dyworld.game_stats.mined["tree-dryland-n"] or global.dyworld.game_stats.mined["tree-dryland-o"]) then
		element.add{type="label", name="text_4", caption={"DyWorld.page_trees_dryland"}}
	end
	if (global.dyworld.game_stats.mined["tree-desert-a"] or global.dyworld.game_stats.mined["tree-desert-b"] or global.dyworld.game_stats.mined["tree-desert-c"] or global.dyworld.game_stats.mined["tree-desert-d"] or global.dyworld.game_stats.mined["tree-desert-e"] or global.dyworld.game_stats.mined["tree-desert-f"] or global.dyworld.game_stats.mined["tree-desert-g"] or global.dyworld.game_stats.mined["tree-desert-h"] or global.dyworld.game_stats.mined["tree-desert-i"] or global.dyworld.game_stats.mined["tree-desert-j"] or global.dyworld.game_stats.mined["tree-desert-k"] or global.dyworld.game_stats.mined["tree-desert-l"] or global.dyworld.game_stats.mined["tree-desert-m"] or global.dyworld.game_stats.mined["tree-desert-n"]) then
		element.add{type="label", name="text_5", caption={"DyWorld.page_trees_desert"}}
	end
	if (global.dyworld.game_stats.mined["tree-palm-a"] or global.dyworld.game_stats.mined["tree-palm-b"]) then
		element.add{type="label", name="text_6", caption={"DyWorld.page_trees_palm"}}
	end
	if (global.dyworld.game_stats.mined["tree-snow-a"]) then
		element.add{type="label", name="text_7", caption={"DyWorld.page_trees_snow"}}
	end
	if (global.dyworld.game_stats.mined["tree-volcanic-a"]) then
		element.add{type="label", name="text_8", caption={"DyWorld.page_trees_volcanic"}}
	end
  end

  if page_name == "enemy" then
    element.add{type="label", name="text_1", caption={"DyWorld.page_enemy_text_1"}}
  end

  if page_name == "arthropod" then
    element.add{type="label", name="text_1", caption={"DyWorld.page_arthropod_text_1"}}
  end
  if page_name == "arachnid" then
    element.add{type="label", name="text_1", caption={"DyWorld.page_arachnid_text_1"}}
  end
  if page_name == "myriapods" then
    element.add{type="label", name="text_1", caption={"DyWorld.page_myriapods_text_1"}}
  end

  --[[if page_name == "penguin" then
    element.add{type="label", name="text_1", caption={"example.page_penguin_text_1"}}
    local image_container = element.add{type="frame", name="image_1", style="informatron_image_container", direction="vertical"}
    image_container.add{type="button", name="image_1", style="example_image_1"} -- defined in data.lua. MUST be a completely unique style name
  end]]
end