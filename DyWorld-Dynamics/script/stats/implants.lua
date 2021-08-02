



function Implant_Check(id, implant, death)
	if implant ~= nil then
		if not Implants[implant].type then error("No Type found in implant "..implant) end
		if not global.dyworld.players[id].implants then global.dyworld.players[id].implants = {} end
		if not global.dyworld.players[id].implants[implant] then
			Implant_Add(id, implant)
		else
			Implant_Remove(id, implant)
		end
	end
	if death then
		if not global.dyworld.players[id].implants then global.dyworld.players[id].implants = {} end
		--if not Table_Empty(global.dyworld.players[id].implants) then
			for k,v in pairs(global.dyworld.players[id].implants) do
				if v == true then
					Implant_Remove(id, k)
				end
			end
		--end
	end
end

function Implant_Add(id, implant)
	if Implants[implant].type == "use-rate" then
		global.dyworld.players[id].implants[implant] = true
		global.dyworld.players[id].water_rate = global.dyworld.players[id].water_rate + Implants[implant].Water_Usage
		global.dyworld.players[id].food_rate = global.dyworld.players[id].food_rate + Implants[implant].Food_Usage
	elseif Implants[implant].type == "attribute" then
		global.dyworld.players[id].implants[implant] = true
		if Implants[implant].Name == "strength" then
			global.dyworld.players[id].implant_strength = global.dyworld.players[id].implant_strength + Implants[implant].Amount
		elseif Implants[implant].Name == "constitution" then
			global.dyworld.players[id].implant_constitution = global.dyworld.players[id].implant_constitution + Implants[implant].Amount
		elseif Implants[implant].Name == "dexterity" then
			global.dyworld.players[id].implant_dexterity = global.dyworld.players[id].implant_dexterity + Implants[implant].Amount
		elseif Implants[implant].Name == "intelligence" then
			global.dyworld.players[id].implant_intelligence = global.dyworld.players[id].implant_intelligence + Implants[implant].Amount
		elseif Implants[implant].Name == "wisdom" then
			global.dyworld.players[id].implant_wisdom = global.dyworld.players[id].implant_wisdom + Implants[implant].Amount
		elseif Implants[implant].Name == "charisma" then
			global.dyworld.players[id].implant_charisma = global.dyworld.players[id].implant_charisma + Implants[implant].Amount
		end
	elseif Implants[implant].type == "running-speed" then
		global.dyworld.players[id].implants[implant] = true
		if game.players[id].character then
			game.players[id].character_running_speed_modifier = game.players[id].character_running_speed_modifier + Implants[implant].Amount
		end
	elseif Implants[implant].type == "death-keep" then
		global.dyworld.players[id].implants[implant] = true
		global.dyworld.players[id].death_reduce = global.dyworld.players[id].death_reduce + Implants[implant].Amount
	elseif Implants[implant].type == "auto-food" then
		global.dyworld.players[id].implants[implant] = true
	elseif Implants[implant].type == "auto-health" then
		global.dyworld.players[id].implants[implant] = true
	end
end

function Implant_Remove(id, implant)
	if Implants[implant].type == "use-rate" then
		global.dyworld.players[id].implants[implant] = false
		global.dyworld.players[id].water_rate = global.dyworld.players[id].water_rate - Implants[implant].Water_Usage
		global.dyworld.players[id].food_rate = global.dyworld.players[id].food_rate - Implants[implant].Food_Usage
	elseif Implants[implant].type == "attribute" then
		global.dyworld.players[id].implants[implant] = false
		if Implants[implant].name == "strength" then
			global.dyworld.players[id].implant_strength = global.dyworld.players[id].implant_strength - Implants[implant].Amount
		elseif Implants[implant].name == "constitution" then
			global.dyworld.players[id].implant_constitution = global.dyworld.players[id].implant_constitution - Implants[implant].Amount
		elseif Implants[implant].name == "dexterity" then
			global.dyworld.players[id].implant_dexterity = global.dyworld.players[id].implant_dexterity - Implants[implant].Amount
		elseif Implants[implant].name == "intelligence" then
			global.dyworld.players[id].implant_intelligence = global.dyworld.players[id].implant_intelligence - Implants[implant].Amount
		elseif Implants[implant].name == "wisdom" then
			global.dyworld.players[id].implant_wisdom = global.dyworld.players[id].implant_wisdom - Implants[implant].Amount
		elseif Implants[implant].name == "charisma" then
			global.dyworld.players[id].implant_charisma = global.dyworld.players[id].implant_charisma - Implants[implant].Amount
		end
	elseif Implants[implant].type == "running-speed" then
		global.dyworld.players[id].implants[implant] = false
		if game.players[id].character then
			game.players[id].character_running_speed_modifier = game.players[id].character_running_speed_modifier - Implants[implant].Amount
		end
	elseif Implants[implant].type == "death-keep" then
		global.dyworld.players[id].implants[implant] = false
		global.dyworld.players[id].death_reduce = global.dyworld.players[id].death_reduce - Implants[implant].Amount
	elseif Implants[implant].type == "auto-food" then
		global.dyworld.players[id].implants[implant] = false
	elseif Implants[implant].type == "auto-health" then
		global.dyworld.players[id].implants[implant] = false
	end
end

function Auto_Medpack_Intake(ID)
	if game.players[ID].get_main_inventory() then
		local Inv = game.players[ID].get_main_inventory()
		local Contents = Inv.get_contents()
		for k,v in pairs(Contents) do
			if Medpack_Values[k] then
				local P_S = global.dyworld.players[ID].surface
				local P_X = global.dyworld.players[ID].posx
				local P_Y = global.dyworld.players[ID].posy
				local P_Loc = game.surfaces[P_S].find_entity("character", {P_X,P_Y})
				if P_Loc and global.dyworld.players[ID].alive then
					if (((game.entity_prototypes["character"].max_health + game.players[ID].character_health_bonus) - (P_Loc.health + Medpack_Values[k])) >= 0) then
						Inv.remove({name = k, count = 1})
						P_Loc.health = P_Loc.health + Medpack_Values[k]
						break
					end
				end
			end
		end
	end
end