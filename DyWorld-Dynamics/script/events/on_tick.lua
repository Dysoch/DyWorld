


function Event_on_tick(event)
	if event.tick%(60*1)==1 then
		local seconds_start = math.floor(game.tick/60)
		local minutes_start = math.floor(seconds_start/60)
		local hours = math.floor(minutes_start/60)
		local minutes = (minutes_start-(hours*60))
		local seconds = (seconds_start-(minutes_start*60))
		global.dyworld.game_stats.time_stamp = (hours..":"..minutes..":"..seconds)
	end
	if (event.tick%(60*60*3)==1 and global.dyworld.game_stats.difficulty < 10000) then
		if global.dyworld_story then
			if not global.dyworld.game_stats.players then global.dyworld.game_stats.players = 1 end
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + (0.1 * (global.dyworld.game_stats.players * global.dyworld.game_stats.players))
			if global.dyworld.game_stats.difficulty > 10000 then
				global.dyworld.game_stats.difficulty = 10000
			end
		end
	end
	if event.tick%(25001)==25000 then
		global.dyworld.game_stats.days = global.dyworld.game_stats.days + 1
		--debug("Game Days: "..global.dyworld.game_stats.days)
	end
	if event.tick%(60*1)==1 then
		for k,v in pairs(global.dyworld.players) do
			if v.alive and v.playing then
				v.posx = game.players[v.id].position.x
				v.posy = game.players[v.id].position.y
				if v.story_gui then
					local player = game.players[v.id]
					Close_Story_GUI(player, v.id)
					Story_GUI(player, v.id)
					player.gui.top.DyDs_Story_GUI.selected_tab_index = global.dyworld.players[v.id].story_gui_index
				end
				if v.stats_gui then
					local player = game.players[v.id]
					Close_Main_GUI(player, v.id)
					Main_GUI(player, v.id)
					player.gui.top.DyDs_Main_GUI.selected_tab_index = global.dyworld.players[v.id].stats_gui_index
				end
				Bonuses(v.id)
				if global.dyworld_story then
					if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].location_objective then
						Story_Objectives("position", nil, (game.players[v.id].position.x), (game.players[v.id].position.y))
					end
				end
			end
		end
	end
	if event.tick%(60*60)==800 and global.dyworld_story then
		for k,v in pairs(global.dyworld.players) do
			if (global.dyworld.story.act == 1 and global.dyworld.story.phase <= 8 and game.players[v.id].minimap_enabled == true) then
				game.players[v.id].minimap_enabled = false
			end
		end
	end
	if (global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].enemy_attack and event.tick%(60*60*global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].enemy_frequency) == math.random((60*60*global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].enemy_frequency)-1)) and global.dyworld_story then
		if not global.dyworld.game_stats.difficulty then global.dyworld.game_stats.difficulty = 1 end
		local Loc = Pick_Random_Attack_Location()
		local Str = Pick_Random_Attack_Strength(math.ceil(global.dyworld.game_stats.difficulty / 10))
		
		game.surfaces[1].build_enemy_base(Loc, Str)
		
		global.dyworld.game_stats.attack_loc_amount = Str
		global.dyworld.game_stats.attack_loc_x = Loc.x
		global.dyworld.game_stats.attack_loc_y = Loc.y
		if global.dyworld.game_stats.attack_warning_3 then
			AttackPrint({"DyDs-story.attack-3", Loc.x, Loc.y, Str})
		elseif global.dyworld.game_stats.attack_warning_2 then
			AttackPrint({"DyDs-story.attack-2", Str})
		elseif global.dyworld.game_stats.attack_warning_1 then
			AttackPrint({"DyDs-story.attack-1"})
		end
	end
end