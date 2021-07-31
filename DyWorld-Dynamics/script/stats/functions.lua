


local function Food_Check(id)
	local food_per = Round(((global.dyworld.players[id].food/global.dyworld.players[id].food_max) * 100), 2)
	if food_per >= 95 then return 0
	elseif food_per >= 90 then return -0.05
	elseif food_per >= 85 then return -0.1
	elseif food_per >= 80 then return -0.2
	elseif food_per >= 75 then return -0.3
	elseif food_per >= 70 then return -0.45
	elseif food_per >= 65 then return -0.6
	elseif food_per >= 60 then return -0.8
	elseif food_per >= 55 then return -1
	elseif food_per >= 50 then return -1.4
	elseif food_per >= 45 then return -1.8
	elseif food_per >= 40 then return -2.6
	elseif food_per >= 35 then return -3.4
	elseif food_per >= 30 then return -4
	elseif food_per >= 25 then return -5
	elseif food_per >= 20 then return -6
	elseif food_per >= 15 then return -7
	elseif food_per >= 10 then return -8
	elseif food_per >= 5 then return -10
	else return -20 end
end

local function Water_Check(id)
	local water_per = Round(((global.dyworld.players[id].water/global.dyworld.players[id].water_max) * 100), 2)
	if water_per >= 95 then return 0
	elseif water_per >= 90 then return -0.05
	elseif water_per >= 85 then return -0.1
	elseif water_per >= 80 then return -0.2
	elseif water_per >= 75 then return -0.3
	elseif water_per >= 70 then return -0.45
	elseif water_per >= 65 then return -0.6
	elseif water_per >= 60 then return -0.8
	elseif water_per >= 55 then return -1
	elseif water_per >= 50 then return -1.4
	elseif water_per >= 45 then return -1.8
	elseif water_per >= 40 then return -2.6
	elseif water_per >= 35 then return -3.4
	elseif water_per >= 30 then return -4
	elseif water_per >= 25 then return -5
	elseif water_per >= 20 then return -6
	elseif water_per >= 15 then return -7
	elseif water_per >= 10 then return -8
	elseif water_per >= 5 then return -10
	else return -20 end
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
	
		----- Food Stats -----
	local food_per = Round(((global.dyworld.players[id].food/global.dyworld.players[id].food_max) * 100), 2)
	local water_per = Round(((global.dyworld.players[id].water/global.dyworld.players[id].water_max) * 100), 2)
	
		----- Global Stats -----
	local glocraft = global.dyworld.game_stats.crafted_amount or 1 -- Global Crafted
	local glomined = global.dyworld.game_stats.mined_amount or 1 -- Global Mined
	local globuilt = global.dyworld.game_stats.build_amount or 1 -- Global Built
	local glokilled = global.dyworld.game_stats.killed_amount or 1 -- Global Killed
	local glopicked = global.dyworld.game_stats.picked_amount or 1 -- Global Picked Up
	
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
		global.dyworld.players[id].strength = Round(((crafted + (mined) + (glokilled / 25) + (picked / 500)) / 1000), 2) + implant_1
		global.dyworld.players[id].constitution = Round((((crafted / 2.5) + (mined * 1.23) + (build / 14.5) + (glokilled * 1.25) + (picked / 1.5) + (distance / 100)) / 2000), 2) + implant_2
		global.dyworld.players[id].dexterity = Round((((glokilled / 5) + (killed * 50) + (glopicked * 2) + (picked * 4) + (sectors / 10)) / 25000), 2) + implant_3
		global.dyworld.players[id].intelligence = Round((((research * 20) + sectors + (rockets * 10) + (build / 1000)) / 4500), 2) + implant_4
		global.dyworld.players[id].wisdom = Round((((glokilled * ((killed / glokilled) * 1.25)) + sectors + (research * 25) + (crafted / 2)) / 1500), 2) + implant_5
		global.dyworld.players[id].charisma = Round(((global.dyworld.players[id].strength + global.dyworld.players[id].constitution + global.dyworld.players[id].dexterity + global.dyworld.players[id].intelligence + global.dyworld.players[id].wisdom) / 50), 2) + implant_6
		
	
		local strength = global.dyworld.players[id].strength or 1
		local constitution = global.dyworld.players[id].constitution or 1
		local dexterity = global.dyworld.players[id].dexterity or 1
		local intelligence = global.dyworld.players[id].intelligence or 1
		local wisdom = global.dyworld.players[id].wisdom or 1
		local charisma = global.dyworld.players[id].charisma or 1
		
		----- Bonuses -----
		if mined >= 2 then
			local form = Round((((((strength * 3.5) + (constitution * 2) + dexterity) / 35) + Water_Check(id) + Food_Check(id)) * ((playeramount >= 2 and (1-(mined/glomined)) or 1))), 2)
			game.players[id].character_mining_speed_modifier = (form > 0 and form or 0)
		end
		if crafted >= 2 then
			local form = Round((((((dexterity * 3.5) + (wisdom * 2) + intelligence) / 2.5) + Water_Check(id) + Food_Check(id)) * ((playeramount >= 2 and (1-(crafted/glocraft)) or 1))), 2)
			game.players[id].character_crafting_speed_modifier = (form > 0 and form or 0)
		end
		if glokilled >= 2 then
			game.players[id].character_health_bonus = Round((constitution * 5), 0)
		end
		if build >= 2 then
			game.players[id].character_inventory_slots_bonus = math.min((Round((strength/5), 0)), 880)
			game.players[id].character_reach_distance_bonus = math.min((Round(((((dexterity + strength) * 5) + build) / 500), 2)), (100 - game.entity_prototypes["character"].reach_distance))
			game.players[id].character_build_distance_bonus = math.min((Round(((((dexterity + strength) * 2) + build) / 1000), 2)), (100 - game.entity_prototypes["character"].build_distance))
		end
		if picked >= 2 then
			game.players[id].character_loot_pickup_distance_bonus = math.min((Round(((dexterity + strength) / 10), 2)), (100 - game.entity_prototypes["character"].loot_pickup_distance))
		end
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
		--[[
			game.players[id].character_running_speed_modifier
			game.players[id].character_item_drop_distance_bonus
			game.players[id].character_item_pickup_distance_bonus  
			game.players[id].character_loot_pickup_distance_bonus   
			game.players[id].character_maximum_following_robot_count_bonus    
		]]--
	end
	if game.forces.player then
		if research >= 2 then
			game.forces.player.laboratory_speed_modifier = Round((research * 0.125), 2)
		end
		if research >= 51 then
			game.forces.player.laboratory_productivity_bonus = Round(((research - 50) * 0.025), 2)
		end
		if inserters >= 51 then
			game.forces.player.stack_inserter_capacity_bonus  = math.floor((inserters - 50) / 25)
		end
		--[[
			game.forces.player.following_robots_lifetime_modifier     
		]]--
	end
end