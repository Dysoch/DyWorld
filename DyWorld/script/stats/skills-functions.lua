

function Skills_CoolDown()
	for ID,Player in pairs(global.players) do
		for k,v in pairs(Player.Skills) do
			if v.CD_On then
				if v.CD > 0 then v.CD = v.CD - 1 end
				if v.CD == 0 then
					v.CD_On = false
					game.players[ID].print({"dyworld_skills_gui."..v.Name.."-cd-done"})
				end
			end
		end
	end
end

function Skills_Add_CoolDown(ID, SKILL)
	local Player = global.players[ID]
	if not Player.Skills[SKILL].CD_On then
		Player.Skills[SKILL].CD_On = true
		Player.Skills[SKILL].CD = Player.Skills[SKILL].CD_Time
	end
end

function Skills_Active_Timer()
	for ID,Player in pairs(global.players) do
		for k,v in pairs(Player.Skills) do
			if v.Active then
				if v.Active_Time_Left > 0 then v.Active_Time_Left = v.Active_Time_Left - 1 end
				if v.Active_Time_Left == 0 then
					v.Active = false
					Skills_Stop_Skill(ID, v.Name)
				end
			end
		end
	end
end

function Skills_Start_Skill(ID, SKILL)
	if SKILL == "dyworld-running-skill" then
		local Player = global.players[ID]
		Player.Skills[SKILL].Active_Time_Left = Player.Skills[SKILL].Active_Time
		Player.Skills[SKILL].Active = true
		global.players[ID].Skill_Points = global.players[ID].Skill_Points - global.players[ID].Skills[SKILL].SP_Usage
		game.players[ID].character_running_speed_modifier = 5
		game.players[ID].print({"dyworld_skills_gui."..SKILL.."-started"})
	elseif SKILL == "dyworld-chart-skill" then
		Skills_Add_CoolDown(ID, SKILL)
		local Player = global.players[ID]
		local AMOUNT = Player.Skills[SKILL].Strength
		game.forces.player.chart(game.players[ID].surface, {lefttop = {x = -AMOUNT, y = -AMOUNT}, rightbottom = {x = AMOUNT, y = AMOUNT}})
		global.players[ID].Skill_Points = global.players[ID].Skill_Points - global.players[ID].Skills[SKILL].SP_Usage
		Player.Skills[SKILL].Strength = Player.Skills[SKILL].Strength * 2
		Player.Skills[SKILL].SP_Usage = math.floor(Player.Skills[SKILL].SP_Usage * 5)
		game.players[ID].print({"dyworld_skills_gui."..SKILL.."-started"})
	end

end

function Skills_Stop_Skill(ID, SKILL)
	Skills_Add_CoolDown(ID, SKILL)
	if SKILL == "dyworld-running-skill" then
		game.players[ID].character_running_speed_modifier = 1
		game.players[ID].print({"dyworld_skills_gui."..SKILL.."-stopped"})
	end
end