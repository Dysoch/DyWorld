
local function Survival_Diff_Damage(Amount)
	if settings.global["DyWorld_Surival_Difficulty"].value ~= "Off" then
		if settings.global["DyWorld_Surival_Difficulty"].value == "Easy" then
			return Round((Amount * 0.5), 2)
		elseif settings.global["DyWorld_Surival_Difficulty"].value == "Normal" then
			return Round((Amount * 1), 2)
		elseif settings.global["DyWorld_Surival_Difficulty"].value == "Hard" then
			return Round((Amount * 1.5), 2)
		elseif settings.global["DyWorld_Surival_Difficulty"].value == "Insane" then
			return Round((Amount * 2.5), 2)
		end
	end
end


function Add_Radiation(id, Amount)
	if not global.dyworld.players[id].rads then 
		global.dyworld.players[id].rads = {
			native_loss = -0.1,
			artifical_loss = 0,
			stored = 0,
			thresholds = {
				low_1 = 1000,
				low_2 = 5000,
				low_3 = 25000,
				mid_1 = 125000,
				mid_2 = 625000,
				mid_3 = 3125000,
				high_1 = 15625000,
				high_2 = 78125000,
				high_3 = 390625000,
			},
		}
	end
	global.dyworld.players[id].rads.stored = global.dyworld.players[id].rads.stored + Amount
	if global.dyworld.players[id].rads.stored <= 0 then
		global.dyworld.players[id].rads.stored = 0
	end
