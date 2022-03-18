


--remote calls

remote.add_interface("DyWorld",
{  
	Chart = function(AMOUNT)
		game.forces.player.chart(game.player.surface, {lefttop = {x = -AMOUNT, y = -AMOUNT}, rightbottom = {x = AMOUNT, y = AMOUNT}})
	end,
	-- /c remote.call("DyWorld", "Chart", 500)
	
	Regenerate_Ore = function(NAME)
		game.regenerate_entity(NAME)
	end,
	
	Migrate = function()
		FixupUnlockedStoryTechnologies()
	end,
	-- /c remote.call("DyWorld", "Migrate")
	
	Pick_Random_Attack_Location = function()
		Pick_Random_Attack_Location()
	end,
	-- /c remote.call("DyWorld", "Pick_Random_Attack_Location")
	
	Story_Start = function()
		global.dyworld_story = true
	end,
	-- /c remote.call("DyWorld", "Story_Start")
	
	Reset_Dyson_1 = function()
		global.dyworld.game_stats.dyson_1 = {}
	end,
	-- /c remote.call("DyWorld", "Reset_Dyson_1")
	
	Reset_Implants = function()
		Reset_Implants()
	end,
	-- /c remote.call("DyWorld", "Reset_Implants")

	Skip_Phase = function(nmb)
		nmb = nmb or 1
		for i = 1,nmb do
			Phase_Forward()
		end
	end,
	-- /c remote.call("DyWorld", "Skip_Phase", 1)
	
	Reset_Side_Objectives = function()
		Populate_Side_Objectives_Table_Startup(true)
	end,
	-- /c remote.call("DyWorld", "Reset_Side_Objectives")
	
	Fix_Research = function()
		if not global.Tech_Fixed then
			for k,v in pairs(game.technology_prototypes) do
				if v.hidden then
					if not game.forces.player.technologies[v.name].researched then
						game.forces.player.technologies[v.name].researched = true
					end
				end
			end
			global.Tech_Fixed = true
		end
	end,
	-- /c remote.call("DyWorld", "Fix_Research")
	
	Pause_Story = function()
		if not global.dyworld.game_stats.story_pause then global.dyworld.game_stats.story_pause = false end
		if global.dyworld.game_stats.story_pause then
			global.dyworld.game_stats.story_pause = false
		else
			global.dyworld.game_stats.story_pause = true
		end
	end,
	-- /c remote.call("DyWorld", "Pause_Story")
	
	allow_aai_crash_sequence = function(data) return {allow = false, weight = 1} end,
	
	informatron_menu = function(data)
		return dyworld_menu(data.player_index)
	end,
	
	informatron_page_content = function(data)
		return dyworld_page_content(data.page_name, data.player_index, data.element)
	end
})
