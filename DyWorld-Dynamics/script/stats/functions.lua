


local function Food_Check(id)
	local food_per = Round((global.dyworld.players[id].food/global.dyworld.players[id].food_max), 2)
	return food_per
end

local function Water_Check(id)
	local water_per = Round((global.dyworld.players[id].water/global.dyworld.players[id].water_max), 2)
	return water_per
end

function Bonuses(id)
	----- Safety Measures -----
	if not global.dyworld.players[id].strength then global.dyworld.players[id].strength = 1 end
	if not global.dyworld.players[id].constitution then global.dyworld.players[id].constitution = 1 end
	if not global.dyworld.players[id].dexterity then global.dyworld.players[id].dexterity = 1 end
	if not global.dyworld.players[id].intelligence then global.dyworld.players[id].intelligence = 1 end
	if not global.dyworld.players[id].wisdom then global.dyworld.players[id].wisdom = 1 end
	if not global.dyworld.players[id].charisma then global.dyworld.players[id].charisma = 1 end
	
	if not global.dyworld.players[id].implant_strength then global.dyworld.players[id].implant_strength = 0 end
	if not global.dyworld.players[id].implant_constitution then global.dyworld.players[id].implant_constitution = 0 end
	if not global.dyworld.players[id].implant_dexterity then global.dyworld.players[id].implant_dexterity = 0 end
	if not global.dyworld.players[id].implant_intelligence then global.dyworld.players[id].implant_intelligence = 0 end
	if not global.dyworld.players[id].implant_wisdom then global.dyworld.players[id].implant_wisdom = 0 end
	if not global.dyworld.players[id].implant_charisma then global.dyworld.players[id].implant_charisma = 0 end
	
	if not global.dyworld.players[id].crafted then global.dyworld.players[id].crafted = 1 end
	if not global.dyworld.players[id].mined then global.dyworld.players[id].mined = 1 end
	if not global.dyworld.players[id].build then global.dyworld.players[id].build = 1 end
	if not global.dyworld.players[id].killed then global.dyworld.players[id].killed = 1 end
	if not global.dyworld.players[id].picked then global.dyworld.players[id].picked = 1 end
	if not global.dyworld.players[id].capsules then global.dyworld.players[id].capsules = 1 end
	if not global.dyworld.players[id].distance then global.dyworld.players[id].distance = 1 end
	if not global.dyworld.players[id].distance_car then global.dyworld.players[id].distance_car = 1 end
	if not global.dyworld.players[id].distance_train then global.dyworld.players[id].distance_train = 1 end
	if not global.dyworld.players[id].food then global.dyworld.players[id].food = 1000 end
	if not global.dyworld.players[id].food_max then global.dyworld.players[id].food_max = 1000 end
	if not global.dyworld.players[id].food_rate then global.dyworld.players[id].food_rate = 0.33 end
	if not global.dyworld.players[id].water then global.dyworld.players[id].water = 1000 end
	if not global.dyworld.players[id].water_max then global.dyworld.players[id].water_max = 1000 end
	if not global.dyworld.players[id].water_rate then global.dyworld.players[id].water_rate = 1.25 end
	
	if not global.dyworld.players[id].death_reduce then global.dyworld.players[id].death_reduce = 0 end
	
	if not global.dyworld.players[id].bonus_toggle then global.dyworld.players[id].bonus_toggle = {} end
	
	for k,v in pairs(Dy_Bonuses_Player) do
		if not global.dyworld.players[id].bonuses_player[k] then
			global.dyworld.players[id].bonuses_player[k] = {
				native = 0,
				stats = 0,
				implants = 0,
				research = 0,
				achievements = 0,
				death = 0,
				enabled = false,
				total = 0,
			}
			if k == "mining" then
				global.dyworld.players[id].bonuses_player[v].native = -0.5
			elseif k == "crafting" then
				global.dyworld.players[id].bonuses_player[v].native = -0.25
			end
		end
	end

		----- Level check -----
	local XP = global.dyworld.players[id].xp or 1
	local XP_Needed = global.dyworld.players[id].xp_levelup or 1
	if XP >= XP_Needed then
		global.dyworld.players[id].level = global.dyworld.players[id].level + 1
		global.dyworld.players[id].xp = global.dyworld.players[id].xp - global.dyworld.players[id].xp_levelup
		global.dyworld.players[id].xp_levelup = global.dyworld.players[id].xp_levelup * (1.25 + (math.random()))
	end
	local Level = global.dyworld.players[id].level or 1 --Level
	local glolevel = global.dyworld.players[id].level or 1 -- global level, to add in

		----- Players -----
	local playeramount = global.dyworld.game_stats.players
	
		----- Personal Stats -----
	local crafted = global.dyworld.players[id].crafted or 1 -- Crafted
	local mined = global.dyworld.players[id].mined or 1 -- Mined
	local build = global.dyworld.players[id].build or 1 -- Build
	local killed = global.dyworld.players[id].killed or 1 -- Killed
	local picked = global.dyworld.players[id].picked or 1 -- Picked Up
	local capsules = global.dyworld.players[id].capsules or 1 -- Capsules
	local distance = global.dyworld.players[id].distance or 1 -- Distance
	local distance_car = global.dyworld.players[id].distance_car or 1 -- Distance
	local distance_train = global.dyworld.players[id].distance_train or 1 -- Distance
	local death_player = global.dyworld.players[id].died or 1 --Death counter
	
		----- Food Stats -----
	local food_per = Round(((global.dyworld.players[id].food/global.dyworld.players[id].food_max) * 100), 2)
	local water_per = Round(((global.dyworld.players[id].water/global.dyworld.players[id].water_max) * 100), 2)
	
		----- Global Stats -----
	local glocraft = global.dyworld.game_stats.crafted_amount or 1 -- Global Crafted
	local glomined = global.dyworld.game_stats.mined_amount or 1 -- Global Mined
	local globuilt = global.dyworld.game_stats.build_amount or 1 -- Global Built
	local glokilled = global.dyworld.game_stats.killed_amount or 1 -- Global Killed
	local glopicked = global.dyworld.game_stats.picked_amount or 1 -- Global Picked Up
		----- Global Stats Average -----
	local A_glocraft = Round((global.dyworld.game_stats.crafted_amount / playeramount), 0) or 1 -- Global Crafted (Average)
	local A_glomined = Round((global.dyworld.game_stats.mined_amount / playeramount), 0) or 1 -- Global Mined (Average)
	local A_globuilt = Round((global.dyworld.game_stats.build_amount / playeramount), 0) or 1 -- Global Built (Average)
	local A_glokilled = Round((global.dyworld.game_stats.killed_amount / playeramount), 0) or 1 -- Global Killed (Average)
	local A_glopicked = Round((global.dyworld.game_stats.picked_amount / playeramount), 0) or 1 -- Global Picked Up (Average)
	
		----- Misc Stats -----
	local chunks = global.dyworld.game_stats.chunks or 1 -- Chunks
	local sectors = global.dyworld.game_stats.sector_scanned or 1 -- Sectors
	local research = global.dyworld.game_stats.research  or 1 -- Research
	local rockets = global.dyworld.game_stats.rockets_launched  or 1 -- Rockets
	local inserters = global.dyworld.game_stats.inserters  or 1 -- Inserters
	
	if game.players[id].character then
		local implant_1 = global.dyworld.players[id].implant_strength
		local implant_2 = global.dyworld.players[id].implant_constitution
		local implant_3 = global.dyworld.players[id].implant_dexterity
		local implant_4 = global.dyworld.players[id].implant_intelligence
		local implant_5 = global.dyworld.players[id].implant_wisdom
		local implant_6 = global.dyworld.players[id].implant_charisma
		
		----- Attributes -----
		global.dyworld.players[id].strength = Round((((crafted / 500) + (mined / 50) + (glokilled / 25) + (picked / 500)) / 2000), 2) + implant_1
		global.dyworld.players[id].constitution = Round((((crafted / 2.5) + (mined * 1.23) + (build / 14.5) + (glokilled * 0.4) + (picked * 0.05) + (distance / 100)) / 2000), 2) + implant_2
		global.dyworld.players[id].dexterity = Round((((glokilled / 5) + (killed * 5) + (glopicked / 2) + (picked / 4) + (sectors / 10)) / 25000), 2) + implant_3
		global.dyworld.players[id].intelligence = Round((((research * 20) + sectors + (rockets * 10) + (build / 1000)) / 4500), 2) + implant_4
		global.dyworld.players[id].wisdom = Round((((glokilled * (((killed / glokilled) / 5) * 1.25)) + sectors + (research * 25) + (crafted / 2)) / 1500), 2) + implant_5
		global.dyworld.players[id].charisma = Round(((global.dyworld.players[id].strength + global.dyworld.players[id].constitution + global.dyworld.players[id].dexterity + global.dyworld.players[id].intelligence + global.dyworld.players[id].wisdom) / 50), 2) + implant_6
		
	
		local strength = global.dyworld.players[id].strength or 1
		local constitution = global.dyworld.players[id].constitution or 1
		local dexterity = global.dyworld.players[id].dexterity or 1
		local intelligence = global.dyworld.players[id].intelligence or 1
		local wisdom = global.dyworld.players[id].wisdom or 1
		local charisma = global.dyworld.players[id].charisma or 1
		local attri_P = strength + constitution + dexterity
		local attri_W = intelligence + wisdom + charisma
		local attri_A = attri_W + attri_P
		
		----- Bonuses Calculation -----
		-- Mining --
		if global.dyworld.players[id].bonuses_player["mining"].enabled then
			local form = Round(((mined + attri_P) / 75000), 2)
			global.dyworld.players[id].bonuses_player["mining"].stats = math.min(Round(form, 2), (Dy_Bonuses_Player["mining"].level * Level))
		end
		-- Crafting --
		if global.dyworld.players[id].bonuses_player["crafting"].enabled then
			local form = Round(((crafted + attri_A) / 50000), 2)
			global.dyworld.players[id].bonuses_player["crafting"].stats = math.min(Round(form, 2), (Dy_Bonuses_Player["mining"].level * Level))
		end
		-- Health --
		if global.dyworld.players[id].bonuses_player["health"].enabled then
			local form = Round(((glokilled + attri_A) / 5000), 2)
			global.dyworld.players[id].bonuses_player["health"].stats = math.min(Round(form, 0), (Dy_Bonuses_Player["health"].level * Level))
		end
		-- Inventory --
		if global.dyworld.players[id].bonuses_player["inventory"].enabled then
			local form = math.min((Round((attri_P / 5), 0)), 980)
			global.dyworld.players[id].bonuses_player["inventory"].stats = math.min(Round(form, 0), (Dy_Bonuses_Player["inventory"].level * Level))
			if game.players[id].character_inventory_slots_bonus >= 30 then
				if not game.forces.player.character_logistic_requests then
					game.forces.player.character_logistic_requests = true
				end
				game.forces.player.character_trash_slot_count = 20
			end
		end
		-- Reach Distance --
		if global.dyworld.players[id].bonuses_player["reach-distance"].enabled then
			local form = Round(((build + mined + attri_P) / 100500), 2)
			global.dyworld.players[id].bonuses_player["reach-distance"].stats = math.min(Round(form, 2), (Dy_Bonuses_Player["reach-distance"].level * Level))
		end
		-- Build Distance --
		if global.dyworld.players[id].bonuses_player["build-distance"].enabled then
			local form = Round(((((dexterity + strength) * 2) + build) / 1000), 2)
			global.dyworld.players[id].bonuses_player["build-distance"].stats = math.min(Round(form, 2), (Dy_Bonuses_Player["build-distance"].level * Level))
		end
		-- Loot Distance --
		if global.dyworld.players[id].bonuses_player["loot-distance"].enabled then
			local form = Round(((picked + attri_A) / 50000), 2)
			global.dyworld.players[id].bonuses_player["loot-distance"].stats = math.min(Round(form, 2), (Dy_Bonuses_Player["loot-distance"].level * Level))
		end
		-- Food/Water --
		if constitution >= 5 then
			if not global.dyworld.players[id].survival then global.dyworld.players[id].survival = {} end
			local Survival = global.dyworld.players[id].survival
			if not Survival["constitution"] then 
				global.dyworld.players[id].food_max = global.dyworld.players[id].food_max + (math.random(15, 50))
				global.dyworld.players[id].water_max = global.dyworld.players[id].water_max + (math.random(30, 80))
				Survival["constitution"] = 5
			end		
			if constitution >= (Survival["constitution"] + 5) then
				global.dyworld.players[id].food_max = global.dyworld.players[id].food_max + (math.random(15, 50))
				global.dyworld.players[id].water_max = global.dyworld.players[id].water_max + (math.random(30, 80))
				Survival["constitution"] = Survival["constitution"] + 5
			end	
		end
		----- Bonuses Final Calculation -----
		for k,v in pairs(Dy_Bonuses_Player) do
			if death_player >= 1 then
				global.dyworld.players[id].bonuses_player[k].death = death_player * v.death
			end
		end

		for k,v in pairs(global.dyworld.players[id].bonuses_player) do
			local count = 0
			count = v.native + v.research + v.stats + v.implants + v.achievements + v.death
			v.total = count
		end

		----- Bonuses Additions If Unlocked-----
		if global.dyworld.players[id].bonuses_player["mining"].enabled then
			game.players[id].character_mining_speed_modifier = Round(global.dyworld.players[id].bonuses_player["mining"].total, 2)
		end
		if global.dyworld.players[id].bonuses_player["crafting"].enabled then
			game.players[id].character_crafting_speed_modifier = Round(global.dyworld.players[id].bonuses_player["crafting"].total, 2)
		end
		if global.dyworld.players[id].bonuses_player["health"].enabled then
			game.players[id].character_health_bonus = Round(global.dyworld.players[id].bonuses_player["health"].total, 0)
		end
		if global.dyworld.players[id].bonuses_player["inventory"].enabled then
			game.players[id].character_inventory_slots_bonus = math.min(Round(global.dyworld.players[id].bonuses_player["inventory"].total, 0), 980)
		end
		if global.dyworld.players[id].bonuses_player["reach-distance"].enabled then
			game.players[id].character_reach_distance_bonus = math.min(Round(global.dyworld.players[id].bonuses_player["reach-distance"].total, 2), (100 - game.entity_prototypes["character"].reach_distance))
		end
		if global.dyworld.players[id].bonuses_player["build-distance"].enabled then
			game.players[id].character_build_distance_bonus = math.min(Round(global.dyworld.players[id].bonuses_player["build-distance"].total, 2), (100 - game.entity_prototypes["character"].build_distance))
		end
		if global.dyworld.players[id].bonuses_player["loot-distance"].enabled then
			game.players[id].character_loot_pickup_distance_bonus = math.min(Round(global.dyworld.players[id].bonuses_player["loot-distance"].total, 2), (100 - game.entity_prototypes["character"].loot_pickup_distance))
		end
		if global.dyworld.players[id].bonuses_player["run-speed"].enabled then
			game.players[id].character_mining_speed_modifier = Round(global.dyworld.players[id].bonuses_player["run-speed"].total, 2)
		end
		if global.dyworld.players[id].bonuses_player["item-drop-distance"].enabled then
			game.players[id].character_mining_speed_modifier = Round(global.dyworld.players[id].bonuses_player["item-drop-distance"].total, 2)
		end
		if global.dyworld.players[id].bonuses_player["item-pickup-distance"].enabled then
			game.players[id].character_mining_speed_modifier = Round(global.dyworld.players[id].bonuses_player["item-pickup-distance"].total, 2)
		end
		if global.dyworld.players[id].bonuses_player["max-robot-count"].enabled then
			game.players[id].character_mining_speed_modifier = Round(global.dyworld.players[id].bonuses_player["max-robot-count"].total, 2)
		end

		--[[
			game.players[id].character_running_speed_modifier
			game.players[id].character_item_drop_distance_bonus
			game.players[id].character_item_pickup_distance_bonus    
			game.players[id].character_maximum_following_robot_count_bonus    
		]]--
	end
	if game.forces.player then
		if research >= 2 then
			if not global.dyworld.players[id].bonus_toggle.lab_1 then global.dyworld.players[id].bonus_toggle.lab_1 = true end
			game.forces.player.laboratory_speed_modifier = Round((research * 0.025), 2)
		end
		if research >= 51 then
			if not global.dyworld.players[id].bonus_toggle.lab_2 then global.dyworld.players[id].bonus_toggle.lab_2 = true end
			game.forces.player.laboratory_productivity_bonus = math.max(Round(((research - 50) * 0.025), 2), 0)
		end
		if inserters >= 51 then
			if not global.dyworld.players[id].bonus_toggle.inserter then global.dyworld.players[id].bonus_toggle.inserter = true end
			game.forces.player.stack_inserter_capacity_bonus  = math.min(math.floor((inserters - 50) / 50), 254)
		end
		-- @todo Rewrite formula ghost timer to live
		if global.dyworld.game_stats.ghosts and global.dyworld.game_stats.ghosts >= 1 then
			if not global.dyworld.players[id].bonus_toggle.ghost_time then global.dyworld.players[id].bonus_toggle.ghost_time = true end
			game.forces.player.ghost_time_to_live = math.min(math.floor(global.dyworld.game_stats.ghosts * 6), 4000000000)
		end
		--[[
			game.forces.player.following_robots_lifetime_modifier     
		]]--
	end
end