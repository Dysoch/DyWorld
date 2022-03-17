TICKS_PER_SECOND = 60
SECONDS_PER_MINUTE = 60
TICKS_PER_MINUTE = TICKS_PER_SECOND * SECONDS_PER_MINUTE
MINUTES_PER_HOUR = 60
TICKS_PER_HOUR = TICKS_PER_MINUTE * MINUTES_PER_HOUR
HOURS_PER_DAY = 24
TICKS_PER_DAY = TICKS_PER_HOUR * HOURS_PER_DAY
DAYS_PER_YEAR = 365
TICKS_PER_YEAR = TICKS_PER_DAY * DAYS_PER_YEAR


function GetFormattedPlayedTime()
	local seconds 	= math.floor(game.ticks_played % TICKS_PER_SECOND)
	local minutes 	= math.floor((game.ticks_played % TICKS_PER_HOUR) / TICKS_PER_MINUTE)
	local hours 	= math.floor((game.ticks_played % TICKS_PER_DAY) / TICKS_PER_HOUR)
	local days 		= math.floor((game.ticks_played % TICKS_PER_YEAR) / TICKS_PER_DAY)
	local years 	= math.floor(game.ticks_played / TICKS_PER_YEAR)

	local secondspad = ""
	if seconds < 10 then secondspad = "0" end
	
	local minutespad = ""
	if minutes < 10 then minutespad = "0" end

	local timestamp = years .. "y " .. days .. "d " .. hours .. ":" .. minutespad .. minutes .. ":" .. secondspad .. seconds
	return timestamp
end

function _FixResearchForForce(player_force)
	if player_force.research_enabled == false then
		for _,player in pairs(player_force) do
			player.force.enable_research()
			DyLog(Time..": Research Unlocked")
		end
	end
end

function _FixResearchForAllForces()
	for _,force in pairs(game.forces) do
		_FixResearchForForce(force)
	end
end

function EnableTechnologyResearchForAllForces()
	for _,force in pairs(game.forces) do
		EnableTechnologyResearchForForce(force)
	end
end

function EnableTechnologyResearchForForce(force)
	if not global.dyworld.game_stats.labs then global.dyworld.game_stats.labs = 0 end
	global.dyworld.game_stats.labs = global.dyworld.game_stats.labs + 1
end

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

