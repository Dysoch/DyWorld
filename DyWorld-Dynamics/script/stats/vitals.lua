


function Vitals_Check(id)

	local surface = game.players[id].surface.name
    local X = global.dyworld.players[id].posx
    local Y = global.dyworld.players[id].posy
    local Chunk_X = math.floor(X / 32)
    local Chunk_Y = math.floor(Y / 32)
    local Chunk = global.dyworld.game_stats.chunks_info[surface][Chunk_X..":"..Chunk_Y]
	local P_S = global.dyworld.players[id].surface
	local P_X = global.dyworld.players[id].posx
	local P_Y = global.dyworld.players[id].posy
	local P_Loc = game.surfaces[P_S].find_entity("character", {P_X,P_Y})
	
	if not global.dyworld.players[id].rads then 
		global.dyworld.players[id].rads = {
			native_loss = -0.05,
			artifical_loss = 0,
			stored = 0,
			thresholds = {
				low = 1000,
				mid = 5000,
				high = 25000,
			},
		}
	end
	if not global.dyworld.players[id].rads.thresholds then
		global.dyworld.players[id].rads.thresholds = {
			low = 1000,
			mid = 5000,
			high = 25000,
		}
	end
	
	if not global.dyworld.players[id].temp then 
		global.dyworld.players[id].temp = {
			high = {
				native = 45,
				artificial = 0,
				total = 0,
			},
			low = {
				native = -25,
				artificial = 0,
				total = 0,
			},
		}
	end
	
	local Rads_Gained = ((global.dyworld.players[id].rads.native_loss + global.dyworld.players[id].rads.artifical_loss) + Chunk.Radiation)
	local Food_Per = (global.dyworld.players[id].water/global.dyworld.players[id].water_max)
	local Water_Per = (global.dyworld.players[id].water/global.dyworld.players[id].water_max)
	
	-- Radiation --
	if game.players[id].get_main_inventory() then
        local Inv = game.players[id].get_main_inventory()
        local Contents = Inv.get_contents()
        for k,v in pairs(Contents) do
            if Radiation_Values[k] then
				global.dyworld.players[id].rads.stored = global.dyworld.players[id].rads.stored + (Radiation_Values[k] * v)
			end
		end
	end
	global.dyworld.players[id].rads.stored = global.dyworld.players[id].rads.stored + Rads_Gained
	if global.dyworld.players[id].rads.stored <= 0 then
		global.dyworld.players[id].rads.stored = 0
	end
	if global.dyworld.players[id].rads.stored >= global.dyworld.players[id].rads.thresholds.high then
		if P_Loc then
			P_Loc.damage(250, "enemy", "radiation")
		end
	elseif global.dyworld.players[id].rads.stored >= global.dyworld.players[id].rads.thresholds.mid then
		if P_Loc then
			P_Loc.damage(50, "enemy", "radiation")
		end
	elseif global.dyworld.players[id].rads.stored >= global.dyworld.players[id].rads.thresholds.low then
		if P_Loc then
			P_Loc.damage(10, "enemy", "radiation")
		end
	end
	
	
	-- Temperature --
	global.dyworld.players[id].temp.high.total = (global.dyworld.players[id].temp.high.native + global.dyworld.players[id].temp.high.artificial) * ((Food_Per + Water_Per) / 2)
	global.dyworld.players[id].temp.low.total = (global.dyworld.players[id].temp.low.native + global.dyworld.players[id].temp.low.artificial) * ((Food_Per + Water_Per) / 2)
	
	
end