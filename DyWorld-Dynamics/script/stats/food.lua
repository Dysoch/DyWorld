



function Food_Add(id, amount)
	----- Safety Measures -----
	if not global.dyworld.players[id].food then global.dyworld.players[id].food = 1000 end
	if not global.dyworld.players[id].food_max then global.dyworld.players[id].food_max = 1000 end
	if not global.dyworld.players[id].food_rate then global.dyworld.players[id].food_rate = 0.33 end
	local food_per = Round(((global.dyworld.players[id].food/global.dyworld.players[id].food_max) * 100), 2)
	
	global.dyworld.players[id].food = Round((global.dyworld.players[id].food + amount), 2)
	if global.dyworld.players[id].food >= global.dyworld.players[id].food_max then
		global.dyworld.players[id].food = global.dyworld.players[id].food_max
	end
	
	global.dyworld.players[id].food_mess_4 = false
	
	if food_per > 10 and global.dyworld.players[id].food_mess_3 then
		global.dyworld.players[id].food_mess_3 = false
	elseif food_per > 25 and global.dyworld.players[id].food_mess_2 then
		global.dyworld.players[id].food_mess_2 = false
	elseif food_per > 50 and global.dyworld.players[id].food_mess_1 then
		global.dyworld.players[id].food_mess_1 = false
	end
end

function Water_Add(id, amount)
	----- Safety Measures -----
	if not global.dyworld.players[id].water then global.dyworld.players[id].water = 1000 end
	if not global.dyworld.players[id].water_max then global.dyworld.players[id].water_max = 1000 end
	if not global.dyworld.players[id].water_rate then global.dyworld.players[id].water_rate = 1.25 end
	local water_per = Round(((global.dyworld.players[id].water/global.dyworld.players[id].water_max) * 100), 2)
	
	global.dyworld.players[id].water = Round((global.dyworld.players[id].water + amount), 2)
	if global.dyworld.players[id].water >= global.dyworld.players[id].water_max then
		global.dyworld.players[id].water = global.dyworld.players[id].water_max
	end
	
	global.dyworld.players[id].water_mess_4 = false
	
	if water_per > 10 and global.dyworld.players[id].water_mess_3 then
		global.dyworld.players[id].water_mess_3 = false
	elseif water_per > 25 and global.dyworld.players[id].water_mess_2 then
		global.dyworld.players[id].water_mess_2 = false
	elseif water_per > 50 and global.dyworld.players[id].water_mess_1 then
		global.dyworld.players[id].water_mess_1 = false
	end
end

function Food_Lose(id, mult)
	----- Safety Measures -----
	if not global.dyworld.players[id].food then global.dyworld.players[id].food = 1000 end
	if not global.dyworld.players[id].food_max then global.dyworld.players[id].food_max = 1000 end
	if not global.dyworld.players[id].food_rate then global.dyworld.players[id].food_rate = 0.33 end
	local food_per = Round(((global.dyworld.players[id].food/global.dyworld.players[id].food_max) * 100), 2)
	
	global.dyworld.players[id].food = Round((global.dyworld.players[id].food - (global.dyworld.players[id].food_rate * mult)), 2)
	
	if global.dyworld.players[id].food <= 0 and global.dyworld.players[id].alive then
		local P_S = global.dyworld.players[id].surface.name
		local P_X = global.dyworld.players[id].posx
		local P_Y = global.dyworld.players[id].posy
		local P_Loc = game.surfaces[P_S].find_entity("character", {P_X,P_Y})
		if P_Loc then
			global.dyworld.players[id].food = 0
			P_Loc.damage(50, "enemy", "physical")
			if not global.dyworld.players[id].food_mess_4 then
				game.players[id].print({"looped-name.food-low-4"})
				global.dyworld.players[id].food_mess_4 = true
			end
		end
	elseif food_per <= 10 then
		if not global.dyworld.players[id].food_mess_3 then
			game.players[id].print({"looped-name.food-low-3"})
			global.dyworld.players[id].food_mess_3 = true
		end
	elseif food_per <= 25 then
		if not global.dyworld.players[id].food_mess_2 then
			game.players[id].print({"looped-name.food-low-2"})
			global.dyworld.players[id].food_mess_2 = true
		end
	elseif food_per <= 50 then
		if not global.dyworld.players[id].food_mess_1 then
			game.players[id].print({"looped-name.food-low-1"})
			global.dyworld.players[id].food_mess_1 = true
		end
	end
end

function Water_Lose(id, mult)
	----- Safety Measures -----
	if not global.dyworld.players[id].water then global.dyworld.players[id].water = 1000 end
	if not global.dyworld.players[id].water_max then global.dyworld.players[id].water_max = 1000 end
	if not global.dyworld.players[id].water_rate then global.dyworld.players[id].water_rate = 1.25 end
	local water_per = Round(((global.dyworld.players[id].water/global.dyworld.players[id].water_max) * 100), 2)
	
	global.dyworld.players[id].water = Round((global.dyworld.players[id].water - (global.dyworld.players[id].water_rate * mult)), 2)
	
	if global.dyworld.players[id].water <= 0 and global.dyworld.players[id].alive then
		local P_S = global.dyworld.players[id].surface.name
		local P_X = global.dyworld.players[id].posx
		local P_Y = global.dyworld.players[id].posy
		local P_Loc = game.surfaces[P_S].find_entity("character", {P_X,P_Y})
		if P_Loc then
			global.dyworld.players[id].water = 0
			P_Loc.damage(500, "enemy", "physical")
			if not global.dyworld.players[id].water_mess_4 then
				game.players[id].print({"looped-name.water-low-4"})
				global.dyworld.players[id].water_mess_4 = true
			end
		end
	elseif water_per <= 10 then
		if not global.dyworld.players[id].water_mess_3 then
			game.players[id].print({"looped-name.water-low-3"})
			global.dyworld.players[id].water_mess_3 = true
		end
	elseif water_per <= 25 then
		if not global.dyworld.players[id].water_mess_2 then
			game.players[id].print({"looped-name.water-low-2"})
			global.dyworld.players[id].water_mess_2 = true
		end
	elseif water_per <= 50 then
		if not global.dyworld.players[id].water_mess_1 then
			game.players[id].print({"looped-name.water-low-1"})
			global.dyworld.players[id].water_mess_1 = true
		end
	end
end