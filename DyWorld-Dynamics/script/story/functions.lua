
function Find_Enemy(SURFACE)
	if game.surfaces[SURFACE].find_nearest_enemy{position={0,0}, max_distance = ((global.dyworld.game_stats.chunks / 4) * 32)} then
		return game.surfaces[SURFACE].find_nearest_enemy{position={0,0}, max_distance = ((global.dyworld.game_stats.chunks / 4) * 32)}
	else
		return nil
	end
end

function Difficulty_Change(ARG1, VAR1)
	if ARG1 == "+" then
		global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + VAR1
	elseif ARG1 == "-" then
		global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty - VAR1
		if (global.dyworld.game_stats.difficulty < 1) then
			global.dyworld.game_stats.difficulty = 1
		end
	end
end

function Story_tablelength(T)
	local count = 0
	for k,v in pairs(T) do
		count = count + 1
	end
	return count
end

function Phase_Forward()
	if global.dyworld_story then
	
	-- checks side objectives, and populates in act 1 phase 2. this is done because other mods can then add more side objectives
	if not global.dyworld.story.side_objectives then
		Populate_Side_Objectives_Table_Startup()
	end

	-- Main phase forward. Checks phase against total phases in act, moves to next act if neccesary
	if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase+1] then
		global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].done = true
		global.dyworld.story.phase = global.dyworld.story.phase + 1
		global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].started = true
		if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives_side then
			Check_Side_Objective()
		end
	else
		global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].done = true
		global.dyworld.story.act = global.dyworld.story.act + 1
		global.dyworld.story.phase = 1
		global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].started = true
		if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives_side then
			Check_Side_Objective()
		end
	end

	-- check amount of objectives
	if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives_side then
		local Main_Amount = Story_tablelength(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives)
		local Side_Amount = 10 - Main_Amount
		local Total_Amount = Main_Amount + Side_Amount
		global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount = {Main_Amount, Side_Amount, Total_Amount}
	else
		local Main_Amount = Story_tablelength(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives)
		local Side_Amount = 0
		local Total_Amount = Main_Amount + Side_Amount
		global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount = {Main_Amount, Side_Amount, Total_Amount}
	end

    -- Apply randomisation and difficulty changes to amount from objectives
	for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
        if v.type_1 and (v.type_1 == "build" or v.type_1 == "craft" or v.type_1 == "died" or v.type_1 == "launch") or (v.type_1 and v.type_1 == "world" and v.type_2 and v.type_2 == "radar-scan") then
            if v.amount_needed and not v.set_stone then
                if settings.startup["DyWorld_Difficulty"].value == "Easy" then
                    if v.random then
                        local standard = math.floor(v.amount_needed * 0.5)
                        local low_end = math.floor(standard * 0.5)
                        local high_end = math.floor(standard * 1.5)
                        v.amount_needed = math.floor(math.random(low_end, high_end))
                    else
                        v.amount_needed = math.floor(v.amount_needed * 0.5)
                    end
                elseif settings.startup["DyWorld_Difficulty"].value == "Normal" then
                    if v.random then
                        local standard = v.amount_needed
                        local low_end = math.floor(standard * 0.5)
                        local high_end = math.floor(standard * 1.5)
                        v.amount_needed = math.floor(math.random(low_end, high_end))
                    end
                elseif settings.startup["DyWorld_Difficulty"].value == "Hard" then
                    if v.random then
                        local standard = math.floor(v.amount_needed * 1.75)
                        local low_end = math.floor(standard * 0.5)
                        local high_end = math.floor(standard * 1.5)
                        v.amount_needed = math.floor(math.random(low_end, high_end))
                    else
                        v.amount_needed = math.floor(v.amount_needed * 1.75)
                    end
                end
            end
        end
    end

	-- Check if recipes require unlock --
	for k,v in pairs(Story_Recipes) do
		if (v.phase <= global.dyworld.story.phase and v.act <= global.dyworld.story.act) then
			for index,player in pairs(game.players) do
				if player.force.recipes[k] then
					if not player.force.recipes[k].enabled then
						player.force.recipes[k].enabled = true
						--if game.entity_prototypes[k] then
							--PlayerPrint({"looped-name.gained-knowledge", {"entity-name."..k}})
							PlayerPrint({"looped-name.gained-knowledge", k})
						--elseif game.item_prototypes[k] then
							--PlayerPrint({"looped-name.gained-knowledge", {"item-name."..k}})
							--PlayerPrint({"looped-name.gained-knowledge", k})
						--end
					end
				else 
					debug("Recipe unlock failed! Does it exist? ("..k..")")
				end
			end
		end
	end

	-- Check technologies already researched against objectives --
	for k,v in pairs(game.forces.player.technologies) do
		if v.researched then
			Story_Objectives_Research(v.name)
		end
	end

	-- rewrite this
	for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
		if (v.type_1 == "position" and v.type_2 == "enemy-find" and v.done == false) then
			local Finder = Find_Enemy(v.Surface)
			if Finder == nil then
				v.done = true
				global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
			else
				local X = Finder.position.x
				local Y = Finder.position.y
				v.PosX = X
				v.PosY = Y
				-- Add location Tag
				if not game.surfaces[v.Surface].is_chunk_generated({v.PosX/32, v.PosY/32}) then
					game.surfaces[v.Surface].request_to_generate_chunks({v.PosX, v.PosY}, 1)
					game.surfaces[v.Surface].force_generate_chunk_requests()
				end
			end
		end
		if (v.type_1 == "position" and v.done == false) then
			local SAct = global.dyworld.story.act
			local SPhase = global.dyworld.story.phase
			local ObjTag = "Dy-Story-Tag-"..SAct.."-"..SPhase.."-"..k
			v.Tag = ObjTag
			if game.surfaces[v.Surface] then
				game.forces.player.add_chart_tag(v.Surface, {position = {v.PosX, v.PosY}, object_name = ObjTag, surface = v.Surface, text = "Story Objective"})
			end
		end
	end

	-- seperate things for the story
	if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].sounds then
		for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].sounds) do
			for index,player in pairs(game.players) do
				player.play_sound{path = v}
			end
		end
	end
	if (global.dyworld.story.phase == 10 and global.dyworld.story.act == 1) then
		global.dyworld.game_stats.attack_warning_1 = true
	end
	if (global.dyworld.story.phase == 1 and global.dyworld.story.act == 2) then
		game.surfaces["nauvis"].create_entity{name = ("atomic-artillery-projectile"), position = {(math.random(-250,250)),(math.random(-250,250))}, force = game.forces.enemy, speed = 2.5, target = {(math.random(-10,10)),(math.random(-10,10))}}
		game.surfaces["nauvis"].create_entity{name = ("atomic-artillery-projectile"), position = {(math.random(-500,500)),(math.random(-500,500))}, force = game.forces.enemy, speed = 2.5, target = {250,250}}
		game.surfaces["nauvis"].create_entity{name = ("atomic-artillery-projectile"), position = {(math.random(-500,500)),(math.random(-500,500))}, force = game.forces.enemy, speed = 2.5, target = {250,-250}}
		game.surfaces["nauvis"].create_entity{name = ("atomic-artillery-projectile"), position = {(math.random(-500,500)),(math.random(-500,500))}, force = game.forces.enemy, speed = 2.5, target = {-250,-250}}
		game.surfaces["nauvis"].create_entity{name = ("atomic-artillery-projectile"), position = {(math.random(-500,500)),(math.random(-500,500))}, force = game.forces.enemy, speed = 2.5, target = {-250,250}}
		global.dyworld.game_stats.difficulty = 1
	end
	if (global.dyworld.story.phase == 1 and global.dyworld.story.act == 3) then
		global.dyworld.game_stats.difficulty = 1
	end
	
	if (global.dyworld.story.phase == 10 and global.dyworld.story.act == 3) then
		-- Cryonite moon
		remote.call("space-exploration", "discover_zone", {force_name = game.players[1].force.name, surface = game.players[1].surface, zone_name = "Shakok"})
		
		-- Vulcanite Moon
		remote.call("space-exploration", "discover_zone", {force_name = game.players[1].force.name, surface = game.players[1].surface, zone_name = "Aine"})
		
		-- Iridium Moon
		remote.call("space-exploration", "discover_zone", {force_name = game.players[1].force.name, surface = game.players[1].surface, zone_name = "Kothar"})
		
		-- Holmium Moon
		remote.call("space-exploration", "discover_zone", {force_name = game.players[1].force.name, surface = game.players[1].surface, zone_name = "Enlil"})
		
		-- Vitamilange Moon
		remote.call("space-exploration", "discover_zone", {force_name = game.players[1].force.name, surface = game.players[1].surface, zone_name = "Freyr"})
	end

    -- Pause the story, till more is added in
	if (global.dyworld.story.phase == 6 and global.dyworld.story.act == 3) then
		global.dyworld.game_stats.story_pause = true
	end

	-- Message Feature --
	if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].message then
		if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].message == 1 then
			DyLog("DyDs-story.message-act-"..global.dyworld.story.act.."-phase-"..global.dyworld.story.phase.."-1", true, global.dyworld.story.act, global.dyworld.story.phase, true)
		else
			for i = 1,(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].message) do
				DyLog("DyDs-story.message-act-"..global.dyworld.story.act.."-phase-"..global.dyworld.story.phase.."-"..i, true, global.dyworld.story.act, global.dyworld.story.phase, true)
			end
		end
	end

	-- Autosave Feature
	if settings.global["DyWorld_Autosave_Story"].value then
		game.auto_save("DyWorld-Dynamics Act "..global.dyworld.story.act.." Phase "..global.dyworld.story.phase)
	end
	end
