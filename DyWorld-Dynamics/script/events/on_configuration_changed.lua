


function Event_on_configuration_changed()
	local Time = global.dyworld.game_stats.time_stamp
	if (global.dyworld and global.dyworld.story and global.dyworld.story.act) then
		global.dyworld.story = Story_Add(global.dyworld.story.act, global.dyworld.story.phase, false, 1, 1)
	end
	PlayerPrint("Update for DyWorld-Dynamics detected. Updating Story. Objectives reset. Migrated from version: "..global.dyworld.version.." to version: "..Version_Build)
	global.dyworld.version = Version_Build
	
	if game.players and game.players[1] then
		for k,v in pairs(game.players) do
			v.force.reset_technology_effects()
		end
	end
	
	Reunlock_Recipes()
	if global.dyworld.version == "0.7.94" then
		global.dyworld.game_stats.radars = 0
		global.dyworld.game_stats.inserters = 0
		global.dyworld.game_stats.research = 0
		for k,v in pairs(global.dyworld.players) do
			if not v.strength then v.strength = 1 end
			if not v.constitution then v.constitution = 1 end
			if not v.dexterity then v.dexterity = 1 end
			if not v.intelligence then v.intelligence = 1 end
			if not v.wisdom then v.wisdom = 1 end
			if not v.charisma then v.charisma = 1 end
			if not v.crafted then v.crafted = 1 end
			if not v.mined then v.mined = 1 end
			if not v.build then v.build = 1 end
			if not v.killed then v.killed = 1 end
			if not v.picked then v.picked = 1 end
			if not v.distance then v.distance = 0 end
			if not v.posx2 then v.posx2 = 0 end
			if not v.posy2 then v.posy2 = 0 end
		end
	end
end