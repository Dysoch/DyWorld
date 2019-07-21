require "roadmap"

function IncrementerGlobal(NAME, AMOUNT, ITEMNAME)
	local ITEMNAME2 = ITEMNAME or "nil"
	if not global.stats[NAME] then 
		global.stats[NAME] = AMOUNT 
	else
		global.stats[NAME] = global.stats[NAME] + AMOUNT
	end
end

function IncrementerPersonal(NAME, AMOUNT, ID, ITEMNAME)
	local ITEMNAME2 = ITEMNAME or "nil"
	if not global.players[ID].crafted then global.players[ID].crafted = {} end
	if not global.players[ID].mined then global.players[ID].mined = {} end
	if not global.players[ID].build then global.players[ID].build = {} end
	if not global.players[ID].stats[NAME] then 
		global.players[ID].stats[NAME] = AMOUNT 
	else
		global.players[ID].stats[NAME] = global.players[ID].stats[NAME] + AMOUNT
	end
	if NAME == "crafted" then
		if not global.players[ID].crafted[ITEMNAME] then 
			global.players[ID].crafted[ITEMNAME] = {Amount_Crafted = AMOUNT, XP_Multiplier = 1}
			Calc_Crafting_XP(AMOUNT, ID, ITEMNAME)
			debug2("Player "..ID..": XP added (Crafting): "..(Round((1 * global.players[ID].crafted[ITEMNAME].XP_Multiplier), 2) * AMOUNT).." for "..ITEMNAME.." ("..global.players[ID].crafted[ITEMNAME].Amount_Crafted.." crafted total)") 
		else
			global.players[ID].crafted[ITEMNAME].Amount_Crafted = global.players[ID].crafted[ITEMNAME].Amount_Crafted + AMOUNT
			Calc_Crafting_XP(AMOUNT, ID, ITEMNAME)
			--debug2("Player "..ID..": XP multiplier (Crafting): "..global.players[ID].crafted[ITEMNAME].XP_Multiplier.." for "..ITEMNAME)
			debug2("Player "..ID..": XP added (Crafting): "..(Round((1 * global.players[ID].crafted[ITEMNAME].XP_Multiplier), 2) * AMOUNT).." for "..ITEMNAME.." ("..global.players[ID].crafted[ITEMNAME].Amount_Crafted.." crafted total)")
		end
	end
	if NAME == "mined" then
		if not global.players[ID].mined[ITEMNAME] then 
			global.players[ID].mined[ITEMNAME] = {Amount_Mined = AMOUNT, XP_Multiplier = 1} 
			Calc_Mining_XP(AMOUNT, ID, ITEMNAME)
			debug2("Player "..ID..": XP added (Mining): "..(Round((2 * global.players[ID].mined[ITEMNAME].XP_Multiplier), 2) * AMOUNT).." for "..ITEMNAME.." ("..global.players[ID].mined[ITEMNAME].Amount_Mined.." mined total)")
		else
			global.players[ID].mined[ITEMNAME].Amount_Mined = global.players[ID].mined[ITEMNAME].Amount_Mined + AMOUNT
			Calc_Mining_XP(AMOUNT, ID, ITEMNAME)
			--debug2("Player "..ID..": XP multiplier (Mining): "..global.players[ID].mined[ITEMNAME].XP_Multiplier.." for "..ITEMNAME)
			debug2("Player "..ID..": XP added (Mining): "..(Round((2 * global.players[ID].mined[ITEMNAME].XP_Multiplier), 2) * AMOUNT).." for "..ITEMNAME.." ("..global.players[ID].mined[ITEMNAME].Amount_Mined.." mined total)")
		end
	end
	if NAME == "build" then
		if not global.players[ID].build[ITEMNAME] then 
			global.players[ID].build[ITEMNAME] = {Amount_Build = AMOUNT, XP_Multiplier = 1} 
			Calc_Building_XP(AMOUNT, ID, ITEMNAME)
			debug2("Player "..ID..": XP added (Building): "..Round((1 * global.players[ID].build[ITEMNAME].XP_Multiplier), 2).." for "..ITEMNAME.." ("..global.players[ID].build[ITEMNAME].Amount_Build.." build total)")
		else
			global.players[ID].build[ITEMNAME].Amount_Build = global.players[ID].build[ITEMNAME].Amount_Build + AMOUNT
			Calc_Building_XP(AMOUNT, ID, ITEMNAME)
			--debug2("Player "..ID..": XP multiplier (Building): "..global.players[ID].build[ITEMNAME].XP_Multiplier.." for "..ITEMNAME)
			debug2("Player "..ID..": XP added (Building): "..Round((1 * global.players[ID].build[ITEMNAME].XP_Multiplier), 2).." for "..ITEMNAME.." ("..global.players[ID].build[ITEMNAME].Amount_Build.." build total)")
		end
	end
