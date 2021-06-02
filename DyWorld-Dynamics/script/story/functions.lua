
function Find_Enemy()
	if game.surfaces[1].find_nearest_enemy{position={0,0}, max_distance = ((global.dyworld.game_stats.chunks / 4) * 32)} then
		return game.surfaces[1].find_nearest_enemy{position={0,0}, max_distance = ((global.dyworld.game_stats.chunks / 4) * 32)}
	else
		return nil
	end
end

function Difficulty_Change(ARG1, VAR1)
	if ARG1 == "+" then
		global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty + VAR1
	elseif ARG1 == "-" then
		if (global.dyworld.game_stats.difficulty - VAR1 >= 1) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty - VAR1
		end
	end
end

function Phase_Forward()
	if global.dyworld_story then
	if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase+1] then
		global.dyworld.story.phase = global.dyworld.story.phase + 1
		for k,v in pairs(Story_Recipes) do
			if (v.phase <= global.dyworld.story.phase and v.act <= global.dyworld.story.act) then
				for index,player in pairs(game.players) do
					if player.force.recipes[k] then
						if not player.force.recipes[k].enabled then
							player.force.recipes[k].enabled = true
						end
					else 
						debug("Recipe unlock failed! Does it exist? ("..k..")")
					end
				end
			end
		end
		global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase - 1].done = true
	else
		global.dyworld.story.act = global.dyworld.story.act + 1
		global.dyworld.story.phase = 1
	end
	for k,v in pairs(game.forces.player.technologies) do
		if v.researched then
			Story_Objectives_Research(v.name)
		end
	end
	if (global.dyworld.story.phase == 10 and global.dyworld.story.act == 1) then
		global.dyworld.game_stats.attack_warning_1 = true
		if not debugger then
			DyLog("DyDs-story.message-act-1-phase-10-1", "days")
			DyLog("DyDs-story.message-act-1-phase-10-2", true)
			DyLog("DyDs-story.message-act-1-phase-10-3", true)
			DyLog("DyDs-story.message-act-1-phase-10-4", true)
			DyLog("DyDs-story.message-act-1-phase-10-5", true)
		end
	end
	if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].location_objective then
		if (global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].location_objective_2 and global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].location_objective_2 == "enemy-find") then
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if v.type_1 == "position" then
					local Finder = Find_Enemy()
					if Finder == nil then
						v.done = true
						global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
					else
						local X = Finder.position.x
						local Y = Finder.position.y
						v.PosX = X
						v.PosY = Y
					
					end
				end
			end
		end
	end
	if (global.dyworld.story.phase == 8 and global.dyworld.story.act == 1) then
		for index,player in pairs(game.players) do
			player.play_sound{path = "DySound_future_sounds_1"}
		end
	end
	if (global.dyworld.story.phase == 10 and global.dyworld.story.act == 1) then
		for index,player in pairs(game.players) do
			player.play_sound{path = "DySound_drone_1"}
		end
	end
	if (global.dyworld.story.phase == 1 and global.dyworld.story.act == 2) then
		game.surfaces[1].create_entity{name = ("atomic-artillery-projectile"), position = {(math.random(-250,250)),(math.random(-250,250))}, force = game.forces.enemy, speed = 2.5, target = {(math.random(-10,10)),(math.random(-10,10))}}
		for index,player in pairs(game.players) do
			player.play_sound{path = "DySound_nuclear_alarm"}
		end
		global.dyworld.game_stats.difficulty = 1
	end
	if (global.dyworld.story.phase == 1 and global.dyworld.story.act == 3) then
		global.dyworld.game_stats.difficulty = 1
	end
	if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].message then
		if not debugger then
			DyLog(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].message, "days")
		end
	end
	if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].recipes then
		for index,player in pairs(game.players) do
			if settings.get_player_settings(index)["DyWorld_Phase_Messages"].value then
				DyLog("DyDs-story.phase-forward-1", true)
			end
		end
	else
		for index,player in pairs(game.players) do
			if settings.get_player_settings(index)["DyWorld_Phase_Messages"].value then
				DyLog("DyDs-story.phase-forward-2", true)
			end
		end
	end
	end
end

--for _,player in pairs(game.players) do player.force.recipes["basic-med-pack"].enabled == true end

function Reunlock_Recipes()
	if global.dyworld_story then
		for k,v in pairs(Story_Recipes) do
			if (v.phase <= global.dyworld.story.phase and v.act <= global.dyworld.story.act) or (v.act < global.dyworld.story.act) then
				for _,player in pairs(game.players) do
					if player.force.recipes[k] then
						if not player.force.recipes[k].enabled then
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
				global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
			end
		end
	end
end

function Story_Objectives(type, event, Posx, PosY)
	if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives[1] then
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
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
						end
					end
				end
			end
		elseif type == "mining-entity" then
		
		elseif type == "corpse-player" then
		
		elseif type == "position" then
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "position" and v.done == false) then
					if v.HigherDis then
						if getDistance(Posx, PosY, v.PosX, v.PosY) <= 100 then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
						end
					else
						if getDistance(Posx, PosY, v.PosX, v.PosY) <= 10 then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
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
						global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
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
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
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
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
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
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
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
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
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
						global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
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
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
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
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
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
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
						end
					end
				end
			end
		end
		if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left <= 0 then
			Phase_Forward()
		end
	end
end


	