function _Event_on_force_added_entity(event, force, entity, custom_difficulty_change_amount)
	local name = entity.name
	local position = entity.position
	local type = entity.type

	if not custom_difficulty_change_amount then custom_difficulty_change_amount = 0 end
	
	----- Global counter -----
	if not global.dyworld.game_stats.build_names[name] then
		global.dyworld.game_stats.build_names[name] = 1
	else
		global.dyworld.game_stats.build_names[name] = global.dyworld.game_stats.build_names[name] + 1
	end
	
	if not global.dyworld.game_stats.build then global.dyworld.game_stats.build = {} end
	if not global.dyworld.game_stats.build[name] then
		global.dyworld.game_stats.build[name] = true
	end
	
	----- Building Placement -----
	if Entity_Check(type) and name ~= "entity-ghost" and name ~= "landfill" then
		local BuildingTable = {posx = position.x, posy = position.y}
		local surface = event.created_entity.surface.name
		if not global.dyworld.game_stats.building_locations[surface] then global.dyworld.game_stats.building_locations[surface] = {} end
		table.insert(global.dyworld.game_stats.building_locations[surface], BuildingTable)
		--debug("build at: "..position.x..", "..position.y)
	end

	----- Ghost Building -----
	if name == "entity-ghost" then
		if not global.dyworld.game_stats.ghosts then global.dyworld.game_stats.ghosts = 0 end
		global.dyworld.game_stats.ghosts = global.dyworld.game_stats.ghosts + 1
	end

	----- Mining Network Building -----
	if Dy_Find_Str(name, "asteroid-network-interface") then
		if not global.dyworld.game_stats.space_mining.interfaces then global.dyworld.game_stats.space_mining.interfaces = {} end
        for Metal_Name,Metal_Table in pairs(Dy_Metals) do
            if Dy_Find_Str(name, Metal_Name) then
                if Dy_Find_Str(name, "-impure") then
                    if not global.dyworld.game_stats.space_mining.interfaces.impure then global.dyworld.game_stats.space_mining.interfaces.impure = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name] then global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name] = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs then global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts then global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts = 0 end
                    global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts = global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts + 1
                    debug("Built: "..Metal_Name.." interface (Impure)")
                    local surface = event.created_entity.surface.name
                    local BuildingTable = {PosX = position.x, PosY = position.y, Surface = surface}
                    table.insert(global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs, BuildingTable)
                elseif Dy_Find_Str(name, "-pure") then
                    if not global.dyworld.game_stats.space_mining.interfaces.pure then global.dyworld.game_stats.space_mining.interfaces.pure = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name] then global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name] = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs then global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs = {} end
                    if not global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts then global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts = 0 end
                    global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts = global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts + 1
                    debug("Built: "..Metal_Name.." interface (Pure)")
                    local surface = event.created_entity.surface.name
                    local BuildingTable = {PosX = position.x, PosY = position.y, Surface = surface}
                    table.insert(global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs, BuildingTable)
                end
            end
        end
	end
	
	----- Story Unlocks -----
	if global.dyworld_story then
		----- Story Objective Check -----
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("building-player", event)
			Story_Side_Objectives("build", event, 1)
		end
		
		----- Minimap -----
		if (type == "radar") then
			global.dyworld.game_stats.radars = global.dyworld.game_stats.radars + 1
			for _,v in pairs(global.dyworld.players) do
				if not game.players[v.id].minimap_enabled then
					UnlockStoryTechnology("story_tech_minimap")
					game.players[v.id].minimap_enabled = true
					game.forces.player.zoom_to_world_enabled = true
				end
			end
			if (name == "radar-1" and not global.dyworld.game_stats.attack_warning_2) then
				global.dyworld.game_stats.attack_warning_2 = true
			end
			if (name == "radar-2" and not global.dyworld.game_stats.attack_warning_3) then
				global.dyworld.game_stats.attack_warning_2 = true
				global.dyworld.game_stats.attack_warning_3 = true
			end
		end
		----- Inserter Tiers -----
		if (type == "inserter") then
			global.dyworld.game_stats.inserters = global.dyworld.game_stats.inserters + 1
			InserterCheck(global.dyworld.game_stats.inserters)
		end

		----- Research -----
		if (type == "lab") then
			-- _ReenableResearch(player.force)
		end

		----- Update Difficulty -----
		DyWorld_Custom_Difficulty_Change(custom_difficulty_change_amount)
	end
end

