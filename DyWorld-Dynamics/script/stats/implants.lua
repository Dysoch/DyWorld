

function Reset_Implants()
    for _,Player in pairs(global.dyworld.players) do
        global.dyworld.players[Player.id].implants = {}
        for k,v in pairs(Implants) do
            global.dyworld.players[Player.id].implants[k] = {enabled = false, amount = 0}
        end
    end
end

function Implant_Check(id, implant)
	if Dy_Find_Str(implant, "bonus-player") then
		for k,v in pairs(DyWorld_Implants["bonus-player"]) do
			if Dy_Find_Str(implant, k) then
				if global.dyworld.players[id].bonuses_player[k].enabled then
					global.dyworld.players[id].bonuses_player[k].enabled = false
                    --debug(implant.." bonus is disabled")
				else
					global.dyworld.players[id].bonuses_player[k].enabled = true
                    --debug(implant.." bonus is enabled")
				end
			end
		end
	elseif Dy_Find_Str(implant, "bonus-game") then
		for k,v in pairs(DyWorld_Implants["bonus-game"]) do
			if Dy_Find_Str(implant, k) then
				
			end
		end
	elseif Dy_Find_Str(implant, "special") then
		for k,v in pairs(DyWorld_Implants["special"]) do
			if Dy_Find_Str(implant, k) then
				if k == "auto-health" then
                    
                elseif k == "auto-food" then

                elseif k == "auto-water" then
                    
                end
			end
		end
	else
		for k1,v1 in pairs(DyWorld_Implants) do
			if Dy_Find_Str(implant, k1) then
				for k2,v2 in pairs(v1) do
					if Dy_Find_Str(implant, k2) then
						global.dyworld.players[id].bonuses_player[k1].implants = global.dyworld.players[id].bonuses_player[k1].implants + v2
                        debug("used "..implant)
                        if not remote.call("space-exploration", "remote_view_is_active", {player = game.players[id]}) then
                            Bonuses(id)
                            Vitals_Check(id)
                            --debug("bonuses done")
                        end
					end
				end
			end
		end
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
                        if (((game.entity_prototypes["character"].max_health + game.players[ID].character_health_bonus) - (P_Loc.health + Medpack_Values[k])) >= 0) then
                            Inv.remove({name = k, count = 1})
                            P_Loc.health = P_Loc.health + Medpack_Values[k]
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