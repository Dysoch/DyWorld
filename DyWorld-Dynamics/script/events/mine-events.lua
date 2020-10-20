


function Event_on_picked_up_item(event)
	local player = game.players[event.player_index]
	local force = player.force
	local name = event.item_stack.name
	local count = event.item_stack.count
	--PlayerPrint("picked up item: "..name.." "..count.."x")
end

function Event_on_player_mined_item(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.item_stack.name
	local count = event.item_stack.count
	
	----- Global counter -----
	if not global.dyworld.game_stats.mined_names[name] then
		global.dyworld.game_stats.mined_names[name] = count
	else
		global.dyworld.game_stats.mined_names[name] = global.dyworld.game_stats.mined_names[name] + count
	end
	
	----- Personal counter -----
	global.dyworld.players[id].mined = global.dyworld.players[id].mined + count
	global.dyworld.game_stats.mined_amount = global.dyworld.game_stats.mined_amount + count
	
	----- Story Objective Check -----
	Story_Objectives("mining-item", event)
end

function Event_on_pre_player_mined_item(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.entity.name
	local type = event.entity.type
	
	----- Story Objective Check -----
	Story_Objectives("pre-mining-item", event)
end

function Event_on_player_mined_entity(event)
	local player = game.players[event.player_index]
	local force = player.force
	local position = event.entity.position
	local type = event.entity.type
	local name = event.entity.name
	
	----- Building Placement -----
	if Entity_Check(type) then
		for k,v in pairs(global.dyworld.game_stats.building_locations) do
			if (position.x == v.posx and position.y == v.posy) then
				table.remove(global.dyworld.game_stats.building_locations, k)
				--debug("removed building at: "..position.x..", "..position.y)
				break
			end
		end
	end
	
	----- Difficulty -----
	if (name == "burner-radar") then
		if global.dyworld.game_stats.difficulty > ((5 * global.dyworld.game_stats.players) + 1) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty - (5 * global.dyworld.game_stats.players)
		else
			global.dyworld.game_stats.difficulty = 1
		end
	end
	if (name == "radar-1") then
		if global.dyworld.game_stats.difficulty > ((50 * global.dyworld.game_stats.players) + 1) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty - (50 * global.dyworld.game_stats.players)
		else
			global.dyworld.game_stats.difficulty = 1
		end
	end
	if (name == "radar-2") then
		if global.dyworld.game_stats.difficulty > ((125 * global.dyworld.game_stats.players) + 1) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty - (125 * global.dyworld.game_stats.players)
		else
			global.dyworld.game_stats.difficulty = 1
		end
	end
	if (name == "radar-3") then
		if global.dyworld.game_stats.difficulty > ((250 * global.dyworld.game_stats.players) + 1) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty - (250 * global.dyworld.game_stats.players)
		else
			global.dyworld.game_stats.difficulty = 1
		end
	end
	if (name == "radar-4") then
		if global.dyworld.game_stats.difficulty > ((500 * global.dyworld.game_stats.players) + 1) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty - (500 * global.dyworld.game_stats.players)
		else
			global.dyworld.game_stats.difficulty = 1
		end
	end
end

function Event_on_robot_mined_entity(event)
	local position = event.entity.position
	local type = event.entity.type
	local name = event.entity.name
	
	----- Building Placement -----
	if Entity_Check(type) then
		for k,v in pairs(global.dyworld.game_stats.building_locations) do
			if (position.x == v.posx and position.y == v.posy) then
				table.remove(global.dyworld.game_stats.building_locations, k)
				--debug("removed building at: "..position.x..", "..position.y)
				break
			end
		end
	end
	
	----- Difficulty -----
	if (name == "burner-radar") then
		if global.dyworld.game_stats.difficulty > ((5 * global.dyworld.game_stats.players) + 1) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty - (5 * global.dyworld.game_stats.players)
		else
			global.dyworld.game_stats.difficulty = 1
		end
	end
	if (name == "radar-1") then
		if global.dyworld.game_stats.difficulty > ((50 * global.dyworld.game_stats.players) + 1) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty - (50 * global.dyworld.game_stats.players)
		else
			global.dyworld.game_stats.difficulty = 1
		end
	end
	if (name == "radar-2") then
		if global.dyworld.game_stats.difficulty > ((125 * global.dyworld.game_stats.players) + 1) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty - (125 * global.dyworld.game_stats.players)
		else
			global.dyworld.game_stats.difficulty = 1
		end
	end
	if (name == "radar-3") then
		if global.dyworld.game_stats.difficulty > ((250 * global.dyworld.game_stats.players) + 1) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty - (250 * global.dyworld.game_stats.players)
		else
			global.dyworld.game_stats.difficulty = 1
		end
	end
	if (name == "radar-4") then
		if global.dyworld.game_stats.difficulty > ((500 * global.dyworld.game_stats.players) + 1) then
			global.dyworld.game_stats.difficulty = global.dyworld.game_stats.difficulty - (500 * global.dyworld.game_stats.players)
		else
			global.dyworld.game_stats.difficulty = 1
		end
	end
end

function Event_on_robot_mined(event)

end