function _Event_on_force_removed_entity(event, force, entity, custom_difficulty_change_amount)
	local position = entity.position
	local type = entity.type
	local name = entity.name
	local surface = entity.surface
	local surface_name = surface.name

	if not custom_difficulty_change_amount then custom_difficulty_change_amount = 0 end

	----- Building Placement -----
	if Entity_Check(type) then
		if not global.dyworld.game_stats.building_locations[surface_name] then global.dyworld.game_stats.building_locations[surface_name] = {} end
		for k,v in pairs(global.dyworld.game_stats.building_locations[surface_name]) do
			if (position.x == v.posx and position.y == v.posy) then
				table.remove(global.dyworld.game_stats.building_locations[surface_name], k)
				break
			end
		end
	end

	----- Mining Network Building -----
	if Dy_Find_Str(name, "asteroid-network-interface") then
        for Metal_Name,Metal_Table in pairs(Dy_Metals) do
            if Dy_Find_Str(name, Metal_Name) then
                if Dy_Find_Str(name, "-impure") then
                    if global.dyworld.game_stats.space_mining.interfaces and global.dyworld.game_stats.space_mining.interfaces.impure and global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name] and global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs then
                        for k,v in pairs(global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs) do
                            if (position.x == v.PosX and position.y == v.PosY and surface_name == v.Surface) then
                                table.remove(global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs, k)
                                global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts = global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts - 1
                                break
                            end
                        end
                    end
                elseif Dy_Find_Str(name, "-pure") then
                    if global.dyworld.game_stats.space_mining.interfaces and global.dyworld.game_stats.space_mining.interfaces.pure and global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name] and global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs then
                        for k,v in pairs(global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs) do
                            if (position.x == v.PosX and position.y == v.PosY and surface_name == v.Surface) then
                                table.remove(global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs, k)
                                global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts = global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts - 1
                                break
                            end
                        end
                    end
                end
            end
        end
	end

	----- Story Unlocks -----
	if global.dyworld_story then
		----- Minimap -----
		if (type == "radar") then
			global.dyworld.game_stats.radars = global.dyworld.game_stats.radars - 1
			if global.dyworld.game_stats.radars < 0 then global.dyworld.game_stats.radars = 0 end
			if (
				global.dyworld.game_stats.radars <= 0 and
				global.dyworld.game_stats.rockets_launched < 5
			) then
				for k,v in pairs(global.dyworld.players) do
					if game.players[v.id].minimap_enabled then
						LockStoryTechnology("story_tech_minimap", false)
						game.players[v.id].minimap_enabled = false
						game.forces.player.zoom_to_world_enabled = false
					end
				end
			end
		end
		----- Inserter Tiers -----
		if (type == "inserter") then
			global.dyworld.game_stats.inserters = global.dyworld.game_stats.inserters - 1
			if global.dyworld.game_stats.inserters < 0 then global.dyworld.game_stats.inserters = 0 end
			InserterCheck(global.dyworld.game_stats.inserters)
		end
		----- Research -----
		if (type == "lab") then
			global.dyworld.game_stats.labs = global.dyworld.game_stats.labs - 1
			if global.dyworld.game_stats.labs < 0 then global.dyworld.game_stats.labs = 0 end
			-- do something?
		end

		----- Update Difficulty -----
		DyWorld_Custom_Difficulty_Change(custom_difficulty_change_amount)
	end
end

function _Event_on_force_built_tile(event, force, tile, custom_difficulty_change_amount)
	local name = tile.name
	
	if not custom_difficulty_change_amount then custom_difficulty_change_amount = 0 end

	----- Global counter -----
	if not global.dyworld.game_stats.build_names[name] then
		global.dyworld.game_stats.build_names[name] = 1
	else
		global.dyworld.game_stats.build_names[name] = global.dyworld.game_stats.build_names[name] + 1
	end
	
	if not global.dyworld.game_stats.build then global.dyworld.game_stats.build = {} end
	if not global.dyworld.game_stats.build[name] then
		global.dyworld.game_stats.build[name] = true
	end
	
	if global.dyworld_story then
		----- Story Objective Check -----
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("building-tile", event)
			Story_Side_Objectives("build-tile", event, 1)
		end

		-- Update Difficulty
		DyWorld_Custom_Difficulty_Change(custom_difficulty_change_amount)
	end
end

