


function Vitals_Check(id)

	local surface = game.players[id].surface.name
    local X = global.dyworld.players[id].posx
    local Y = global.dyworld.players[id].posy
    local Chunk_X = math.floor(X / 32)
    local Chunk_Y = math.floor(Y / 32)
    local Chunk = global.dyworld.game_stats.chunks_info[surface][Chunk_X..":"..Chunk_Y]
	
	if not global.dyworld.players[id].rads then 
		global.dyworld.players[id].rads = {
			native_loss = -0.05,
			artifical_loss = 0,
			stored = 0,
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
	
	global.dyworld.players[id].rads.stored = global.dyworld.players[id].rads.stored + Rads_Gained
	if global.dyworld.players[id].rads.stored <= 0 then
		global.dyworld.players[id].rads.stored = 0
	end
	
	global.dyworld.players[id].temp.high.total = (global.dyworld.players[id].temp.high.native + global.dyworld.players[id].temp.high.artificial) * ((Food_Per + Water_Per) / 2)
	global.dyworld.players[id].temp.low.total = (global.dyworld.players[id].temp.low.native + global.dyworld.players[id].temp.low.artificial) * ((Food_Per + Water_Per) / 2)
	
	
end