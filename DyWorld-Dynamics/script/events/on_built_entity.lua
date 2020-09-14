


function Event_on_built_entity(event)
	local player = game.players[event.player_index]
	local force = player.force
	local id = event.player_index
	local name = event.created_entity.name
	local position = event.created_entity.position
	local type = event.created_entity.type
	local Time = global.dyworld.game_stats.time_stamp
	
	----- Global counter -----
	if not global.dyworld.game_stats.build_names[name] then
		global.dyworld.game_stats.build_names[name] = 1
	else
		global.dyworld.game_stats.build_names[name] = global.dyworld.game_stats.build_names[name] + 1
	end
	
	----- Personal counter -----
	global.dyworld.players[id].build = global.dyworld.players[id].build + 1
	global.dyworld.game_stats.build_amount = global.dyworld.game_stats.build_amount + 1
	
	----- Building Placement -----
	if Entity_Check(type) then
		local BuildingTable = {posx = position.x, posy = position.y}
		table.insert(global.dyworld.game_stats.building_locations, BuildingTable)
		--debug("build at: "..position.x..", "..position.y)
	end
	
	----- Story Objective Check -----
	Story_Objectives("building-player", event)
	
	-- Reenable Minimap
	if (type == "radar" and player.minimap_enabled == false) then
		for _,player in pairs(game.players) do
			player.minimap_enabled = true
			DyLog(Time..": Minimap Unlocked")
		end
	end
	
	-- Reenable Research
	if (type == "lab" and player.force.research_enabled == false) then
		for _,player in pairs(game.players) do
			player.force.enable_research()
			DyLog(Time..": Research Unlocked")
		end
	end
end