end


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
			native_loss = -0.1,
			artifical_loss = 0,
			bonus = 0,
			stored = 0,
			thresholds = {
				low_1 =       2000,
				low_2 =       8000,
				low_3 =      32000,
				mid_1 =     128000,
				mid_2 =     512000,
				mid_3 =    2046000,
				high_1 =   8184000,
				high_2 =  32736000,
				high_3 = 130944000,
			},
		}
	end
	
	if not global.dyworld.players[id].temp then 
		global.dyworld.players[id].temp = {
			high = {
				native = 45,
				artificial = 0,
				bonus = 0,
				total = 0,
			},
			low = {
				native = -25,
				artificial = 0,
				bonus = 0,
				total = 0,
			},
		}
	end
	
	if not global.dyworld.players[id].pollution then 
		global.dyworld.players[id].pollution = {
			native = 1500,
			artificial = 0,
			bonus = 0,
			total = 0,
		}
	end
	
	if not global.dyworld.players[id].statemind then 
		global.dyworld.players[id].statemind = {
			max = 100,
            value = 100,
		}
	end
	
	if not global.dyworld.players[id].oxygen then 
		global.dyworld.players[id].oxygen = {
			max = 100,
            value = 100,
		}
	end

	if not global.dyworld.players[id].rads.bonus then global.dyworld.players[id].rads.bonus = 0 end
	if not global.dyworld.players[id].temp.high.bonus then global.dyworld.players[id].temp.high.bonus = 0 end
	if not global.dyworld.players[id].temp.low.bonus then global.dyworld.players[id].temp.low.bonus = 0 end
	
	local Rads_Gained = ((global.dyworld.players[id].rads.native_loss + global.dyworld.players[id].rads.artifical_loss + global.dyworld.players[id].rads.bonus) + Chunk.Radiation)
	local Food_Per = (global.dyworld.players[id].water / global.dyworld.players[id].water_max)
	local Water_Per = (global.dyworld.players[id].water / global.dyworld.players[id].water_max)
	local Oxygen_Per = (global.dyworld.players[id].oxygen.value / global.dyworld.players[id].oxygen.max)
	local Statemind_Per = (global.dyworld.players[id].statemind.value / global.dyworld.players[id].statemind.max)

    local Player_Wellbeing_Per = (Food_Per + Water_Per + Oxygen_Per + Statemind_Per) / 4
	
	-- Radiation --
	if game.players[id].get_main_inventory() then
        local Inv = game.players[id].get_main_inventory()
        local Contents = Inv.get_contents()
        for k,v in pairs(Contents) do
            if Radiation_Values[k] then
				Add_Radiation(id, (Radiation_Values[k] * v))
			end
		end
	end
	Add_Radiation(id, Rads_Gained)
	if settings.global["DyWorld_Surival_Difficulty"].value ~= "Off" then
		if global.dyworld.players[id].rads.stored >= global.dyworld.players[id].rads.thresholds.high_3 then
			if P_Loc then P_Loc.damage(Survival_Diff_Damage(5000000), "enemy", "radiation") end
		elseif global.dyworld.players[id].rads.stored >= global.dyworld.players[id].rads.thresholds.high_2 then
			if P_Loc then P_Loc.damage(Survival_Diff_Damage(500000), "enemy", "radiation") end
		elseif global.dyworld.players[id].rads.stored >= global.dyworld.players[id].rads.thresholds.high_1 then
			if P_Loc then P_Loc.damage(Survival_Diff_Damage(50000), "enemy", "radiation") end
		elseif global.dyworld.players[id].rads.stored >= global.dyworld.players[id].rads.thresholds.mid_3 then
			if P_Loc then P_Loc.damage(Survival_Diff_Damage(50000), "enemy", "radiation") end
		elseif global.dyworld.players[id].rads.stored >= global.dyworld.players[id].rads.thresholds.mid_2 then
			if P_Loc then P_Loc.damage(Survival_Diff_Damage(5000), "enemy", "radiation") end
		elseif global.dyworld.players[id].rads.stored >= global.dyworld.players[id].rads.thresholds.mid_1 then
			if P_Loc then P_Loc.damage(Survival_Diff_Damage(500), "enemy", "radiation") end
		elseif global.dyworld.players[id].rads.stored >= global.dyworld.players[id].rads.thresholds.low_3 then
			if P_Loc then P_Loc.damage(Survival_Diff_Damage(50), "enemy", "radiation") end
		elseif global.dyworld.players[id].rads.stored >= global.dyworld.players[id].rads.thresholds.low_2 then
			if P_Loc then P_Loc.damage(Survival_Diff_Damage(5), "enemy", "radiation") end
		elseif global.dyworld.players[id].rads.stored >= global.dyworld.players[id].rads.thresholds.low_1 then
			if P_Loc then P_Loc.damage(Survival_Diff_Damage(0.5), "enemy", "radiation") end
		end
	end
	
	
	-- Temperature --
	global.dyworld.players[id].temp.high.total = (global.dyworld.players[id].temp.high.native + global.dyworld.players[id].temp.high.artificial + global.dyworld.players[id].temp.high.bonus) * (Player_Wellbeing_Per)
	global.dyworld.players[id].temp.low.total = (global.dyworld.players[id].temp.low.native + global.dyworld.players[id].temp.low.artificial + global.dyworld.players[id].temp.low.bonus) * (Player_Wellbeing_Per)
	
	if settings.global["DyWorld_Surival_Difficulty"].value ~= "Off" then
		if Chunk.Temperature >= global.dyworld.players[id].temp.high.total then
			if P_Loc then P_Loc.damage(Survival_Diff_Damage(Chunk.Temperature), "enemy", "temperature-high") end
		end
		if Chunk.Temperature <= global.dyworld.players[id].temp.low.total then
			if P_Loc then P_Loc.damage(Survival_Diff_Damage(75), "enemy", "temperature-low") end
		end
	end
	
	
	-- Pollution --
	global.dyworld.players[id].pollution.total = (global.dyworld.players[id].pollution.native + global.dyworld.players[id].pollution.artificial + global.dyworld.players[id].pollution.bonus) * (Player_Wellbeing_Per)
	
	if settings.global["DyWorld_Surival_Difficulty"].value ~= "Off" then
		if Chunk.Pollution >= global.dyworld.players[id].pollution.total then
			if P_Loc then P_Loc.damage(Survival_Diff_Damage((1 + (Chunk.Pollution / 100))), "enemy", "toxic") end
		end
	end
end
