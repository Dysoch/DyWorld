

function Event_on_player_inventory_changed_armor(event)
	if not game.players[event.player_index].cheat_mode then
        local ID = event.player_index
        if not global.dyworld.players[ID].stats.changes then global.dyworld.players[ID].stats.changes = {} end
        if global.dyworld.players[ID].stats.changes.armor then
            global.dyworld.players[ID].stats.changes.armor = global.dyworld.players[ID].stats.changes.armor + 1
        else
            global.dyworld.players[ID].stats.changes.armor = 1
        end
        if not global.dyworld.players[ID].stats.codai_level then global.dyworld.players[ID].stats.codai_level = {armor = 0, xp = 0, total = 0,} end
        if game.players[ID].get_inventory(defines.inventory.character_armor) then 
            local Inv = game.players[ID].get_inventory(defines.inventory.character_armor)
            local Contents = Inv.get_contents()
            for k,v in pairs(Contents) do
                if k == "light-armor" then
                    Codia_Calc(ID, true, 0)
                elseif k == "heavy-armor" then
                    Codia_Calc(ID, true, 1)
                elseif k == "modular-armor" then
                    Codia_Calc(ID, true, 2)
                elseif k == "power-armor" then
                    Codia_Calc(ID, true, 3)
                elseif k == "power-armor-mk2" then
                    Codia_Calc(ID, true, 4)
                elseif k == "power-armor-mk3" then
                    Codia_Calc(ID, true, 5)
                elseif k == "power-armor-mk4" then
                    Codia_Calc(ID, true, 6)
                elseif k == "power-armor-mk5" then
                    Codia_Calc(ID, true, 7)
                elseif k == "power-armor-mk6" then
                    Codia_Calc(ID, true, 8)
                elseif k == "power-armor-mk7" then
                    Codia_Calc(ID, true, 9)
                elseif k == "power-armor-mk8" then
                    Codia_Calc(ID, true, 10)
                else
                    Codia_Calc(ID, true, 0)
                end
            end
        end
	end
end

function Event_on_player_inventory_changed_ammo(event)
	if not game.players[event.player_index].cheat_mode then
        local ID = event.player_index
        if not global.dyworld.players[ID].stats.changes then global.dyworld.players[ID].stats.changes = {} end
        if global.dyworld.players[ID].stats.changes.ammo then
            global.dyworld.players[ID].stats.changes.ammo = global.dyworld.players[ID].stats.changes.ammo + 1
        else
            global.dyworld.players[ID].stats.changes.ammo = 1
        end
	end
end

function Event_on_player_inventory_changed_gun(event)
	if not game.players[event.player_index].cheat_mode then
        local ID = event.player_index
        if not global.dyworld.players[ID].stats.changes then global.dyworld.players[ID].stats.changes = {} end
        if global.dyworld.players[ID].stats.changes.gun then
            global.dyworld.players[ID].stats.changes.gun = global.dyworld.players[ID].stats.changes.gun + 1
        else
            global.dyworld.players[ID].stats.changes.gun = 1
        end
	end
end

function Event_on_player_inventory_changed_main(event)
	if not game.players[event.player_index].cheat_mode then
        local ID = event.player_index
        if not global.dyworld.players[ID].stats.changes then global.dyworld.players[ID].stats.changes = {} end
        if global.dyworld.players[ID].stats.changes.main then
            global.dyworld.players[ID].stats.changes.main = global.dyworld.players[ID].stats.changes.main + 1
        else
            global.dyworld.players[ID].stats.changes.main = 1
        end
	end
end

function Event_on_player_inventory_changed_trash(event)
	if not game.players[event.player_index].cheat_mode then
        local ID = event.player_index
        if not global.dyworld.players[ID].stats.changes then global.dyworld.players[ID].stats.changes = {} end
        if global.dyworld.players[ID].stats.changes.trash then
            global.dyworld.players[ID].stats.changes.trash = global.dyworld.players[ID].stats.changes.trash + 1
        else
            global.dyworld.players[ID].stats.changes.trash = 1
        end
	end
end