end

function Reunlock_Recipes()
	if global.dyworld_story then
		for k,v in pairs(Story_Recipes) do
			if (v.phase <= global.dyworld.story.phase and v.act <= global.dyworld.story.act) or (v.act < global.dyworld.story.act) then
				for _,player in pairs(game.players) do
					if player.force.recipes[k] then
						if player.force.recipes[k].enabled == false then
							player.force.recipes[k].enabled = true
						end
					else
						debug("Recipe unlock failed! Does it exist? ("..k..")")
					end
				end
			end
		end
	end
end

function Story_Objectives_Research(name)
	for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
		if (v.type_1 == "research" and v.type_2 == "name") then
			if (name == v.name and v.done == false) then
				v.done = true
                global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
				for _,z in pairs(global.dyworld.players) do
					local player = game.players[z.id]
					Refresh_Story_GUI(player, z.id)
				end
			end
		end
	end
end

function Story_Objectives(type, event, Posx, PosY)
	if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives then
		if type == "mining-item" then
			local player = game.players[event.player_index]
			local force = player.force
			local id = event.player_index
			local name = event.item_stack.name
			local count = event.item_stack.count
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "mine" and v.type_2 == "item") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + count
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
						for _,z in pairs(global.dyworld.players) do
							local player = game.players[z.id]
							Refresh_Story_GUI(player, z.id)
						end
					end
				end
			end
		elseif type == "mining-entity" then
		
		elseif type == "corpse-player" then
		
		elseif type == "position" then
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "position" and v.done == false) then
				local player = game.players[event]
					if player.surface.name == v.Surface then
						if v.HigherDis then
							if getDistance(Posx, PosY, v.PosX, v.PosY) <= 100 then
								v.done = true
								global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
								local TAG = game.forces.player.find_chart_tags(v.Surface, {{(Posx-150), (PosY-150)},{(Posx+150), (PosY+150)}})
								for k,v in pairs(TAG) do
									v.destroy()
								end
								for _,z in pairs(global.dyworld.players) do
									local player = game.players[z.id]
									Refresh_Story_GUI(player, z.id)
								end
							end
						else
							if getDistance(Posx, PosY, v.PosX, v.PosY) <= 10 then
								v.done = true
								global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
								local TAG = game.forces.player.find_chart_tags(v.Surface, {{(Posx-15), (PosY-15)},{(Posx+15), (PosY+15)}})
								for k,v in pairs(TAG) do
									v.destroy()
								end
								for _,z in pairs(global.dyworld.players) do
									local player = game.players[z.id]
									Refresh_Story_GUI(player, z.id)
								end
							end
						end
					end
				end
			end
		elseif type == "pre-mining-item" then
			local player = game.players[event.player_index]
			local force = player.force
			local id = event.player_index
			local type = event.entity.type
			local name = event.entity.name
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "corpse") then
					if (name == "character-corpse" and type == "character-corpse" and v.done == false) then
						v.done = true
						global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						for _,z in pairs(global.dyworld.players) do
							local player = game.players[z.id]
							Refresh_Story_GUI(player, z.id)
						end
					end
				end
			end
		elseif type == "building-player" then
			local player = game.players[event.player_index]
			local force = player.force
			local id = event.player_index
			local name = event.created_entity.name
			local position = event.created_entity.position
			local type = event.created_entity.type
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "build" and v.type_2 == "name") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
						for _,z in pairs(global.dyworld.players) do
							local player = game.players[z.id]
							Refresh_Story_GUI(player, z.id)
						end
					end
				end
			end
		elseif type == "building-tile" then
			local name = event.tile.name
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "build" and v.type_2 == "name") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
						for _,z in pairs(global.dyworld.players) do
							local player = game.players[z.id]
							Refresh_Story_GUI(player, z.id)
						end
					end
				end
			end
		elseif type == "building-robot" then
			local name = event.created_entity.name
			local position = event.created_entity.position
			local type = event.created_entity.type
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "build" and v.type_2 == "name") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
						for _,z in pairs(global.dyworld.players) do
							local player = game.players[z.id]
							Refresh_Story_GUI(player, z.id)
						end
					end
				end
			end
		elseif type == "scripted-build" then
			local name = event.entity.name
			local position = event.entity.position
			local type = event.entity.type
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "build" and v.type_2 == "name") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
						for _,z in pairs(global.dyworld.players) do
							local player = game.players[z.id]
							Refresh_Story_GUI(player, z.id)
						end
					end
				end
			end
		elseif type == "crafting" then
			local player = game.players[event.player_index]
			local force = player.force
			local id = event.player_index
			local name = event.item_stack.name
			local count = event.item_stack.count
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "craft" and v.type_2 == "item") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + count
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
						for _,z in pairs(global.dyworld.players) do
							local player = game.players[z.id]
							Refresh_Story_GUI(player, z.id)
						end
					end
				end
			end
		elseif type == "research" then
			local name = event.research.name
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "research" and v.type_2 == "name") then
					if (name == v.name and v.done == false) then
						v.done = true
						global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						for _,z in pairs(global.dyworld.players) do
							local player = game.players[z.id]
							Refresh_Story_GUI(player, z.id)
						end
					end
				end
			end
		elseif type == "sector-scan" then
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "world" and v.type_2 == "radar-scan") then
					if (v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
						for _,z in pairs(global.dyworld.players) do
							local player = game.players[z.id]
							Refresh_Story_GUI(player, z.id)
						end
					end
				end
			end
		elseif type == "chunk-gen" then
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "world" and v.type_2 == "chunk") then
					if (v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
						for _,z in pairs(global.dyworld.players) do
							local player = game.players[z.id]
							Refresh_Story_GUI(player, z.id)
						end
					end
				end
			end
		elseif type == "launch-rocket" then
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "launch" and v.type_2 == "rocket") then
					if (v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
						for _,z in pairs(global.dyworld.players) do
							local player = game.players[z.id]
							Refresh_Story_GUI(player, z.id)
						end
					end
				end
			end
		elseif type == "died" then
			local force = event.force  -- force that kill
			local killer = event.cause -- cause of the kill
			local type_killed = event.entity.type
			local name = event.entity.name
			local position = event.entity.position
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "died" and v.type_2 == "name") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
						for _,z in pairs(global.dyworld.players) do
							local player = game.players[z.id]
							Refresh_Story_GUI(player, z.id)
						end
					end
				end
				if (v.type_1 == "died" and v.type_2 == "type") then
					if (type_killed == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
						for _,z in pairs(global.dyworld.players) do
							local player = game.players[z.id]
							Refresh_Story_GUI(player, z.id)
						end
					end
				end
			end
		end
		if (global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] + global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2]) <= 0 then
			Phase_Forward()
			for _,z in pairs(global.dyworld.players) do
				local player = game.players[z.id]
				Refresh_Story_GUI(player, z.id)
			end
		end
	end