end

function Calc_Crafting_XP(AMOUNT, ID, ITEMNAME)
	if global.players[ID].crafted[ITEMNAME].XP_Multiplier >= 0.06 then
		global.players[ID].crafted[ITEMNAME].XP_Multiplier = 1.04 - Round((global.players[ID].crafted[ITEMNAME].Amount_Crafted / 250), 5)
	else
		global.players[ID].crafted[ITEMNAME].XP_Multiplier = 0.05
	end
end

function XP_Crafting(ID, NAME, AMOUNT)
	if not global.players[ID].XP then 
		global.players[ID].XP = (Round((1 * global.players[ID].crafted[NAME].XP_Multiplier), 2) * AMOUNT)
	else
		global.players[ID].XP = global.players[ID].XP + (Round((1 * global.players[ID].crafted[NAME].XP_Multiplier), 2) * AMOUNT)
		global.dyworld.XP = global.dyworld.XP + (Round((1 * global.players[ID].crafted[NAME].XP_Multiplier), 2) * AMOUNT)
		
	end
	Level_Up(ID)
end

function Calc_Mining_XP(AMOUNT, ID, ITEMNAME)
	if global.players[ID].mined[ITEMNAME].XP_Multiplier >= 0.26 then
		global.players[ID].mined[ITEMNAME].XP_Multiplier = 1 - Round((global.players[ID].mined[ITEMNAME].Amount_Mined / 1000), 5)
	else
		global.players[ID].mined[ITEMNAME].XP_Multiplier = 0.25
	end
end

function XP_Mining(ID, NAME, AMOUNT)
	if not global.players[ID].XP then 
		global.players[ID].XP = (Round((2 * global.players[ID].mined[NAME].XP_Multiplier), 2) * AMOUNT)
	else
		global.players[ID].XP = global.players[ID].XP + (Round((2 * global.players[ID].mined[NAME].XP_Multiplier), 2) * AMOUNT)
		global.dyworld.XP = global.dyworld.XP + (Round((2 * global.players[ID].mined[NAME].XP_Multiplier), 2) * AMOUNT)
	end
	Level_Up(ID)
end

function Calc_Building_XP(AMOUNT, ID, ITEMNAME)
	if global.players[ID].build[ITEMNAME].XP_Multiplier >= 0.06 then
		global.players[ID].build[ITEMNAME].XP_Multiplier = 1 - Round((global.players[ID].build[ITEMNAME].Amount_Build / 10000), 5)
	else
		global.players[ID].build[ITEMNAME].XP_Multiplier = 0.05
	end
end

function XP_Building(ID, NAME, AMOUNT)
	if not global.players[ID].XP then 
		global.players[ID].XP = (Round((1 * global.players[ID].build[NAME].XP_Multiplier), 2) * AMOUNT)
	else
		global.players[ID].XP = global.players[ID].XP + (Round((1 * global.players[ID].build[NAME].XP_Multiplier), 2) * AMOUNT)
		global.dyworld.XP = global.dyworld.XP + (Round((1 * global.players[ID].build[NAME].XP_Multiplier), 2) * AMOUNT)
	end
	Level_Up(ID)
end

function XP_Small(ID)
	if not global.players[ID].XP then 
		global.players[ID].XP = 0.1 
	else
		global.players[ID].XP = global.players[ID].XP + 0.1
		global.dyworld.XP = global.dyworld.XP + 0.1
	end
	Level_Up(ID)
end

function XP_Full(ID)
	if not global.players[ID].XP then 
		global.players[ID].XP = 1 
	else
		global.players[ID].XP = global.players[ID].XP + 1
		global.dyworld.XP = global.dyworld.XP + 1
	end
	Level_Up(ID)