function GetAdjustedObjectiveAmount(objective)
	local result = objective.amount_needed

	if (
		objective.type_1 and
		(
			objective.type_1 == "build" or 
			objective.type_1 == "craft" or
			objective.type_1 == "died" or
			objective.type_1 == "launch" or
			objective.type_1 == "looted"
		)
		or
		(
			objective.type_1 and
			objective.type_1 == "world" and
			objective.type_2 and
			objective.type_2 == "radar-scan"
		)
	 ) then
		if objective.amount_needed and not objective.set_stone then
			if settings.startup["DyWorld_Difficulty"].value == "Easy" then
				if objective.random then
					local standard = math.floor(objective.amount_needed * 0.5)
					local low_end = math.floor(standard * 0.5)
					local high_end = math.floor(standard * 1.5)
					result = math.floor(math.random(low_end, high_end))
				else
					result = math.floor(objective.amount_needed * 0.5)
				end
			elseif settings.startup["DyWorld_Difficulty"].value == "Normal" then
				if objective.random then
					local standard = objective.amount_needed
					local low_end = math.floor(standard * 0.5)
					local high_end = math.floor(standard * 1.5)
					result = math.floor(math.random(low_end, high_end))
				end
				-- result already is the right amount from earlier, no need to set it here
			elseif settings.startup["DyWorld_Difficulty"].value == "Hard" then
				if objective.random then
					local standard = math.floor(objective.amount_needed * 1.75)
					local low_end = math.floor(standard * 0.5)
					local high_end = math.floor(standard * 1.5)
					result = math.floor(math.random(low_end, high_end))
				else
					result = math.floor(objective.amount_needed * 1.75)
				end
			end
		end
	end

	return result
end

function Phase_Forward()
	if global.dyworld_story then
	
		-- checks side objectives, and populates in act 1 phase 2. this is done because other mods can then add more side objectives
		if not global.dyworld.story.side_objectives then
			Populate_Side_Objectives_Table_Startup()
		end

		local story_tech_name = "story_tech_act" .. global.dyworld.story.act .. "-" .. global.dyworld.story.phase

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
		local Main_Amount = Story_tablelength(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives)
		local Side_Amount = 0
		if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives_side then
			Side_Amount = 10 - Main_Amount
		end
		local Total_Amount = Main_Amount + Side_Amount
		global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount = {Main_Amount, Side_Amount, Total_Amount}

		-- Apply randomisation and difficulty changes to amount from objectives
		for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
			if v.amount_needed then
				v.amount_needed = GetAdjustedObjectiveAmount(v)
			end
		end

		-- Check technologies already researched against objectives --
		for k,v in pairs(game.forces.player.technologies) do
			if v.researched then
				Story_Objectives_Research(v.name)
			end
		end

		-- Location & Enemy Location Objectives
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
		-- player start of phase sound
		if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].sounds then
			for _,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].sounds) do
				for _,player in pairs(game.players) do
					player.play_sound{path = v}
				end
			end
		end

		-- specific phase events
		-- HACK: Pause the story, till more is added in
		if (global.dyworld.story.act == 3 and global.dyworld.story.phase == 6) then
			global.dyworld.game_stats.story_pause = true
		end
		if (global.dyworld.story.act == 1) then
			if (global.dyworld.story.phase == 10) then
				global.dyworld.game_stats.attack_warning_1 = true
			end
		elseif (global.dyworld.story.act == 2) then
			if (global.dyworld.story.phase == 1) then
				game.surfaces["nauvis"].create_entity{name = ("atomic-artillery-projectile"), position = {(math.random(-250,250)),(math.random(-250,250))}, force = game.forces.enemy, speed = 2.5, target = {(math.random(-10,10)),(math.random(-10,10))}}
				game.surfaces["nauvis"].create_entity{name = ("atomic-artillery-projectile"), position = {(math.random(-500,500)),(math.random(-500,500))}, force = game.forces.enemy, speed = 2.5, target = {250,250}}
				game.surfaces["nauvis"].create_entity{name = ("atomic-artillery-projectile"), position = {(math.random(-500,500)),(math.random(-500,500))}, force = game.forces.enemy, speed = 2.5, target = {250,-250}}
				game.surfaces["nauvis"].create_entity{name = ("atomic-artillery-projectile"), position = {(math.random(-500,500)),(math.random(-500,500))}, force = game.forces.enemy, speed = 2.5, target = {-250,-250}}
				game.surfaces["nauvis"].create_entity{name = ("atomic-artillery-projectile"), position = {(math.random(-500,500)),(math.random(-500,500))}, force = game.forces.enemy, speed = 2.5, target = {-250,250}}
				global.dyworld.game_stats.difficulty = 1
			end
		elseif (global.dyworld.story.act == 3) then
			if (global.dyworld.story.phase == 1) then
				global.dyworld.game_stats.difficulty = 1
			elseif (global.dyworld.story.phase == 10) then
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

		UnlockStoryTechnology(story_tech_name, false)

		-- Autosave Feature
		if settings.global["DyWorld_Autosave_Story"].value then
			local timestamp = GetFormattedPlayedTime()
			game.auto_save("DyWorld-Dynamics Act "..global.dyworld.story.act.." Phase "..global.dyworld.story.phase .. " " .. timestamp)
		end
	end