end

local function Rand(Value)
	local Var_1 = math.floor(Value * 0.5)
	local Var_2 = math.floor(Value * 1.5)
	return math.floor(math.random(Var_1, Var_2))
end

function Populate_Side_Objectives_Table_Startup(Reset)
	if not global.dyworld.story.side_objectives then global.dyworld.story.side_objectives = {} end
	if not global.dyworld.story.side_objectives.done then global.dyworld.story.side_objectives.done = {} end
	if not global.dyworld.story.side_objectives.all then global.dyworld.story.side_objectives.all = {} end
	if not global.dyworld.story.side_objectives.unlocked then global.dyworld.story.side_objectives.unlocked = {} end
	if not global.dyworld.story.side_objectives.locked then global.dyworld.story.side_objectives.locked = {} end
	if not global.dyworld.story.side_objectives.locked_amount then global.dyworld.story.side_objectives.locked_amount = 0 end
	if not global.dyworld.story.side_objectives.unlocked_amount then global.dyworld.story.side_objectives.unlocked_amount = 0 end
	if not global.dyworld.story.side_objectives.done_amount then global.dyworld.story.side_objectives.done_amount = 0 end

	if Reset then
		global.dyworld.story.side_objectives = {}
		global.dyworld.story.side_objectives.done = {}
		global.dyworld.story.side_objectives.all = {}
		global.dyworld.story.side_objectives.unlocked = {}
		global.dyworld.story.side_objectives.locked = {}
		global.dyworld.story.side_objectives.locked_amount = 0
		global.dyworld.story.side_objectives.unlocked_amount = 0
		global.dyworld.story.side_objectives.done_amount = 0
	end

	for k,v in pairs(Objectives_Side) do
		global.dyworld.story.side_objectives.locked[k] = v
		global.dyworld.story.side_objectives.all[k] = true
		global.dyworld.story.side_objectives.locked_amount = global.dyworld.story.side_objectives.locked_amount + 1
	end
	for k,v in pairs(global.dyworld.story.side_objectives.locked) do
		if v.pre_req == "none" then
			v.unlocked = true
		else
			v.unlocked = false
		end
		v.amount_needed_base = Rand(v.amount_needed_base)
		if v.unlocked == true then
			v.amount_done = 0
			v.done = false
			global.dyworld.story.side_objectives.unlocked[k] = v
			global.dyworld.story.side_objectives.locked[k] = nil
			global.dyworld.story.side_objectives.unlocked_amount = global.dyworld.story.side_objectives.unlocked_amount + 1
			global.dyworld.story.side_objectives.locked_amount = global.dyworld.story.side_objectives.locked_amount - 1
		end
	end
	for k,v in pairs(global.dyworld.story.side_objectives.unlocked) do
		if Dy_Sett.Difficulty == "Easy" then
			v.amount_needed = math.floor(v.amount_needed_base * 0.5)
		elseif Dy_Sett.Difficulty == "Normal" then
			v.amount_needed = math.floor(v.amount_needed_base * 1)
		elseif Dy_Sett.Difficulty == "Hard" then
			v.amount_needed = math.floor(v.amount_needed_base * 2)
		end
	end
