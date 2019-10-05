function getDistance(objA_X, objA_Y, objB_X, objB_Y)
    -- Get the length for each of the components x and y
    local xDist = objB_X - objA_X
    local yDist = objB_Y - objA_Y

    return math.sqrt((xDist^2)+(yDist^2)) 
end

function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function Debug_Items()
	local player = game.players[1]
	game.players[1].insert{name="dyworld-debug-armor",count=1}
	local p_armor = player.get_inventory(defines.inventory.character_armor)[1].grid
	for i = 1,400 do
		p_armor.put({name = "dyworld-debug-fusion-equipment"})
		p_armor.put({name = "dyworld-debug-shield-equipment"})
		if i <= 200 then
			p_armor.put({name = "dyworld-debug-battery-equipment"})
		end
	end
	p_armor.put({name = "dyworld-debug-roboport-equipment"})
	p_armor.put({name = "dyworld-debug-exoskeleton-equipment"})
	player.insert{name="dyworld-debug-laser-defense-equipment",count=198}
end

function GetInv()
	for z,x in pairs(global.players) do
		for c,v in pairs(game.players[x.PlayerID].get_inventory(defines.inventory.character_main).get_contents()) do
			
		end
	end
end

function Mark_Warfare_Location(posX, posY, bool)
	if not global.dyworld.Warfare then 
        global.dyworld.Warfare = {} 
        global.dyworld.Warfare.Location = {} 
    end
	global.dyworld.Warfare.Location[math.floor(posX)] = {}
	global.dyworld.Warfare.Location[math.floor(posX)] = {Y = (math.floor(posY)), Build = bool}
end

function DyWorld_write_mods()
    game.write_file('Mods.lua', inspect(game.active_mods))
end

function DyWorld_write_statistics()
    local pre = 'Statistics/' .. game.tick .. '/'
    for _, force in pairs(game.forces) do
        local folder = pre .. force.name .. '/'
        for _, count_type in pairs {'input_counts', 'output_counts'} do
            game.write_file(folder .. 'pollution-' .. count_type .. '.json', game.table_to_json(game.pollution_statistics[count_type]))
            game.write_file(folder .. 'item-' .. count_type .. '.json', game.table_to_json(force.item_production_statistics[count_type]))
            game.write_file(folder .. 'fluid-' .. count_type .. '.json',game.table_to_json( force.fluid_production_statistics[count_type]))
            game.write_file(folder .. 'kill-' .. count_type .. '.json', game.table_to_json(force.kill_count_statistics[count_type]))
            game.write_file(folder .. 'build-' .. count_type .. '.json',game.table_to_json( force.entity_build_count_statistics[count_type]))
        end
    end
end

function DyWorld_write_surfaces()
    game.remove_path('surfaces')
    for _, surface in pairs(game.surfaces) do
        game.write_file('surfaces/' .. (surface.name or surface.index) .. '.lua', inspect(surface.map_gen_settings))
    end
end