

function dyworld_menu(player_index)
	local Table = {
		tips = 1,
		info = 1,
		entities = {
			trees = 1,
		},
		mechanics = {
			survival = {
				--food = 1, -- Done script wise
				--water = 1, -- Done script wise
				temperature = 1,
				radiation = 1,
				pollution = 1,
				implants = 1,
				health = 1,
			},
			bonus = {
				stats = 1,
				bonuses = 1,
			},
			smn_0 = {
				smn_1 = 1,
				smn_2 = 1,
				smn_3 = 1,
				smn_4 = 1,
				smn_5 = 1,
			},
			dyson = {
				sphere = 1,
			},
			script_attack = 1,
		},
		story = {
			act_1 = {
				phase_1_1 = 1,
			},
			act_2 = {},
			act_3 = {},
			act_4 = {},
			act_5 = {},
		  },
		}
	
		-- Main Pages --
		
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
	
		-- Story --
	
	for Act = 1,5 do
		for Phase = 1,50 do
			if global.dyworld.story.acts[Act] and global.dyworld.story.acts[Act][Phase] then
				if global.dyworld.story.acts[Act][Phase].started and global.dyworld.story.acts[Act][Phase].message then
					Table.story["act_"..Act]["phase_"..Act.."_"..Phase] = 1
				end
			end
		end
	end
	
	-- Survival --
	if (settings.global["DyWorld_Surival_Difficulty"].value == "Easy" or settings.global["DyWorld_Surival_Difficulty"].value == "Normal" or settings.global["DyWorld_Surival_Difficulty"].value == "Hard" or settings.global["DyWorld_Surival_Difficulty"].value == "Insane") then
		Table.mechanics.survival.food = 1
		Table.mechanics.survival.water = 1
	end
	
  return Table
end

