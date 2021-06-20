


function Event_on_configuration_changed()
	local Time = global.dyworld.game_stats.time_stamp
	if (global.dyworld and global.dyworld.story and global.dyworld.story.act) then
		global.dyworld.story = Story_Add(global.dyworld.story.act, global.dyworld.story.phase, false, 1, 1)
	end
	PlayerPrint("Update for DyWorld-Dynamics detected. Updating Story. Objectives reset. Migrated from version: "..global.dyworld.version.." to version: "..Version_Build)
	
	if global.dyworld.version == "0.7.95" then
		for k,v in pairs(global.dyworld.players) do
			if not v.food then v.food = 1000 end
			if not v.food_max then v.food_max = 1000 end
			if not v.food_rate then v.food_rate = 0.33 end
			if not v.food_mess_1 then v.food_mess_1 = false end
			if not v.food_mess_2 then v.food_mess_2 = false end
			if not v.food_mess_3 then v.food_mess_3 = false end
			if not v.food_mess_4 then v.food_mess_4 = false end
			if not v.water then v.water = 1000 end
			if not v.water_max then v.water_max = 1000 end
			if not v.water_rate then v.water_rate = 1.25 end
			if not v.water_mess_1 then v.water_mess_1 = false end
			if not v.water_mess_2 then v.water_mess_2 = false end
			if not v.water_mess_3 then v.water_mess_3 = false end
			if not v.water_mess_4 then v.water_mess_4 = false end
			if not v.surface then v.surface = "nauvis" end
		end
	end
	
	global.dyworld.version = Version_Build
	
	if game.players and game.players[1] then
		for k,v in pairs(game.players) do
			v.force.reset_technology_effects()
		end
	end
	
	Reunlock_Recipes()
end