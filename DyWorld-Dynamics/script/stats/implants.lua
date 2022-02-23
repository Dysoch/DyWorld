

function Reset_Implants()
    for _,Player in pairs(global.dyworld.players) do
        global.dyworld.players[Player.id].implants = {}
        for k,v in pairs(Implants) do
            global.dyworld.players[Player.id].implants[k] = {enabled = false, amount = 0}
        end
    end
end

function Implant_Check(id, implant, death)
	if implant == nil then
		if not global.dyworld.players[id].implants then
            global.dyworld.players[id].implants = {}
            for k,v in pairs(Implants) do
                global.dyworld.players[id].implants[k] = {enabled = false, amount = 0}
            end
        end
	end
	if implant ~= nil then
		if not Implants[implant].type then error("No Type found in implant "..implant) end
		if not global.dyworld.players[id].implants then
            global.dyworld.players[id].implants = {}
            for k,v in pairs(Implants) do
                global.dyworld.players[id].implants[k] = {enabled = false, amount = 0}
            end
        end
		if not global.dyworld.players[id].implants[implant] then global.dyworld.players[id].implants[implant] = {enabled = false, amount = 0} end
		if global.dyworld.players[id].implants[implant].enabled == false then
			Implant_Add(id, implant)
        elseif global.dyworld.players[id].implants[implant].enabled == true then
			Implant_Remove(id, implant)
		end
        global.dyworld.players[id].implants[implant].amount = global.dyworld.players[id].implants[implant].amount + 1
	end
	if death then
		if not global.dyworld.players[id].implants then
            global.dyworld.players[id].implants = {}
            for k,v in pairs(Implants) do
                global.dyworld.players[id].implants[k] = {enabled = false, amount = 0}
            end
        end
		--if not Table_Empty(global.dyworld.players[id].implants) then
			for k,v in pairs(global.dyworld.players[id].implants) do
				if v.enabled == true then
					Implant_Remove(id, k)
				end
			end
		--end
	end
end

function Implant_Add(id, implant)
	if Implants[implant].type == "use-rate" then
		global.dyworld.players[id].implants[implant].enabled = true
		global.dyworld.players[id].water_rate = global.dyworld.players[id].water_rate + Implants[implant].Water_Usage
		global.dyworld.players[id].food_rate = global.dyworld.players[id].food_rate + Implants[implant].Food_Usage
	elseif Implants[implant].type == "attribute" then
		global.dyworld.players[id].implants[implant].enabled = true
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
		global.dyworld.players[id].implants[implant].enabled = true
		if game.players[id].character then
			game.players[id].character_running_speed_modifier = game.players[id].character_running_speed_modifier + Implants[implant].Amount
		end
	elseif Implants[implant].type == "death-keep" then
		global.dyworld.players[id].implants[implant].enabled = true
		global.dyworld.players[id].death_reduce = global.dyworld.players[id].death_reduce + Implants[implant].Amount
	elseif Implants[implant].type == "auto-food" then
		global.dyworld.players[id].implants[implant].enabled = true
	elseif Implants[implant].type == "auto-health" then
		global.dyworld.players[id].implants[implant].enabled = true
	end
end

function Implant_Remove(id, implant)
	if Implants[implant].type == "use-rate" then
		global.dyworld.players[id].implants[implant].enabled = false
		global.dyworld.players[id].water_rate = global.dyworld.players[id].water_rate - Implants[implant].Water_Usage
		global.dyworld.players[id].food_rate = global.dyworld.players[id].food_rate - Implants[implant].Food_Usage
	elseif Implants[implant].type == "attribute" then
		global.dyworld.players[id].implants[implant].enabled = false
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
		global.dyworld.players[id].implants[implant].enabled = false
		if game.players[id].character then
			game.players[id].character_running_speed_modifier = game.players[id].character_running_speed_modifier - Implants[implant].Amount
		end
	elseif Implants[implant].type == "death-keep" then
		global.dyworld.players[id].implants[implant].enabled = false
		global.dyworld.players[id].death_reduce = global.dyworld.players[id].death_reduce - Implants[implant].Amount
	elseif Implants[implant].type == "auto-food" then
		global.dyworld.players[id].implants[implant].enabled = false
	elseif Implants[implant].type == "auto-health" then
		global.dyworld.players[id].implants[implant].enabled = false
	end
end

function Auto_Medpack_Intake(ID)
    local VAR = game.forces.player.technologies["implants-auto-health-5"].researched == true and 10 or game.forces.player.technologies["implants-auto-health-4"].researched == true and 5 or game.forces.player.technologies["implants-auto-health-3"].researched == true and 4 or game.forces.player.technologies["implants-auto-health-2"].researched == true and 3 or game.forces.player.technologies["implants-auto-health-1"].researched == true and 2 or 1
	if game.players[ID].get_main_inventory() then
        for i = 1, VAR do
            local Inv = game.players[ID].get_main_inventory()
            local Contents = Inv.get_contents()
            for k,v in pairs(Contents) do
                if Medpack_Values[k] then
                    local P_S = global.dyworld.players[ID].surface
                    local P_X = global.dyworld.players[ID].posx
                    local P_Y = global.dyworld.players[ID].posy
                    local P_Loc = game.surfaces[P_S].find_entity("character", {P_X,P_Y})
                    if P_Loc and global.dyworld.players[ID].alive then
                        if (
							(
								(
									game.entity_prototypes["character"].max_health + 
									game.players[ID].character_health_bonus
								) - 
								(P_Loc.health + Medpack_Values[k])
							) >= 0
							or
							(
								global.dyworld.players[ID].rads.stored > 0
							)
						) then
                            Inv.remove({name = k, count = 1})
                            P_Loc.health = P_Loc.health + Medpack_Values[k]
							Add_Radiation(ID, -1 * Medpack_Values[k])
                            if game.forces.player.technologies["implants-3"].researched then
                            else
                                break
                            end
                        end
                    end
                end
            end
        end
	end
end