function dyworld_page_content(page_name, player_index, element)
	-- main page
	if page_name == "dyworld" then
		element.add{type="label", name="", caption={"DyDs-story.message-act-1-phase-1-2"}}
	end
	  
	if page_name == "tips" then
		element.add{type="label", name="", caption={"DyWorld.page_tips"}}
	end
	  
	if page_name == "survival" then
		element.add{type="label", name="", caption={"DyWorld.page_survival"}}
	end
	
	if page_name == "food" then
		element.add{type="label", name="", caption={"DyWorld.page_food"}}
	end
	
	if page_name == "water" then
		element.add{type="label", name="", caption={"DyWorld.page_water"}}
	end
	
	if page_name == "temperature" then
		element.add{type="label", name="", caption={"DyWorld.page_temperature"}}
	end
	
	if page_name == "radiation" then
		element.add{type="label", name="", caption={"DyWorld.page_radiation"}}
	end
	
	if page_name == "pollution" then
		element.add{type="label", name="", caption={"DyWorld.page_pollution"}}
	end
	
	if page_name == "implants" then
		element.add{type="label", name="", caption={"DyWorld.page_implants"}}
	end
	
	if page_name == "health" then
		element.add{type="label", name="", caption={"DyWorld.page_health"}}
	end
  
	if page_name == "bonus" then
		element.add{type="label", name="", caption={"DyWorld.page_bonus"}}
	end
  
	if page_name == "stats" then
		element.add{type="label", name="", caption={"DyWorld.page_stats_1"}}
	
		local table2 = element.add{type = "table", name = "table2", column_count = 3, draw_vertical_lines = false, draw_horizontal_lines = false, vertical_centering = true, draw_horizontal_line_after_headers = false}
		
		table2.add{type = "label", caption = ""}
		table2.add{type = "label", caption = "[color=yellow]Personal: [/color]"}
		table2.add{type = "label", caption = "[color=yellow]Total: [/color]"}
	
		table2.add{type = "label", caption = "[color=yellow]Crafted: [/color]"}
		table2.add{type = "label", caption = "[color=blue]"..global.dyworld.players[player_index].crafted.."[/color]"}
		table2.add{type = "label", caption = "[color=blue]"..(global.dyworld.game_stats.crafted_amount or 0).."[/color]"}
		
		table2.add{type = "label", caption = "[color=yellow]Mined: [/color]"}
		table2.add{type = "label", caption = "[color=blue]"..global.dyworld.players[player_index].mined.."[/color]"}
		table2.add{type = "label", caption = "[color=blue]"..(global.dyworld.game_stats.mined_amount or 0).."[/color]"}
		
		table2.add{type = "label", caption = "[color=yellow]Built: [/color]"}
		table2.add{type = "label", caption = "[color=blue]"..global.dyworld.players[player_index].build.."[/color]"}
		table2.add{type = "label", caption = "[color=blue]"..(global.dyworld.game_stats.build_amount or 0).."[/color]"}
		
		table2.add{type = "label", caption = "[color=yellow]Picked: [/color]"}
		table2.add{type = "label", caption = "[color=blue]"..global.dyworld.players[player_index].picked.."[/color]"}
		table2.add{type = "label", caption = "[color=blue]"..(global.dyworld.game_stats.picked_amount or 0).."[/color]"}
		
		table2.add{type = "label", caption = "[color=yellow]Built: [/color]"}
		table2.add{type = "label", caption = "[color=blue]"..global.dyworld.players[player_index].killed.."[/color]"}
		table2.add{type = "label", caption = "[color=blue]"..(global.dyworld.game_stats.killed_amount or 0).."[/color]"}
		
		element.add{type="label", name="", caption={"DyWorld.page_stats_2"}}
		
		element.add{type="label", name="", caption={"DyWorld.page_stats_3"}}
		
		element.add{type="label", name="", caption={"DyWorld.page_stats_4"}}
		
		element.add{type="label", name="", caption={"DyWorld.page_stats_5"}}
	end
  
	if page_name == "bonuses" then
		element.add{type="label", name="", caption={"DyWorld.page_bonuses"}}local table2 = element.add{type = "table", name = "", column_count = 9, draw_vertical_lines = true, draw_horizontal_lines = true, vertical_centering = true, horizontal_centering = true, draw_horizontal_line_after_headers = false}
		
		table2.add{type = "label", caption = ""}
		table2.add{type = "label", caption = "[color=yellow]Native: [/color]"}
		table2.add{type = "label", caption = "[color=yellow]Stats: [/color]"}
		table2.add{type = "label", caption = "[color=yellow]Implants: [/color]"}
		table2.add{type = "label", caption = "[color=yellow]Research: [/color]"}
		table2.add{type = "label", caption = "[color=yellow]Achievements: [/color]"}
		table2.add{type = "label", caption = "[color=yellow]Deaths: [/color]"}
		table2.add{type = "label", caption = "[color=yellow]Total: [/color]"}
		table2.add{type = "label", caption = "[color=yellow]Enabled: [/color]"}
        for k,v in pairs(global.dyworld.players[player_index].bonuses_player) do
		    table2.add{type = "label", caption = "[color=yellow]"..k..":[/color]"}
		    table2.add{type = "label", caption = "[color=blue]"..v.native.."[/color]"}
		    table2.add{type = "label", caption = "[color=blue]"..v.stats.."[/color]"}
		    table2.add{type = "label", caption = "[color=blue]"..v.implants.."[/color]"}
		    table2.add{type = "label", caption = "[color=blue]"..v.research.."[/color]"}
		    table2.add{type = "label", caption = "[color=blue]"..v.achievements.."[/color]"}
		    table2.add{type = "label", caption = "[color=red]-"..v.death.."[/color]", tooltip = "will be reduced from the total of all previous values"}
		    table2.add{type = "label", caption = "[color=blue]"..v.total.."[/color]", tooltip = "If value is below 0, this will always show 0.\nIncrease your implants or research to get it above 0 again for the bonus to actually count"}
            if v.enabled then
                table2.add{type = "label", caption = "[color=green]✔[/color]"}
            else
                table2.add{type = "label", caption = "[color=red]✘[/color]"}
            end
        end
	end
  
	if page_name == "script_attack" then
		element.add{type="label", name="", caption={"DyWorld.page_script_attack"}}
	end
  
	if page_name == "info" then
		element.add{type="label", name="text_1", caption={"DyWorld.page_info_text_1"}}
	end
  
	for Act = 1,5 do
		for Phase = 1,50 do
			if page_name == "phase_"..Act.."_"..Phase then
				if global.dyworld.story.acts[Act][Phase].message then
					if global.dyworld.story.acts[Act][Phase].message == 1 then
						element.add{type = "label", name = "", caption = {"DyDs-story.message-act-"..Act.."-phase-"..Phase.."-1"}}
					else
						for i = 1,(global.dyworld.story.acts[Act][Phase].message) do
							element.add{type = "label", name = "", caption = {"DyDs-story.message-act-"..Act.."-phase-"..Phase.."-"..i}}
						end
					end
				end
			end
		end
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
	if page_name == "small_arachnid" then
		local image_container = element.add{type="frame", name="image_1", style="informatron_image_container", direction="vertical"}
		image_container.add{type="button", name="image_1", style="small_biter_1"}
		element.add{type="label", name="", caption={"DyWorld.page_small_arachnid-1", global.dyworld.game_stats.killed_names["small-biter"]}}
		if game.forces.player.technologies["arachnid-1"].researched then
			element.add{type="label", name="", caption={"DyWorld.page_small_arachnid-2"}}
		end
		if game.forces.player.technologies["arachnid-2"].researched then
			element.add{type="label", name="", caption={"DyWorld.page_small_arachnid-3"}}
		end
	end
	if page_name == "medium_arachnid" then
		local image_container = element.add{type="frame", name="image_1", style="informatron_image_container", direction="vertical"}
		image_container.add{type="button", name="image_1", style="medium_biter_1"}
		element.add{type="label", name="", caption={"DyWorld.page_medium_arachnid-1", global.dyworld.game_stats.killed_names["medium-biter"]}}
		if game.forces.player.technologies["arachnid-2"].researched then
			element.add{type="label", name="", caption={"DyWorld.page_medium_arachnid-2"}}
		end
		if game.forces.player.technologies["arachnid-3"].researched then
			element.add{type="label", name="", caption={"DyWorld.page_medium_arachnid-3"}}
		end
	end
  if page_name == "big_arachnid" then
    local image_container = element.add{type="frame", name="image_1", style="informatron_image_container", direction="vertical"}
    image_container.add{type="button", name="image_1", style="big_biter_1"}
    element.add{type="label", name="", caption={"DyWorld.page_big_arachnid-1", global.dyworld.game_stats.killed_names["big-biter"]}}
	if game.forces.player.technologies["arachnid-3"].researched then
      element.add{type="label", name="", caption={"DyWorld.page_big_arachnid-2"}}
	end
	if game.forces.player.technologies["arachnid-4"].researched then
      element.add{type="label", name="", caption={"DyWorld.page_big_arachnid-3"}}
	end
  end
  if page_name == "behemoth_arachnid" then
    local image_container = element.add{type="frame", name="image_1", style="informatron_image_container", direction="vertical"}
    image_container.add{type="button", name="image_1", style="behemoth_biter_1"}
    element.add{type="label", name="", caption={"DyWorld.page_behemoth_arachnid-1", global.dyworld.game_stats.killed_names["behemoth-biter"]}}
	if game.forces.player.technologies["arachnid-4"].researched then
      element.add{type="label", name="", caption={"DyWorld.page_behemoth_arachnid-2"}}
	end
	if game.forces.player.technologies["arachnid-5"].researched then
      element.add{type="label", name="", caption={"DyWorld.page_behemoth_arachnid-3"}}
	end
  end
  
  if page_name == "myriapods" then
    element.add{type="label", name="text_1", caption={"DyWorld.page_myriapods_text_1"}}
  end
  if page_name == "small_myriapods" then
    local image_container = element.add{type="frame", name="image_1", style="informatron_image_container", direction="vertical"}
    image_container.add{type="button", name="image_1", style="small_spitter_1"}
    element.add{type="label", name="", caption={"DyWorld.page_small_myriapods-1", global.dyworld.game_stats.killed_names["small-spitter"]}}
	if game.forces.player.technologies["myriapod-1"].researched then
      element.add{type="label", name="", caption={"DyWorld.page_small_myriapods-2"}}
	end
	if game.forces.player.technologies["myriapod-2"].researched then
      element.add{type="label", name="", caption={"DyWorld.page_small_myriapods-3"}}
	end
  end
  if page_name == "medium_myriapods" then
    local image_container = element.add{type="frame", name="image_1", style="informatron_image_container", direction="vertical"}
    image_container.add{type="button", name="image_1", style="medium_spitter_1"}
    element.add{type="label", name="", caption={"DyWorld.page_medium_myriapods-1", global.dyworld.game_stats.killed_names["medium-spitter"]}}
	if game.forces.player.technologies["myriapod-2"].researched then
      element.add{type="label", name="", caption={"DyWorld.page_medium_myriapods-2"}}
	end
	if game.forces.player.technologies["myriapod-3"].researched then
      element.add{type="label", name="", caption={"DyWorld.page_medium_myriapods-3"}}
	end
  end
  if page_name == "big_myriapods" then
    local image_container = element.add{type="frame", name="image_1", style="informatron_image_container", direction="vertical"}
    image_container.add{type="button", name="image_1", style="big_spitter_1"}
    element.add{type="label", name="", caption={"DyWorld.page_big_myriapods-1", global.dyworld.game_stats.killed_names["big-spitter"]}}
	if game.forces.player.technologies["myriapod-3"].researched then
      element.add{type="label", name="", caption={"DyWorld.page_big_myriapods-2"}}
	end
	if game.forces.player.technologies["myriapod-4"].researched then
      element.add{type="label", name="", caption={"DyWorld.page_big_myriapods-3"}}
	end
  end
  if page_name == "behemoth_myriapods" then
    local image_container = element.add{type="frame", name="image_1", style="informatron_image_container", direction="vertical"}
    image_container.add{type="button", name="image_1", style="behemoth_spitter_1"}
    element.add{type="label", name="", caption={"DyWorld.page_behemoth_myriapods-1", global.dyworld.game_stats.killed_names["behemoth-spitter"]}}
	if game.forces.player.technologies["myriapod-4"].researched then
      element.add{type="label", name="", caption={"DyWorld.page_behemoth_myriapods-2"}}
	end
	if game.forces.player.technologies["myriapod-5"].researched then
      element.add{type="label", name="", caption={"DyWorld.page_behemoth_myriapods-3"}}
	end
  end

  --[[if page_name == "penguin" then
    element.add{type="label", name="text_1", caption={"example.page_penguin_text_1"}}
    local image_container = element.add{type="frame", name="image_1", style="informatron_image_container", direction="vertical"}
    image_container.add{type="button", name="image_1", style="example_image_1"} -- defined in data.lua. MUST be a completely unique style name
  end]]
end