end

function XP_All_Small()
	for k,v in pairs(global.players) do
		if v.Alive then
			if not v.XP then 
				v.XP = 0.1 
			else
				v.XP = v.XP + 0.1
				global.dyworld.XP = global.dyworld.XP + 0.1
			end
			if v.Playing then
				Level_Up(v.PlayerID)
			end
		end
	end
end

function XP_All_Full()
	if not global.dyworld.Migration_Check then
		for k,v in pairs(global.players) do
			if v.Alive then
				if not v.XP then 
					v.XP = 1 
				else
					v.XP = v.XP + 1
					global.dyworld.XP = global.dyworld.XP + 1
				end
				if v.Playing then
					Level_Up(v.PlayerID)
				end
			end
		end
	end
end

function Level_Up(ID)
	if global.players[ID].XP >= global.players[ID].XP_LevelUp then
		global.players[ID].Level = global.players[ID].Level + 1
		global.dyworld.Level = global.dyworld.Level + 1
		global.players[ID].XP = global.players[ID].XP - global.players[ID].XP_LevelUp
		global.players[ID].XP_LevelUp = math.floor(( (100 + (global.players[ID].Level * 75)) + math.random(100 + (global.players[ID].Level * 100))) * (1 + (global.players[ID].Level / 10)))
		PlayerPrint({"dyworld.levelup", (global.players[ID].Level), (game.players[ID].name)})
		debug(game.players[ID].name.." leveled up to level "..global.players[ID].Level)
	end
end