end

function UnlockStoryTechnology(name, hide_gain)
	local needs_gain_printed = false
	for _,player in pairs(game.players) do
		if player.force.technologies[name] then
			if player.force.technologies[name].researched == false then
				player.force.technologies[name].researched = true
				needs_gain_printed = true
			end
		else
			debug("Technology unlock failed! Does it exist? ("..name..")")
		end
	end
	if not hide_gain and needs_gain_printed then
		for effect_i,effect_v in pairs(game.technology_prototypes[name].effects) do
			if effect_v.type == "unlock-recipe" then
				AllPlayersPrint({"looped-name.gained-knowledge", effect_v.recipe})
			elseif effect_v.type == "give-item" then
				AllPlayersPrint({"looped-name.gained-item", effect_v.count, effect_v.item})
			elseif effect_v.type == "nothing" then
				if (
					Story_ExtraTechs_Table_Base[name] and
					Story_ExtraTechs_Table_Base[name].effects and
					Story_ExtraTechs_Table_Base[name].effects[effect_i] and
					Story_ExtraTechs_Table_Base[name].effects[effect_i].effect_description
				) then
					AllPlayersPrint({"looped-name.gained-ability", Story_ExtraTechs_Table_Base[name].effects[effect_i].effect_description})
				else
					AllPlayersPrint({"looped-name.gained-ability", game.technology_prototypes[name].localised_name})
				end
			end
		end
	end
end

function LockStoryTechnology(name, hide_loss)
	local needs_loss_printed = false
	for _,player in pairs(game.players) do
		if player.force.technologies[name] then
			if player.force.technologies[name].researched == true then
				player.force.technologies[name].researched = false
				needs_loss_printed = true
			end
		else
			debug("Technology unlock failed! Does it exist? ("..name..")")
		end
	end
	if not hide_loss and needs_loss_printed then
		for effect_i,effect_v in pairs(game.technology_prototypes[name].effects) do
			if effect_v.type == "unlock-recipe" then
				AllPlayersPrint({"looped-name.lost-knowledge", effect_v.recipe})
			elseif effect_v.type == "nothing" then
				if (
					Story_ExtraTechs_Table_Base[name] and
					Story_ExtraTechs_Table_Base[name].effects and
					Story_ExtraTechs_Table_Base[name].effects[effect_i] and
					Story_ExtraTechs_Table_Base[name].effects[effect_i].effect_description
				) then
						AllPlayersPrint({"looped-name.lost-ability", Story_ExtraTechs_Table_Base[name].effects[effect_i].effect_description})
				else
					AllPlayersPrint({"looped-name.lost-ability", game.technology_prototypes[name].localised_name})
				end
			end
		end
	end
end

