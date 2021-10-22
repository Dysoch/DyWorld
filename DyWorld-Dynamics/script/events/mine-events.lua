
local CC = 100

function Event_on_picked_up_item(event)
	local player = game.players[event.player_index]
	local force = player.force
	local name = event.item_stack.name
	local count = event.item_stack.count
	--PlayerPrint("picked up item: "..name.." "..count.."x")
	
	----- Personal counter -----
	global.dyworld.players[event.player_index].picked = global.dyworld.players[event.player_index].picked + count
	global.dyworld.game_stats.picked_amount = global.dyworld.game_stats.picked_amount + count
end

function Event_on_player_mined_item(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.item_stack.name
	local count = event.item_stack.count
	
	----- Global counter -----
	if not global.dyworld.game_stats.mined_names[name] then
		global.dyworld.game_stats.mined_names[name] = (count >= CC and (math.floor(count/CC)) or count)
	else
		global.dyworld.game_stats.mined_names[name] = global.dyworld.game_stats.mined_names[name] + (count >= CC and (math.floor(count/CC)) or count)
	end
	
	if not global.dyworld.game_stats.mined then global.dyworld.game_stats.mined = {} end
	if not global.dyworld.game_stats.mined[name] then
		global.dyworld.game_stats.mined[name] = true
	end
	
	----- Personal counter -----
	global.dyworld.players[id].mined = global.dyworld.players[id].mined + (count >= CC and (math.floor(count/CC)) or count)
	global.dyworld.game_stats.mined_amount = global.dyworld.game_stats.mined_amount + (count >= CC and (math.floor(count/CC)) or count)
	
	if global.dyworld_story then
		----- Story Objective Check -----
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("mining-item", event)
		end
	end
end

function Event_on_pre_player_mined_item(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.entity.name
	local type = event.entity.type
	
	if global.dyworld_story then
		----- Story Objective Check -----
		if not global.dyworld.game_stats.story_pause then
			Story_Objectives("pre-mining-item", event)
		end
	end
end

function Event_on_player_mined_entity(event)
	local player = game.players[event.player_index]
	local force = player.force
	local position = event.entity.position
	local type = event.entity.type
	local name = event.entity.name
	
	if not global.dyworld.game_stats.mined then global.dyworld.game_stats.mined = {} end
	if not global.dyworld.game_stats.mined[name] then
		global.dyworld.game_stats.mined[name] = true
	end
	
	----- Building Placement -----
	if Entity_Check(type) then
		local surface = event.entity.surface.name
		if not global.dyworld.game_stats.building_locations[surface] then global.dyworld.game_stats.building_locations[surface] = {} end
		for k,v in pairs(global.dyworld.game_stats.building_locations[surface]) do
			if (position.x == v.posx and position.y == v.posy) then
				table.remove(global.dyworld.game_stats.building_locations[surface], k)
				break
			end
		end
	end

	----- Mining Network Building -----
	if Dy_Find_Str(name, "asteroid-network-interface") then
        for Metal_Name,Metal_Table in pairs(Dy_Metals) do
            if Dy_Find_Str(name, Metal_Name) then
                if Dy_Find_Str(name, "-impure") then
                    if global.dyworld.game_stats.space_mining.interfaces and global.dyworld.game_stats.space_mining.interfaces.impure and global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name] and global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs then
                        for k,v in pairs(global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs) do
                            local surface = event.entity.surface.name
                            if (position.x == v.PosX and position.y == v.PosY and surface == v.Surface) then
                                table.remove(global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs, k)
                                global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts = global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts - 1
                                break
                            end
                        end
                    end
                elseif Dy_Find_Str(name, "-pure") then
                    if global.dyworld.game_stats.space_mining.interfaces and global.dyworld.game_stats.space_mining.interfaces.pure and global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name] and global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs then
                        for k,v in pairs(global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs) do
                            local surface = event.entity.surface.name
                            if (position.x == v.PosX and position.y == v.PosY and surface == v.Surface) then
                                table.remove(global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs, k)
                                global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts = global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts - 1
                                break
                            end
                        end
                    end
                end
            end
        end
	end
	
	if global.dyworld_story then
		if (type == "radar") then
			if not global.dyworld.game_stats.radars then global.dyworld.game_stats.radars = 0 end
			global.dyworld.game_stats.radars = global.dyworld.game_stats.radars - 1
			if global.dyworld.game_stats.radars <= 0 then
				global.dyworld.game_stats.radars = 0 
				for k,v in pairs(global.dyworld.players) do
					if game.players[v.id].minimap_enabled then
						game.players[v.id].minimap_enabled = false
					end
				end
			end
		end
		if (type == "inserter") then
			if not global.dyworld.game_stats.inserters then global.dyworld.game_stats.inserters = 0 end
			global.dyworld.game_stats.inserters = global.dyworld.game_stats.inserters - 1
			if global.dyworld.game_stats.inserters <= 0 then
				global.dyworld.game_stats.inserters = 0 
			end
			InserterCheck(global.dyworld.game_stats.inserters)
		end
		if (type == "lab") then
			if not global.dyworld.game_stats.labs then global.dyworld.game_stats.labs = 0 end
			global.dyworld.game_stats.labs = global.dyworld.game_stats.labs - 1
			if global.dyworld.game_stats.labs <= 0 then
				global.dyworld.game_stats.labs = 0 
			end
		end
	end