end

function Repopulate_Side_Objectives_Table()
	if not global.dyworld.story.side_objectives then Populate_Side_Objectives_Table_Startup(nil) end
	if not global.dyworld.story.side_objectives.all then Populate_Side_Objectives_Table_Startup(true) end

	for k,v in pairs(Objectives_Side) do
		if not global.dyworld.story.side_objectives.all[k] then
			global.dyworld.story.side_objectives.locked[k] = v
			global.dyworld.story.side_objectives.all[k] = true
			global.dyworld.story.side_objectives.locked_amount = global.dyworld.story.side_objectives.locked_amount + 1
		end
	end
	for k,v in pairs(global.dyworld.story.side_objectives.locked) do
		if v.pre_req == "none" then
			v.unlocked = true
		else
			v.unlocked = false
		end
		v.amount_needed_base = Rand(v.amount_needed_base)
		if v.unlocked == true then
			v.amount_done = 0
			v.done = false
			global.dyworld.story.side_objectives.unlocked[k] = v
			global.dyworld.story.side_objectives.locked[k] = nil
			global.dyworld.story.side_objectives.unlocked_amount = global.dyworld.story.side_objectives.unlocked_amount + 1
			global.dyworld.story.side_objectives.locked_amount = global.dyworld.story.side_objectives.locked_amount - 1
		end
	end
	for k,v in pairs(global.dyworld.story.side_objectives.unlocked) do
		if Dy_Sett.Difficulty == "Easy" then
			v.amount_needed = math.floor(v.amount_needed_base * 0.5)
		elseif Dy_Sett.Difficulty == "Normal" then
			v.amount_needed = math.floor(v.amount_needed_base * 1)
		elseif Dy_Sett.Difficulty == "Hard" then
			v.amount_needed = math.floor(v.amount_needed_base * 2)
		end
	end
