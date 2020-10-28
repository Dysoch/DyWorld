


function Event_on_configuration_changed()
	if (global.dyworld and global.dyworld.story and global.dyworld.story.act) then
		global.dyworld.story = Story_Add(global.dyworld.story.act, global.dyworld.story.phase, false, 1, 1)
	end
	PlayerPrint("Updated DyWorld-Dynamics Build detected. Updating Story. Objectives reset. Migrated from version: "..global.dyworld.version.." to version: "..Version_Build)
	global.dyworld.version = Version_Build
	
	Reunlock_Recipes()
	
	for k,v in pairs(game.forces.player.technologies) do
		if v.researched then
			v.researched = false
			v.researched = true
		end
	end
end