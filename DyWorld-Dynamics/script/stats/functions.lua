



function Bonuses(id)
	----- Safety Measures -----
	if not global.dyworld.players[id].strength then global.dyworld.players[id].strength = 1 end
	if not global.dyworld.players[id].constitution then global.dyworld.players[id].constitution = 1 end
	if not global.dyworld.players[id].dexterity then global.dyworld.players[id].dexterity = 1 end
	if not global.dyworld.players[id].intelligence then global.dyworld.players[id].intelligence = 1 end
	if not global.dyworld.players[id].wisdom then global.dyworld.players[id].wisdom = 1 end
	if not global.dyworld.players[id].charisma then global.dyworld.players[id].charisma = 1 end
	if not global.dyworld.players[id].crafted then global.dyworld.players[id].crafted = 1 end
	if not global.dyworld.players[id].mined then global.dyworld.players[id].mined = 1 end
	if not global.dyworld.players[id].build then global.dyworld.players[id].build = 1 end
	if not global.dyworld.players[id].killed then global.dyworld.players[id].killed = 1 end
	if not global.dyworld.players[id].picked then global.dyworld.players[id].picked = 1 end
	
		----- Players -----
	local playeramount = global.dyworld.game_stats.players
	
		----- Personal Stats -----
	local crafted = global.dyworld.players[id].crafted or 1 -- Crafted
	local mined = global.dyworld.players[id].mined or 1 -- Mined
	local build = global.dyworld.players[id].build or 1 -- Build
	local killed = global.dyworld.players[id].killed or 1 -- Killed
	local picked = global.dyworld.players[id].picked or 1 -- Picked Up
	local distance = global.dyworld.players[id].distance or 1 -- Distance
	
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
	
	if game.players[id].character then
		----- Attributes -----
		global.dyworld.players[id].strength = Round(((crafted + (mined * 5) + (glokilled / 25) + (picked / 500)) / 1000), 2)
		global.dyworld.players[id].constitution = Round((((crafted / 2.5) + (mined * 1.23) + (build / 14.5) + (glokilled * 1.25) + (picked / 1.5) + (distance / 100)) / 2000), 2)
		global.dyworld.players[id].dexterity = Round((((glokilled / 5) + (killed * 50) + (glopicked * 2) + (picked * 4) + (sectors / 10)) / 25000), 2)
		global.dyworld.players[id].intelligence = Round((((research * 20) + sectors + (rockets * 10) + (build / 1000)) / 4500), 2)
		global.dyworld.players[id].wisdom = Round((((glokilled * ((killed / glokilled) * 1.25)) + sectors + (research * 25) + (crafted / 2)) / 1500), 2)
		--global.dyworld.players[id].charisma = Round((), 2)
		
		
	
		local strength = global.dyworld.players[id].strength or 1
		local constitution = global.dyworld.players[id].constitution or 1
		local dexterity = global.dyworld.players[id].dexterity or 1
		local intelligence = global.dyworld.players[id].intelligence or 1
		local wisdom = global.dyworld.players[id].wisdom or 1
		local charisma = global.dyworld.players[id].charisma or 1
		
		----- Bonuses -----
		if mined >= 2 then
			game.players[id].character_mining_speed_modifier = Round(((((strength * 3.5) + (constitution * 2) + dexterity) / 35) * ((playeramount >= 2 and (1-(mined/glomined)) or 1))), 2)
		end
		if crafted >= 2 then
			game.players[id].character_crafting_speed_modifier = Round(((((dexterity * 3.5) + (wisdom * 2) + intelligence) / 2.5) * ((playeramount >= 2 and (1-(crafted/glocraft)) or 1))), 2)
		end
		if glokilled >= 2 then
			game.players[id].character_health_bonus = Round((constitution * 5), 0)
		end
		if build >= 2 then
			game.players[id].character_inventory_slots_bonus = math.min((Round((strength/5), 0)), 880)
		end
	end
end

-- Inline condition (a==b ? "yes" : "no")