end

function Check_Side_Objective()
	for k,v in pairs(global.dyworld.story.side_objectives.unlocked) do
		if v.done == true then
			global.dyworld.story.side_objectives.done[k] = true
			for Name,Table in pairs(global.dyworld.story.side_objectives.locked) do
				if Table.pre_req == k then
					if Dy_Sett.Difficulty == "Easy" then
						Table.amount_needed = math.floor(Table.amount_needed_base * 0.5)
					elseif Dy_Sett.Difficulty == "Normal" then
						Table.amount_needed = math.floor(Table.amount_needed_base * 1)
					elseif Dy_Sett.Difficulty == "Hard" then
						Table.amount_needed = math.floor(Table.amount_needed_base * 2)
					end
					Table.amount_done = 0
					Table.done = false
					global.dyworld.story.side_objectives.unlocked[Name] = Table
					global.dyworld.story.side_objectives.locked[Name] = nil
					global.dyworld.story.side_objectives.unlocked_amount = global.dyworld.story.side_objectives.unlocked_amount + 1
					global.dyworld.story.side_objectives.locked_amount = global.dyworld.story.side_objectives.locked_amount - 1
				end
			end
			global.dyworld.story.side_objectives.unlocked[k] = nil
			global.dyworld.story.side_objectives.done_amount = global.dyworld.story.side_objectives.done_amount + 1
			global.dyworld.story.side_objectives.unlocked_amount = global.dyworld.story.side_objectives.unlocked_amount - 1
		end
	end
