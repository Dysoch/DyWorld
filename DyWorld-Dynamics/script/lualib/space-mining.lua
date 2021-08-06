



function SPM_Impure()
    for k,v in pairs(global.dyworld.game_stats.space_mining.interfaces.impure) do
        if global.dyworld.game_stats.space_mining[k] then 
            local Containers_Amount = v.amounts
            local Ore_Name = k
            local Ore_Amount = global.dyworld.game_stats.space_mining[k].impure_mined
            local Ore_Per_Container = math.floor(Ore_Amount / Containers_Amount)
            if Ore_Per_Container >= 1 then
                for _, Loc_Table in pairs(v.locs) do
                    local X = Loc_Table.PosX
                    local Y = Loc_Table.PosY
                    local Z = Loc_Table.Surface
                    local radi = 2
                    local P_Loc = game.surfaces[Z].find_entity("asteroid-network-interface-"..k.."-impure", {X,Y})
                    if P_Loc then
                        for i = 1,Ore_Per_Container do
                            if P_Loc.can_insert({name = k.."-ore-impure", count = 1}) then
                                P_Loc.insert({name = k.."-ore-impure", count = 1})
                                global.dyworld.game_stats.space_mining[k].impure_mined = global.dyworld.game_stats.space_mining[k].impure_mined - 1
                            else break
                            end
                        end
                    end
                end
            end
        end
    end
end

function SPM_Pure()
    for k,v in pairs(global.dyworld.game_stats.space_mining.interfaces.pure) do
        if global.dyworld.game_stats.space_mining[k] then 
            local Containers_Amount = v.amounts
            local Ore_Name = k
            local Ore_Amount = global.dyworld.game_stats.space_mining[k].pure_mined
            local Ore_Per_Container = math.floor(Ore_Amount / Containers_Amount)
            if Ore_Per_Container >= 1 then
                for _, Loc_Table in pairs(v.locs) do
                    local X = Loc_Table.PosX
                    local Y = Loc_Table.PosY
                    local Z = Loc_Table.Surface
                    local radi = 2
                    local P_Loc = game.surfaces[Z].find_entity("asteroid-network-interface-"..k.."-pure", {X,Y})
                    if P_Loc then
                        for i = 1,Ore_Per_Container do
                            if P_Loc.can_insert({name = k.."-ore", count = 1}) then
                                P_Loc.insert({name = k.."-ore", count = 1})
                                global.dyworld.game_stats.space_mining[k].pure_mined = global.dyworld.game_stats.space_mining[k].pure_mined - 1
                            else break
                            end
                        end
                    end
                end
            end
        end
    end
end