function FixupUnlockedStoryTechnologies()
	_FixResearchForAllForces()
	if global.dyworld_story then
		UnlockStoryTechnology("story_tech_act0", true)

		for act_k,act_v in pairs(Story_Table_Base) do
			for phase_k,_ in pairs(act_v) do
				if (
					(act_k < global.dyworld.story.act) or
					(act_k == global.dyworld.story.act and phase_k < global.dyworld.story.phase)
				) then
					local story_tech_name = "story_tech_act" .. act_k .. "-" .. phase_k
					UnlockStoryTechnology(story_tech_name, true)
				end
			end
		end
	else
		for act_k,act_v in pairs(Story_Table_Base) do
			for phase_k,_ in pairs(act_v) do
				local story_tech_name = "story_tech_act" .. act_k .. "-" .. phase_k
				UnlockStoryTechnology(story_tech_name, true)
			end
		end
	end

	if global.dyworld.game_stats.radars < 0 then global.dyworld.game_stats.radars = 0 end
	if (
		global.dyworld.game_stats.radars > 0 or
		global.dyworld.game_stats.rockets_launched >= 5
	) then
		for _,v in pairs(global.dyworld.players) do
			if not game.players[v.id].minimap_enabled then
				UnlockStoryTechnology("story_tech_minimap")
				game.players[v.id].minimap_enabled = true
				game.forces.player.zoom_to_world_enabled = true
			end
		end
	end
	if (
		(
			(
				global.dyworld.game_stats.radars > 0 and
				global.dyworld.game_stats.build_names["radar-1"] and
				global.dyworld.game_stats.build_names["radar-1"] > 0
			)
			-- or
			-- (
			-- 	global.dyworld.game_stats.rockets_launched >= 5
			-- )
		) 
		and
		not global.dyworld.game_stats.attack_warning_2
	) then
		global.dyworld.game_stats.attack_warning_2 = true
	end
	if (
		(
			(
				global.dyworld.game_stats.radars > 0 and
				global.dyworld.game_stats.build_names["radar-2"] and
				global.dyworld.game_stats.build_names["radar-2"] > 0
			)
			or
			(
				global.dyworld.game_stats.rockets_launched >= 5
			)
		) 
		and
		not global.dyworld.game_stats.attack_warning_3
	) then
		global.dyworld.game_stats.attack_warning_2 = true
		global.dyworld.game_stats.attack_warning_3 = true
	end

	InserterCheck(global.dyworld.game_stats.inserters, true)
end

function Story_Objectives_Research(name)
	for _,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
		if (v.type_1 == "research" and v.type_2 == "name") then
			if (name == v.name and v.done == false) then
				v.done = true
                global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
			end
		end
	end
end