end

function Story_Side_Objectives(type_1, event, amount, E_Name)
	if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives_side and global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] >= 1 then
		if type_1 == "build" then
			local name = event.created_entity.name
			local type = event.created_entity.type
			for k,v in pairs(global.dyworld.story.side_objectives.unlocked) do
				if (v.objective_type == "build-type") then
					if (type == v.name and v.done == false) then
						v.amount_done = v.amount_done + amount
						if v.amount_done >= v.amount_needed then
							v.done = true
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] >= 1 then
								global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] - 1
								Check_Side_Objective()
							end
						end
						for _,z in pairs(global.dyworld.players) do
							local player = game.players[z.id]
							Refresh_Story_GUI(player, z.id)
						end
					end
				elseif (v.objective_type == "build-name") then
					if (name == v.name and v.done == false) then
						v.amount_done = v.amount_done + amount
						if v.amount_done >= v.amount_needed then
							v.done = true
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] >= 1 then
								global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] - 1
								Check_Side_Objective()
							end
							for _,z in pairs(global.dyworld.players) do
								local player = game.players[z.id]
								Refresh_Story_GUI(player, z.id)
							end
						end
					end
				end
			end
		elseif type_1 == "build-tile" then
			local name = event.tile.name
			for k,v in pairs(global.dyworld.story.side_objectives.unlocked) do
				if (v.objective_type == "build-tile-name") then
					if (name == v.name and v.done == false) then
						v.amount_done = v.amount_done + amount
						if v.amount_done >= v.amount_needed then
							v.done = true
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] >= 1 then
								global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] - 1
								Check_Side_Objective()
							end
							for _,z in pairs(global.dyworld.players) do
								local player = game.players[z.id]
								Refresh_Story_GUI(player, z.id)
							end
						end
					end
				end
			end
		elseif type_1 == "build-2" then
			local name = event.entity.name
			local type = event.entity.type
			for k,v in pairs(global.dyworld.story.side_objectives.unlocked) do
				if (v.objective_type == "build-type") then
					if (type == v.name and v.done == false) then
						v.amount_done = v.amount_done + amount
						if v.amount_done >= v.amount_needed then
							v.done = true
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] >= 1 then
								global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] - 1
								Check_Side_Objective()
							end
							for _,z in pairs(global.dyworld.players) do
								local player = game.players[z.id]
								Refresh_Story_GUI(player, z.id)
							end
						end
					end
				elseif (v.objective_type == "build-name") then
					if (name == v.name and v.done == false) then
						v.amount_done = v.amount_done + amount
						if v.amount_done >= v.amount_needed then
							v.done = true
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] >= 1 then
								global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] - 1
								Check_Side_Objective()
							end
							for _,z in pairs(global.dyworld.players) do
								local player = game.players[z.id]
								Refresh_Story_GUI(player, z.id)
							end
						end
					end
				end
			end
		elseif type_1 == "kill" then
			local name = event.entity.name
			local type = event.entity.type
			for k,v in pairs(global.dyworld.story.side_objectives.unlocked) do
				if (v.objective_type == "kill-type") then
					if (type == v.name and v.done == false) then
						v.amount_done = v.amount_done + amount
						if v.amount_done >= v.amount_needed then
							v.done = true
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] >= 1 then
								global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] - 1
								Check_Side_Objective()
							end
							for _,z in pairs(global.dyworld.players) do
								local player = game.players[z.id]
								Refresh_Story_GUI(player, z.id)
							end
						end
					end
				elseif (v.objective_type == "kill-name") then
					if (name == v.name and v.done == false) then
						v.amount_done = v.amount_done + amount
						if v.amount_done >= v.amount_needed then
							v.done = true
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] >= 1 then
								global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] - 1
								Check_Side_Objective()
							end
							for _,z in pairs(global.dyworld.players) do
								local player = game.players[z.id]
								Refresh_Story_GUI(player, z.id)
							end
						end
					end
				end
			end
		elseif type_1 == "scanning" then
			for k,v in pairs(global.dyworld.story.side_objectives.unlocked) do
				if (v.objective_type == "scanning") then
					if (v.done == false) then
						v.amount_done = v.amount_done + amount
						if v.amount_done >= v.amount_needed then
							v.done = true
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] >= 1 then
								global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] - 1
								Check_Side_Objective()
							end
							for _,z in pairs(global.dyworld.players) do
								local player = game.players[z.id]
								Refresh_Story_GUI(player, z.id)
							end
						end
					end
				end
			end
		elseif type_1 == "rocket" then
			for k,v in pairs(global.dyworld.story.side_objectives.unlocked) do
				if (v.objective_type == "rockets") then
					if (v.done == false) then
						v.amount_done = v.amount_done + amount
						if v.amount_done >= v.amount_needed then
							v.done = true
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] >= 1 then
								global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] - 1
								Check_Side_Objective()
							end
							for _,z in pairs(global.dyworld.players) do
								local player = game.players[z.id]
								Refresh_Story_GUI(player, z.id)
							end
						end
					end
				end
			end
		elseif type_1 == "satellite" then
			for k,v in pairs(global.dyworld.story.side_objectives.unlocked) do
				if (v.objective_type == "satellite") then
					if (E_Name == v.name and v.done == false) then
						v.amount_done = v.amount_done + amount
						if v.amount_done >= v.amount_needed then
							v.done = true
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] >= 1 then
								global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] - 1
								Check_Side_Objective()
							end
							for _,z in pairs(global.dyworld.players) do
								local player = game.players[z.id]
								Refresh_Story_GUI(player, z.id)
							end
						end
					end
				end
			end
		end
	end
	if (global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] + global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2]) <= 0 then
		Phase_Forward()
		for _,z in pairs(global.dyworld.players) do
			local player = game.players[z.id]
			Refresh_Story_GUI(player, z.id)
		end
	end
end