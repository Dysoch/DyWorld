


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
	
	--[[informatron_menu = function(data)
		return dyworld_menu(data.player_index)
	end,
	
	informatron_page_content = function(data)
		return dyworld_page_content(data.page_name, data.player_index, data.element)
	end]]--
})