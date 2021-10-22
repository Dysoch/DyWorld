


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
	if event.tick%(60*60*2) == 1 then
		if global.dyworld_story then
			if not global.dyworld.game_stats.players then global.dyworld.game_stats.players = 1 end
			if Dy_Sett.Difficulty ~= "Easy" then
				if Dy_Sett.Difficulty == "Normal" then
					DyWorld_Custom_Difficulty_Change("+", 2.5)
				end
				if Dy_Sett.Difficulty == "Hard" then
					DyWorld_Custom_Difficulty_Change("+", 5)
				end
			end
		end
	end
	if event.tick%(25001)==25000 then
		global.dyworld.game_stats.days = global.dyworld.game_stats.days + 1
		if global.dyworld_story then
			for k,v in pairs(global.dyworld.players) do
				if not global.dyworld.game_stats.radars then global.dyworld.game_stats.radars = 0 end
				if (global.dyworld.game_stats.radars <= 0) then
					game.players[v.id].minimap_enabled = false
				end
			end
			if (settings.global["DyWorld_Attack_Difficulty"].value ~= "Peaceful" and global.dyworld.game_stats.difficulty >= 50000) then
				DyWorld_Base_Attack("nauvis")
			end
		end
	end

	-- Automated Functions --
	-- @todo Rewrite Automated Healing/Feeding Script to improve performance
	if event.tick%(60*10) == ((60*10) - 1) then
		for _,Player in pairs(global.dyworld.players) do
            if not global.dyworld.players[Player.id].implants then
                global.dyworld.players[Player.id].implants = {}
                for k,v in pairs(Implants) do
                    global.dyworld.players[Player.id].implants[k] = {enabled = false, amount = 0}
                end
            end
			if global.dyworld.players[Player.id].implants["food-implant"].enabled then
				if global.dyworld.players[Player.id].alive and settings.global["DyWorld_Surival_Difficulty"].value ~= "Off" then
					Auto_Food_Intake(Player.id)
				end
			end
			if global.dyworld.players[Player.id].implants["health-implant"].enabled then
				Auto_Medpack_Intake(Player.id)
			end
		end
	end
    -- Space Mining Network effects. These happen over a minute, every 15 seconds another things to reduce total load
	if event.tick%(60*60)==(60*1) then
		if global.dyworld.game_stats.space_mining then
			for k,v in pairs(global.dyworld.game_stats.space_mining) do
                if v.impure_rate and v.impure_rate ~= 0 then
                    v.impure_mined = v.impure_mined + v.impure_rate
                    if v.impure_mined >= v.impure_storage then v.impure_mined = v.impure_storage end
                end
			end
		end
	end
	if event.tick%(60*60)==(60*16) then
		if global.dyworld.game_stats.space_mining then
            if global.dyworld.game_stats.space_mining.interfaces then
                if global.dyworld.game_stats.space_mining.interfaces.impure then
                    SPM_Impure()
                end
            end
		end
	end
	if event.tick%(60*60)==(60*31) then
		if global.dyworld.game_stats.space_mining then
			for k,v in pairs(global.dyworld.game_stats.space_mining) do
                if v.pure_rate and v.pure_rate ~= 0 then
                    v.pure_mined = v.pure_mined + v.pure_rate
                    if v.pure_mined >= v.pure_storage then v.pure_mined = v.pure_storage end
                end
			end
		end
	end
	if event.tick%(60*60)==(60*46) then
		if global.dyworld.game_stats.space_mining then
            if global.dyworld.game_stats.space_mining.interfaces then
                if global.dyworld.game_stats.space_mining.interfaces.pure then
                    SPM_Pure()
                end
            end
		end
	end
	if event.tick%(60*1)==1 then
		for k,v in pairs(global.dyworld.players) do
			if v.alive and game.players[v.id].connected then
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

                if not global.dyworld.game_stats.chunks_info then global.dyworld.game_stats.chunks_info = {} end
                if not global.dyworld.game_stats.chunks_info[v.surface] then global.dyworld.game_stats.chunks_info[v.surface] = {} end
                local Chunk_X = math.floor(v.posx / 32)
                local Chunk_Y = math.floor(v.posy / 32)
                if not global.dyworld.game_stats.chunks_info[v.surface][Chunk_X..":"..Chunk_Y] then
                    global.dyworld.game_stats.chunks_info[v.surface][Chunk_X..":"..Chunk_Y] = {
                        Temperature_Standard = Round((Dy_Check_Terrain_Single(game.surfaces[v.surface].get_tile(v.posx, v.posy).name) + math.random()), 2),
                        Temperature = 0,
                        Pollution = Round(game.surfaces[v.surface].get_pollution({v.posx,v.posy}), 0),
                        Radiation = Dy_Check_Terrain_Single_Rad(game.surfaces[v.surface].get_tile(v.posx, v.posy)),
                    }
                end
                global.dyworld.game_stats.chunks_info[v.surface][Chunk_X..":"..Chunk_Y].Pollution = Round(game.surfaces[v.surface].get_pollution({v.posx,v.posy}), 0)
                global.dyworld.game_stats.chunks_info[v.surface][Chunk_X..":"..Chunk_Y].Temperature = Round((global.dyworld.game_stats.chunks_info[v.surface][Chunk_X..":"..Chunk_Y].Temperature_Standard * (1 - game.surfaces[v.surface].darkness)), 2)
                
				if settings.global["DyWorld_Surival_Difficulty"].value ~= "Off" then
                    if settings.global["DyWorld_Surival_Difficulty"].value == "Easy" then
                        Food_Lose(v.id, 0.5)
                        Water_Lose(v.id, 0.5)
                    elseif settings.global["DyWorld_Surival_Difficulty"].value == "Normal" then
                        Food_Lose(v.id, 1)
                        Water_Lose(v.id, 1)
                    elseif settings.global["DyWorld_Surival_Difficulty"].value == "Hard" then
                        Food_Lose(v.id, 2)
                        Water_Lose(v.id, 2)
                    elseif settings.global["DyWorld_Surival_Difficulty"].value == "Insane" then
                        Food_Lose(v.id, 5)
                        Water_Lose(v.id, 5)
                    end
				end

				if v.personal_gui and v.alive and Dy_Check_GUI(game.players[v.id].opened_gui_type) then
					local player = game.players[v.id]
					Close_Personal_GUI(player, v.id)
					Personal_GUI(player, v.id)
				end

				if v.story_gui and v.alive and Dy_Check_GUI(game.players[v.id].opened_gui_type) then
					local player = game.players[v.id]
					Close_Story_GUI(player, v.id)
					Story_GUI(player, v.id)
					player.gui.top.DyDs_Story_GUI.selected_tab_index = global.dyworld.players[v.id].story_gui_index
				end

				if v.stats_gui and v.alive and Dy_Check_GUI(game.players[v.id].opened_gui_type) then
					local player = game.players[v.id]
					Close_Main_GUI(player, v.id)
					Main_GUI(player, v.id)
					player.gui.top.DyDs_Main_GUI.selected_tab_index = global.dyworld.players[v.id].stats_gui_index
				end

				if v.smn_gui and v.alive and Dy_Check_GUI(game.players[v.id].opened_gui_type) then
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
		if not global.dyworld.game_stats.difficulty then global.dyworld.game_stats.difficulty = 1 end
		if event.tick%(Pick_Attack_Time()) == (Pick_Attack_Time() - 1) and (global.dyworld.game_stats.difficulty >= 500) then
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].attack) do
				if v == "player" then
					for _,player in pairs(global.dyworld.players) do
						if not Dy_Find_Str(player.surface, "starmap") and not Dy_Find_Str(player.surface, "Orbit") then
							local Loc = {player.posx, player.posy}
							local Str = Pick_Random_Attack_Strength(math.ceil(global.dyworld.game_stats.difficulty / 500))
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
							local Str = Pick_Random_Attack_Strength(math.ceil(global.dyworld.game_stats.difficulty / 500))
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
					DyWorld_Base_Attack(v)
				end
			end
		end
	end
end