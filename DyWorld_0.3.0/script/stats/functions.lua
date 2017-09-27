module("stats_functions", package.seeall)
require "roadmap"
require "script/database/leveled-recipes"

function IncrementerGlobal(NAME, AMOUNT, ITEMNAME)
	local ITEMNAME2 = ITEMNAME or "nil"
	if not global.stats[NAME] then 
		global.stats[NAME] = AMOUNT 
		--debug("Created "..NAME.." counter for "..ITEMNAME2.." with : "..AMOUNT.."")
	else
		global.stats[NAME] = global.stats[NAME] + AMOUNT
		--debug("Added to "..NAME.." counter for "..ITEMNAME2.." with : "..AMOUNT.."")
	end
end

function IncrementerPersonal(NAME, AMOUNT, ID, ITEMNAME)
	local ITEMNAME2 = ITEMNAME or "nil"
	if not global.players[ID].stats[NAME] then 
		global.players[ID].stats[NAME] = AMOUNT 
		--debug("Created "..NAME.." counter for "..ITEMNAME2.." with : "..AMOUNT.." for player "..ID.."")
	else
		global.players[ID].stats[NAME] = global.players[ID].stats[NAME] + AMOUNT
		--debug("Added to "..NAME.." counter for "..ITEMNAME2.." with : "..AMOUNT.." for player "..ID.."")
	end
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
		if not v.XP then 
			v.XP = 0.1 
		else
			v.XP = v.XP + 0.1
			global.dyworld.XP = global.dyworld.XP + 0.1
		end
		Level_Up(v.PlayerID)
	end
end

function XP_All_Full()
	for k,v in pairs(global.players) do
		if not v.XP then 
			v.XP = 1 
		else
			v.XP = v.XP + 1
			global.dyworld.XP = global.dyworld.XP + 1
		end
		Level_Up(v.PlayerID)
	end
end

function Level_Up(ID)
	if global.players[ID].XP >= global.players[ID].XP_LevelUp then
		global.players[ID].Level = global.players[ID].Level + 1
		global.dyworld.Level = global.dyworld.Level + 1
		global.players[ID].XP = global.players[ID].XP - global.players[ID].XP_LevelUp
		global.players[ID].XP_LevelUp = math.floor(global.players[ID].XP_LevelUp*1.25)
		PlayerPrint({"dyworld-levelup", (global.players[ID].Level), (game.players[ID].name)})
		debug(game.players[ID].name.." leveled up to level "..global.players[ID].Level)
		LevelUnlock(ID, global.players[ID].Level)
	end
end

function LevelUnlock(ID, LEVEL)
	local player = game.players[ID]
	for _,data in pairs(LvLed_Recipes.RecipeUnlock) do
		if math.floor(global.dyworld.Level / global.dyworld.Players) >= data.Level then
			for _,player in pairs(game.players) do
				if not player.force.recipes[data.Recipe].enabled then
					player.force.recipes[data.Recipe].enabled = true
					player.print({"dyworld-level-unlock", {"item-name."..data.Recipe}})
					debug("Unlocked: "..data.Recipe)
				end
			end
		end
	end
end

function BodySkills(id)
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
	global.players[id].physical.creations = math.floor(((gsb+gsc)+(gsgb/25))/(1000))
	global.players[id].mystical.guile = math.floor(((((gsc+gsm)/25)+((gsb+(gsgb/100))/50)+gsk)/(1000))+1)
	global.players[id].mystical.intelligence = math.floor(((((p4+m4)*5)+gss)/(1000))+1)
	global.players[id].physical.endurance = math.floor((((gsc/25)+(gsm/25)+(gsb/5)+(gsk)+(p5*50)+(gsp/50))/(1000))+1)
	global.players[id].physical.strength = math.floor((((gsm)+(gsb/5)+(gsc/25)+(p5*75)+(p2*100)+(m2*25)+(gsp/50))/(1000))+1)
	global.players[id].mystical.spirit = math.floor((((p1*35)+((gsgb+gsgm)/5)+(gsk/25)+gss)/(1000))+1)
	global.players[id].physical.speed = math.floor((((p1*25)+(p2*50)+(m1*10)+gsk+gss)/(1000))+1)
	global.players[id].mystical.wisdom = math.floor(((((m1+m2+m4)*25)+((gsc+gsm+gsb+gsk+gss+gsgb+gsgm)/25))/(1000))+1)
	global.players[id].mystical.knowledge = math.floor((((m1*5)+(m2*50)+(m3*40)+(m4*10)+(gsr))/(1000))+1)
	if global.players[id].Level >= 5 then 
		game.players[id].character_health_bonus = math.floor(((p1*5)+(p2*2)+(m1*5)+p3+(gsk/250))-13)
		game.players[id].character_loot_pickup_distance_bonus = math.floor(((p4*5)+(p2*3)+p3+m1+m2+m3)/50)
		game.players[id].character_maximum_following_robot_count_bonus = math.floor(((p1*2)+(p2*10)+(p3*3)+(p4*1.5)+(m1*10)+(m2*3)+(m3*2)+(m4*25))/250)
		game.players[id].character_crafting_speed_modifier = ((((p4*25)+(p3*15)+gsc)/5000)-0.0032) -- or -0.008
		game.players[id].character_reach_distance_bonus = math.floor((gsp+gsb+(p2*5)+(m1*2))/5000)
		game.players[id].character_build_distance_bonus = math.floor((gsp+gsb+gsc+(p2*5)+(m1*2))/7500)
		game.players[id].character_resource_reach_distance_bonus = math.floor((gsp+gsm+(p2*5)+(m1*2))/10000)
		if math.floor((p1)/5) <= 440 then
			game.players[id].character_inventory_slots_bonus = math.floor((p1)/5)
		else
			game.players[id].character_inventory_slots_bonus = 440
		end
	end
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

function Needs_Timed(ID)
	local player = game.players[ID]
	global.players[ID].Food = global.players[ID].Food - global.players[ID].Food_Use
	global.players[ID].Water = global.players[ID].Water - global.players[ID].Water_Use
	if global.players[ID].Food <= 0 then global.players[ID].Food = 0 end
	if global.players[ID].Water <= 0 then global.players[ID].Water = 0 end
end

function Needs_Work(ID, AMOUNT1, AMOUNT2)
	local player = game.players[ID]
	global.players[ID].Food = global.players[ID].Food - AMOUNT1
	global.players[ID].Water = global.players[ID].Water - AMOUNT2
	if global.players[ID].Food <= 0 then global.players[ID].Food = 0 end
	if global.players[ID].Water <= 0 then global.players[ID].Water = 0 end
end