function BodySkills(id)
	local P_Level = global.players[id].Level
	local mp = global.dyworld.Players
	local gsc = global.players[id].stats.crafted or 1
	local gsm = global.players[id].stats.mined or 1
	local gsb = global.players[id].stats.build or 1
	local gsp = global.players[id].stats.pickup or 1
	local gsk = global.stats.killed or 1
	local gss = global.stats.scanned or 1
	local gsr = global.stats.research or 1
	local gsgb = global.stats.ghostbuild or 1
	local gsgm = global.stats.ghostmined or 1
	local p1 = global.players[id].physical.strength
	local p2 = global.players[id].physical.endurance
	local p3 = global.players[id].physical.speed
	local p4 = global.players[id].physical.creations
	local p5 = global.players[id].physical.implants 
	local m1 = global.players[id].mystical.spirit
	local m2 = global.players[id].mystical.intelligence
	local m3 = global.players[id].mystical.wisdom
	local m4 = global.players[id].mystical.guile
	local m5 = global.players[id].mystical.knowledge
	-- p5 is done with research and crafting! implants will be installed, each with a base number to increase the value
	--@todo Implement Implants
	global.players[id].physical.creations = math.floor(((gsb+gsc)+(gsgb/25))/(1000))
	global.players[id].mystical.guile = math.floor(((((gsc+gsm)/25)+((gsb+(gsgb/100))/50)+gsk)/(1000))+1)
	global.players[id].mystical.intelligence = math.floor(((((p4+m4)*5)+gss)/(1000))+1)
	global.players[id].physical.endurance = math.floor((((gsc/25)+(gsm/25)+(gsb/5)+(gsk)+(p5*50)+(gsp/50))/(1000))+1)
	global.players[id].physical.strength = math.floor((((gsm)+(gsb/5)+(gsc/25)+(p5*75)+(p2*100)+(m2*25)+(gsp/50))/(1000))+1)
	global.players[id].mystical.spirit = math.floor((((p1*35)+((gsgb+gsgm)/5)+(gsk/25)+gss)/(1000))+1)
	global.players[id].physical.speed = math.floor((((p1*25)+(p2*50)+(m1*10)+gsk+gss)/(1000))+1)
	global.players[id].mystical.wisdom = math.floor(((((m1+m2+m4)*25)+((gsc+gsm+gsb+gsk+gss+gsgb+gsgm)/25))/(1000))+1)
	global.players[id].mystical.knowledge = math.floor((((m1*5)+(m2*50)+(m3*40)+(m4*10)+(gsr))/(1000))+1)
	if game.players[id].character then
		if P_Level >= 2 then
			if gsm >= 500 then
				game.players[id].character_mining_speed_modifier = ((((p1*25)+(p2*15)+(p3*15)+gsm)/10000)-0.0016)
			end
			if gsc >= 100 then
				game.players[id].character_crafting_speed_modifier = ((((p4*25)+(p3*15)+gsc)/10000)-0.0016)
			end
		end
		if P_Level >= 4 then
			game.players[id].character_resource_reach_distance_bonus = math.floor((gsp+gsm+(p2*5)+(m1*2))/10000)
		end
		if P_Level >= 7 and gsk >= 1 then
			game.players[id].character_health_bonus = math.floor(((p1*5)+(p2*2)+(m1*5)+p3+(gsk/250))-13)
			if math.floor(((p4*5)+(p2*3)+p3+m1+m2+m3)/50) > 320 then
				game.players[id].character_loot_pickup_distance_bonus = 320
			else
				game.players[id].character_loot_pickup_distance_bonus = math.floor(((p4*5)+(p2*3)+p3+m1+m2+m3)/50)
			end
		end
		if P_Level >= 10 then
			if math.floor((p1)/5) <= 190 then
				game.players[id].character_inventory_slots_bonus = math.floor((p1)/5)
			else
				game.players[id].character_inventory_slots_bonus = 190
			end
		end
		if P_Level >= 15 then
			game.players[id].character_reach_distance_bonus = math.floor((gsp+gsb+(p2*5)+(m1*2))/5000)
			if gsb >= 15000 then
				game.players[id].character_build_distance_bonus = math.floor((gsp+gsb+gsc+(p2*5)+(m1*2))/7500)
			end
		end
		if P_Level >= 25 then
			game.players[id].character_maximum_following_robot_count_bonus = math.floor(((p1*2)+(p2*10)+(p3*3)+(p4*1.5)+(m1*10)+(m2*3)+(m3*2)+(m4*25))/250)
		end
		if P_Level >= 30 then
			if game.forces.player.technologies["character-logistic-slots-1"].researched then 
				if math.floor((((gsgb + gsgm) / 25)+(p1))/15) <= 190 then
					game.players[id].character_logistic_slot_count_bonus = math.floor((((gsgb + gsgm) / 25)+(m2))/15)
				else
					game.players[id].character_logistic_slot_count_bonus = 190
				end
			end
		end
	end
	--@todo add more bonuses
	--
	--@todo Add inserter and stack inserter stack size bonus 
	--@body based on picked up stat, level 20+
	--
	--@todo Add worker robot bonus
	--@body based on inventory bonus, level 35+
	--
	--@todo Add mining drill prod bonus
	--@body based on mined and build stats, level 50+
	--
	--@todo Add train breaking bonus
	--@body based on almost all stats, level 75+
end

function GlobalSkillsReset()
	global.dyworld.Strength = 0
	global.dyworld.Endurance = 0
	global.dyworld.Speed = 0
	global.dyworld.Creations = 0
	global.dyworld.Implants = 0
	global.dyworld.Spirit = 0
	global.dyworld.Intelligence = 0
	global.dyworld.Wisdom = 0
	global.dyworld.Guile = 0
	global.dyworld.Knowledge = 0
end

function GlobalSkills(id)
	global.dyworld.Strength = global.dyworld.Strength + global.players[id].physical.strength
	global.dyworld.Endurance = global.dyworld.Endurance + global.players[id].physical.endurance
	global.dyworld.Speed = global.dyworld.Speed + global.players[id].physical.speed
	global.dyworld.Creations = global.dyworld.Creations + global.players[id].physical.creations
	global.dyworld.Implants = global.dyworld.Implants + global.players[id].physical.implants
	global.dyworld.Spirit = global.dyworld.Spirit + global.players[id].mystical.spirit
	global.dyworld.Intelligence = global.dyworld.Intelligence + global.players[id].mystical.intelligence
	global.dyworld.Wisdom = global.dyworld.Wisdom + global.players[id].mystical.wisdom
	global.dyworld.Guile = global.dyworld.Guile + global.players[id].mystical.guile
	global.dyworld.Knowledge = global.dyworld.Knowledge + global.players[id].mystical.knowledge
end