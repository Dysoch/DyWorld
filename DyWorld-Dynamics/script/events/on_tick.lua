


function Event_on_tick(event)

	--script.on_event(remote.call("space-exploration", "get_on_player_respawned_event"), Event_on_player_respawned_script)
	
	if event.tick%(60*1)==1 then
		local seconds_start = math.floor(game.tick/60)
		local minutes_start = math.floor(seconds_start/60)
		local hours = math.floor(minutes_start/60)
		local minutes = (minutes_start-(hours*60))
		local seconds = (seconds_start-(minutes_start*60))
		global.dyworld.game_stats.time_stamp = (hours..":"..minutes..":"..seconds)
	end
	if (event.tick%(60*60*10)==1 and global.dyworld.game_stats.difficulty < 10000) then
		if global.dyworld_story then
			if not global.dyworld.game_stats.players then global.dyworld.game_stats.players = 1 end
			if Dy_Sett.Difficulty ~= "Easy" then
				if Dy_Sett.Difficulty == "Normal" then
					global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + (0.1 * (global.dyworld.game_stats.players * global.dyworld.game_stats.players))
				end
				if Dy_Sett.Difficulty == "Hard" then
					global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + (0.5 * (global.dyworld.game_stats.players * global.dyworld.game_stats.players))
				end
			end
			if global.dyworld.game_stats.difficulty > 10000 then
				global.dyworld.game_stats.difficulty = 10000
			end
		end
	end
	if event.tick%(25001)==25000 then
		global.dyworld.game_stats.days = global.dyworld.game_stats.days + 1
		--debug("Game Days: "..global.dyworld.game_stats.days)
	end
	if Dy_Sett.Difficulty ~= "Easy" then
		for _,Player in pairs(global.dyworld.players) do
			if not global.dyworld.players[Player.id].implants then global.dyworld.players[Player.id].implants = {} end
			if global.dyworld.players[Player.id].implants["food-implant-1"] and event.tick%(60*30) == ((60*30) - 1) then
				if global.dyworld.players[Player.id].alive then
					Auto_Food_Intake(Player.id)
				end
			end
			if global.dyworld.players[Player.id].implants["food-implant-2"] and event.tick%(60*30) == ((60*24) - 1) then
				if global.dyworld.players[Player.id].alive then
					Auto_Food_Intake(Player.id)
				end
			end
			if global.dyworld.players[Player.id].implants["food-implant-3"] and event.tick%(60*30) == ((60*18) - 1) then
				if global.dyworld.players[Player.id].alive then
					Auto_Food_Intake(Player.id)
				end
			end
			if global.dyworld.players[Player.id].implants["food-implant-4"] and event.tick%(60*30) == ((60*12) - 1) then
				if global.dyworld.players[Player.id].alive then
					Auto_Food_Intake(Player.id)
				end
			end
			if global.dyworld.players[Player.id].implants["food-implant-5"] and event.tick%(60*30) == ((60*6) - 1) then
				if global.dyworld.players[Player.id].alive then
					Auto_Food_Intake(Player.id)
				end
			end
		end
	end
	for _,Player in pairs(global.dyworld.players) do
		if not global.dyworld.players[Player.id].implants then global.dyworld.players[Player.id].implants = {} end
		if global.dyworld.players[Player.id].implants["health-implant-1"] and event.tick%(60*30) == ((60*30) - 1) then
			Auto_Medpack_Intake(Player.id)
		end
		if global.dyworld.players[Player.id].implants["health-implant-2"] and event.tick%(60*30) == ((60*24) - 1) then
			Auto_Medpack_Intake(Player.id)
		end
		if global.dyworld.players[Player.id].implants["health-implant-3"] and event.tick%(60*30) == ((60*18) - 1) then
			Auto_Medpack_Intake(Player.id)
		end
		if global.dyworld.players[Player.id].implants["health-implant-4"] and event.tick%(60*30) == ((60*12) - 1) then
			Auto_Medpack_Intake(Player.id)
		end
		if global.dyworld.players[Player.id].implants["health-implant-5"] and event.tick%(60*30) == ((60*6) - 1) then
			Auto_Medpack_Intake(Player.id)
		end
	end
	if event.tick%(60*60)==1 then
		if global.dyworld.game_stats.space_mining then
			for k,v in pairs(global.dyworld.game_stats.space_mining) do
				v.pure_mined = v.pure_mined + v.pure_rate
				v.impure_mined = v.impure_mined + v.impure_rate
				if v.pure_mined >= v.pure_storage then v.pure_mined = v.pure_storage end
				if v.impure_mined >= v.impure_storage then v.impure_mined = v.impure_storage end
			end
		end
	end
	if event.tick%(60*1)==1 then
		for k,v in pairs(global.dyworld.players) do
			if v.alive and v.playing then
				if not v.posx2 then v.posx2 = 0 end
				if not v.posy2 then v.posy2 = 0 end
				if not v.distance then v.distance = 0 end
				if not v.distance_car then v.distance_car = 0 end
				if not v.distance_train then v.distance_train = 0 end
				if not v.surface then v.surface = "nauvis" end
				v.posx2 = v.posx
				v.posy2 = v.posy
				v.posx = game.players[v.id].position.x
				v.posy = game.players[v.id].position.y
				v.surface = game.players[v.id].surface.name
				if (game.players[v.id].vehicle and Distance_Car_Check(game.players[v.id].vehicle.name)) then
					v.distance_car = (v.distance_car + (getDistance(v.posx, v.posy, v.posx2, v.posy2) / 1000))
				elseif (game.players[v.id].vehicle and Distance_Train_Check(game.players[v.id].vehicle.name)) then
					v.distance_train = (v.distance_train + (getDistance(v.posx, v.posy, v.posx2, v.posy2) / 1000))
				elseif game.players[v.id].vehicle == nil then
					if game.players[v.id].character and not remote.call("space-exploration", "remote_view_is_active", {player = game.players[v.id]}) then
						v.distance = (v.distance + (getDistance(v.posx, v.posy, v.posx2, v.posy2) / 1000))
					end
				end
				if Dy_Sett.Difficulty == "Normal" then
					Food_Lose(v.id, 1)
					Water_Lose(v.id, 1)
				elseif Dy_Sett.Difficulty == "Hard" then
					Food_Lose(v.id, 1.5)
					Water_Lose(v.id, 1.5)
				end
				if v.story_gui and v.alive and not game.players[v.id].opened_self then
					local player = game.players[v.id]
					Close_Story_GUI(player, v.id)
					Story_GUI(player, v.id)
					player.gui.top.DyDs_Story_GUI.selected_tab_index = global.dyworld.players[v.id].story_gui_index
				end
				if v.stats_gui and v.alive and not game.players[v.id].opened_self then
					local player = game.players[v.id]
					Close_Main_GUI(player, v.id)
					Main_GUI(player, v.id)
					player.gui.top.DyDs_Main_GUI.selected_tab_index = global.dyworld.players[v.id].stats_gui_index
				end
				if v.smn_gui and v.alive and not game.players[v.id].opened_self then
					local player = game.players[v.id]
					Close_SMN_GUI(player, v.id)
					SMN_GUI(player, v.id)
					if player.gui.top.DyDs_SMN_GUI then
						player.gui.top.DyDs_SMN_GUI.selected_tab_index = global.dyworld.players[v.id].smn_gui_index
					end
				end
				Bonuses(v.id)
				if global.dyworld_story and v.alive and not global.dyworld.game_stats.story_pause then
					for aaaa,Phase in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
						if Phase.type_1 == "position" then
							if not remote.call("space-exploration", "remote_view_is_active", {player = game.players[v.id]}) then
								Story_Objectives("position", v.id, (game.players[v.id].position.x), (game.players[v.id].position.y))
							end
						end
					end
				end
			end
		end
	end
	if game.tick == 800 then
		if global.dyworld_story then
			for k,v in pairs(global.dyworld.players) do
				if not global.dyworld.game_stats.radars then global.dyworld.game_stats.radars = 0 end
				if (global.dyworld.game_stats.radars <= 0) then
					game.players[v.id].minimap_enabled = false
				end
			end
		else
			PlayerPrint("You are playing WITHOUT the story added. If you want to play with it, start a new game with the mod scenario added by DyWorld. (NOT NORMAL FREEPLAY). If this is intentional, ignore this message")
		end
	end
	if (global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].attack and global.dyworld_story and settings.global["DyWorld_Attack_Difficulty"].value ~= "Peaceful") then
		if event.tick%(Pick_Attack_Time()) == (Pick_Attack_Time() - 1) then
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].attack) do
				if not global.dyworld.game_stats.difficulty then global.dyworld.game_stats.difficulty = 1 end
				if v == "player" then
					for _,player in pairs(global.dyworld.players) do
						if not Dy_Find_Str(player.surface, "starmap") and not Dy_Find_Str(player.surface, "Orbit") then
							local Loc = {player.posx, player.posy}
							local Str = Pick_Random_Attack_Strength(math.ceil(global.dyworld.game_stats.difficulty / 100))
							game.surfaces[player.surface].build_enemy_base(Loc, Str)
							if global.dyworld.game_stats.attack_warning_2 then
								game.players[player.id].print("Commander, [color=blue]"..Str.."[/color] Natives are coming to attack YOU soon")
							end
						end
					end
				elseif Dy_Find_Str(v, "player-ambush") then
					for _,player in pairs(global.dyworld.players) do
						if not Dy_Find_Str(player.surface, "starmap") then
							local Location = {player.posx, player.posy, player.surface}
							local Str = Pick_Random_Attack_Strength(math.ceil(global.dyworld.game_stats.difficulty / 100))
							if Dy_Find_Str(v, "101") then
								Player_Ambush(Location, 50, Str, 1)
							elseif Dy_Find_Str(v, "102") then
								Player_Ambush(Location, 50, Str, 2)
							elseif Dy_Find_Str(v, "103") then
								Player_Ambush(Location, 50, Str, 3)
							elseif Dy_Find_Str(v, "104") then
								Player_Ambush(Location, 50, Str, 4)
							elseif Dy_Find_Str(v, "105") then
								Player_Ambush(Location, 50, Str, 5)
							end
							if global.dyworld.game_stats.attack_warning_2 then
								game.players[player.id].print("Commander, you are being ambushed!")
							end
						end
					end
				else
					local Loc = Pick_Random_Attack_Location(v)
					local Str = Pick_Random_Attack_Strength(math.ceil(global.dyworld.game_stats.difficulty / 20))
					local Surface = v
					game.surfaces[Surface].build_enemy_base(Loc, Str)
					
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
		end
	end
end