end

function Event_on_robot_mined_entity(event)
	local position = event.entity.position
	local type = event.entity.type
	local name = event.entity.name
	
	global.dyworld.game_stats.mined_amount = global.dyworld.game_stats.mined_amount + 1
	if not global.dyworld.game_stats.mined then global.dyworld.game_stats.mined = {} end
	if not global.dyworld.game_stats.mined[name] then
		global.dyworld.game_stats.mined[name] = true
	end
	
	----- Building Placement -----
	if Entity_Check(type) then
		local surface = event.entity.surface.name
		if not global.dyworld.game_stats.building_locations[surface] then global.dyworld.game_stats.building_locations[surface] = {} end
		for k,v in pairs(global.dyworld.game_stats.building_locations[surface]) do
			if (position.x == v.posx and position.y == v.posy) then
				table.remove(global.dyworld.game_stats.building_locations[surface], k)
				break
			end
		end
	end

	----- Mining Network Building -----
	if Dy_Find_Str(name, "asteroid-network-interface") then
        for Metal_Name,Metal_Table in pairs(Dy_Metals) do
            if Dy_Find_Str(name, Metal_Name) then
                if Dy_Find_Str(name, "-impure") then
                    if global.dyworld.game_stats.space_mining.interfaces and global.dyworld.game_stats.space_mining.interfaces.impure and global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name] and global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs then
                        for k,v in pairs(global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs) do
                            local surface = event.entity.surface.name
                            if (position.x == v.PosX and position.y == v.PosY and surface == v.Surface) then
                                table.remove(global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].locs, k)
                                global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts = global.dyworld.game_stats.space_mining.interfaces.impure[Metal_Name].amounts - 1
                                break
                            end
                        end
                    end
                elseif Dy_Find_Str(name, "-pure") then
                    if global.dyworld.game_stats.space_mining.interfaces and global.dyworld.game_stats.space_mining.interfaces.pure and global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name] and global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs then
                        for k,v in pairs(global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs) do
                            local surface = event.entity.surface.name
                            if (position.x == v.PosX and position.y == v.PosY and surface == v.Surface) then
                                table.remove(global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].locs, k)
                                global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts = global.dyworld.game_stats.space_mining.interfaces.pure[Metal_Name].amounts - 1
                                break
                            end
                        end
                    end
                end
            end
        end
	end
	
	if global.dyworld_story then
		if (type == "radar") then
			if not global.dyworld.game_stats.radars then global.dyworld.game_stats.radars = 0 end
			global.dyworld.game_stats.radars = global.dyworld.game_stats.radars - 1
			if global.dyworld.game_stats.radars <= 0 then
				global.dyworld.game_stats.radars = 0 
				for k,v in pairs(global.dyworld.players) do
					if game.players[v.id].minimap_enabled then
						game.players[v.id].minimap_enabled = false
					end
				end
			end
		end
		if (type == "lab") then
			if not global.dyworld.game_stats.labs then global.dyworld.game_stats.labs = 0 end
			global.dyworld.game_stats.labs = global.dyworld.game_stats.labs - 1
			if global.dyworld.game_stats.labs <= 0 then
				global.dyworld.game_stats.labs = 0 
			end
		end
		if (type == "inserter") then
			if not global.dyworld.game_stats.inserters then global.dyworld.game_stats.inserters = 0 end
			global.dyworld.game_stats.inserters = global.dyworld.game_stats.inserters - 1
			if global.dyworld.game_stats.inserters <= 0 then
				global.dyworld.game_stats.inserters = 0 
			end
			InserterCheck(global.dyworld.game_stats.inserters)
		end
	end
end

function Event_on_robot_mined(event)

end