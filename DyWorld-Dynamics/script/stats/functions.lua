



function Bonuses(id)
	local crafted = global.dyworld.players[id].crafted or 1 -- Crafted
	local mined = global.dyworld.players[id].mined or 1 -- Mined
	local build = global.dyworld.players[id].build or 1 -- Build
	local killed = global.dyworld.players[id].killed or 1 -- Killed
	local glocraft = global.dyworld.game_stats.crafted_amount or 1 -- Global Crafted
	local glomined = global.dyworld.game_stats.mined_amount or 1 -- Global Mined
	local globuilt = global.dyworld.game_stats.build_amount or 1 -- Global Built
	local glokilled = global.dyworld.game_stats.killed_amount or 1 -- Global Killed
	local chunks = global.dyworld.game_stats.chunks or 1 -- Chunks
	local sectors = global.dyworld.game_stats.sector_scanned or 1 -- Chunks
	if game.players[id].character then
		if mined >= 50 then
			game.players[id].character_mining_speed_modifier = Round((mined/5000), 2)
		end
		if crafted >= 10 then
			game.players[id].character_crafting_speed_modifier = Round((crafted/500), 2)
		end
		if glokilled >= 2 then
			game.players[id].character_health_bonus = Round((glokilled/100), 0)
		end
		if build >= 10 then
			game.players[id].character_inventory_slots_bonus = math.min((Round((build/1000), 0)), 880)
		end
	end
end