function Story_Objectives(type, event, Posx, PosY)
	if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives then
		if type == "mining-item" then
			local name = event.item_stack.name
			local count = event.item_stack.count
			for _,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "mine" and v.type_2 == "item") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + count
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
					end
				end
			end
		elseif type == "looted-item" then
			local player = game.players[event.player_index]
			local total_count = 0

			for _,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "looted" and v.type_2 == "item" and v.done == false) then
					for _,inv_type in pairs({
						defines.inventory.character_main,
						defines.inventory.character_guns,
						defines.inventory.character_ammo,
						defines.inventory.character_armor,
					}) do
						local inv = player.get_inventory(inv_type)
						local inv_count = inv.get_item_count(v.name)

						total_count = total_count + inv_count
					end

					v.amount_done = total_count
					if v.amount_done >= v.amount_needed then
						v.done = true
						global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
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
								for _,v in pairs(TAG) do
									v.destroy()
								end
							end
						else
							if getDistance(Posx, PosY, v.PosX, v.PosY) <= 10 then
								v.done = true
								global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
								local TAG = game.forces.player.find_chart_tags(v.Surface, {{(Posx-15), (PosY-15)},{(Posx+15), (PosY+15)}})
								for _,v in pairs(TAG) do
									v.destroy()
								end
							end
						end
					end
				end
			end
		elseif type == "pre-mining-item" then
			local type = event.entity.type
			local name = event.entity.name
			for _,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "corpse") then
					if (name == "character-corpse" and type == "character-corpse" and v.done == false) then
						v.done = true
						global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
					end
				end
			end
		elseif type == "building-player" then
			local name = event.created_entity.name
			for _,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "build" and v.type_2 == "name") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
					end
				end
			end
		elseif type == "building-tile" then
			local name = event.tile.name
			for _,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "build" and v.type_2 == "name") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
					end
				end
			end
		elseif type == "building-robot" then
			local name = event.created_entity.name
			for _,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "build" and v.type_2 == "name") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
					end
				end
			end
		elseif type == "scripted-build" then
			local name = event.entity.name
			for _,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "build" and v.type_2 == "name") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
					end
				end
			end
		elseif type == "crafting" then
			local name = event.item_stack.name
			local count = event.item_stack.count
			for _,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "craft" and v.type_2 == "item") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + count
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
					end
				end
			end
		elseif type == "research" then
			local name = event.research.name
			for _,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "research" and v.type_2 == "name") then
					if (name == v.name and v.done == false) then
						v.done = true
						global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
					end
				end
			end
		elseif type == "sector-scan" then
			for _,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "world" and v.type_2 == "radar-scan") then
					if (v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
					end
				end
			end
		elseif type == "chunk-gen" then
			for _,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "world" and v.type_2 == "chunk") then
					if (v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
					end
				end
			end
		elseif type == "launch-rocket" then
			for _,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "launch" and v.type_2 == "rocket") then
					if (v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
						end
					end
				end
			end
		elseif type == "died" then
			-- local force = event.force  -- force that kill
			-- local killer = event.cause -- cause of the kill
			local type_killed = event.entity.type
			local name = event.entity.name
			for _,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "died" and v.type_2 == "name") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] - 1
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
					end
				end
			end
		end
		if (global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] + global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2]) <= 0 then
			Phase_Forward()
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
			for _,v in pairs(global.dyworld.story.side_objectives.unlocked) do
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
						end
					end
				end
			end
		elseif type_1 == "build-tile" then
			local name = event.tile.name
			for _,v in pairs(global.dyworld.story.side_objectives.unlocked) do
				if (v.objective_type == "build-tile-name") then
					if (name == v.name and v.done == false) then
						v.amount_done = v.amount_done + amount
						if v.amount_done >= v.amount_needed then
							v.done = true
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] >= 1 then
								global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] - 1
								Check_Side_Objective()
							end
						end
					end
				end
			end
		elseif type_1 == "build-2" then
			local name = event.entity.name
			local type = event.entity.type
			for _,v in pairs(global.dyworld.story.side_objectives.unlocked) do
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
						end
					end
				end
			end
		elseif type_1 == "kill" then
			local name = event.entity.name
			local type = event.entity.type
			for _,v in pairs(global.dyworld.story.side_objectives.unlocked) do
				if (v.objective_type == "kill-type") then
					if (type == v.name and v.done == false) then
						v.amount_done = v.amount_done + amount
						if v.amount_done >= v.amount_needed then
							v.done = true
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] >= 1 then
								global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] - 1
								Check_Side_Objective()
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
						end
					end
				end
			end
		elseif type_1 == "scanning" then
			for _,v in pairs(global.dyworld.story.side_objectives.unlocked) do
				if (v.objective_type == "scanning") then
					if (v.done == false) then
						v.amount_done = v.amount_done + amount
						if v.amount_done >= v.amount_needed then
							v.done = true
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] >= 1 then
								global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] - 1
								Check_Side_Objective()
							end
						end
					end
				end
			end
		elseif type_1 == "rocket" then
			for _,v in pairs(global.dyworld.story.side_objectives.unlocked) do
				if (v.objective_type == "rockets") then
					if (v.done == false) then
						v.amount_done = v.amount_done + amount
						if v.amount_done >= v.amount_needed then
							v.done = true
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] >= 1 then
								global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] - 1
								Check_Side_Objective()
							end
						end
					end
				end
			end
		elseif type_1 == "satellite" then
			for _,v in pairs(global.dyworld.story.side_objectives.unlocked) do
				if (v.objective_type == "satellite") then
					if (E_Name == v.name and v.done == false) then
						v.amount_done = v.amount_done + amount
						if v.amount_done >= v.amount_needed then
							v.done = true
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] >= 1 then
								global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2] - 1
								Check_Side_Objective()
							end
						end
					end
				end
			end
		end
	end
	if (global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[1] + global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount[2]) <= 0 then
		Phase_Forward()
	end
end
