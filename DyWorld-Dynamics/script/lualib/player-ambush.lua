

-- @todo Add DyWorld Enemies to ambushes
Attack_Ambush_1 = {"small-biter", "small-spitter"}
Attack_Ambush_2 = {"medium-biter", "medium-spitter"}
Attack_Ambush_3 = {"big-biter", "big-spitter"}
Attack_Ambush_4 = {"behemoth-biter", "behemoth-spitter"}
Attack_Ambush_5 = {"small-biter", "small-spitter", "medium-biter", "medium-spitter", "big-biter", "big-spitter", "behemoth-biter", "behemoth-spitter"}

local keysetAttack_Ambush_1 = {}
for k in pairs(Attack_Ambush_1) do
    table.insert(keysetAttack_Ambush_1, k)
end
local keysetAttack_Ambush_2 = {}
for k in pairs(Attack_Ambush_2) do
    table.insert(keysetAttack_Ambush_2, k)
end
local keysetAttack_Ambush_3 = {}
for k in pairs(Attack_Ambush_3) do
    table.insert(keysetAttack_Ambush_3, k)
end
local keysetAttack_Ambush_4 = {}
for k in pairs(Attack_Ambush_4) do
    table.insert(keysetAttack_Ambush_4, k)
end
local keysetAttack_Ambush_5 = {}
for k in pairs(Attack_Ambush_5) do
    table.insert(keysetAttack_Ambush_5, k)
end

function Check_Ambush_Tier(Tier)
	if Tier == 1 then
		return Attack_Ambush_1[keysetAttack_Ambush_1[math.random(#keysetAttack_Ambush_1)]]
	elseif Tier == 2 then
		return Attack_Ambush_2[keysetAttack_Ambush_2[math.random(#keysetAttack_Ambush_2)]]
	elseif Tier == 3 then
		return Attack_Ambush_3[keysetAttack_Ambush_3[math.random(#keysetAttack_Ambush_3)]]
	elseif Tier == 4 then
		return Attack_Ambush_4[keysetAttack_Ambush_4[math.random(#keysetAttack_Ambush_4)]]
	elseif Tier == 5 then
		return Attack_Ambush_5[keysetAttack_Ambush_5[math.random(#keysetAttack_Ambush_5)]]
	end
end

function Player_Ambush(Location, Radius, Amount, Tier)
	local X = Location[1]
	local Y = Location[2]
	local Surface = Location[3]
	for i = 1, Amount do
		local BuildEntity = Check_Ambush_Tier(Tier)
		local PosX = X + math.random((0-Radius),Radius)
		local PosY = Y + math.random((0-Radius),Radius)
		if game.surfaces[Surface].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then
			game.surfaces[Surface].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.enemy}
		end
	end
end