require "data/prefix"

Recipe_T2_Tech = {"boiler", "steam-engine", "electric-mining-drill", "electronic-circuit", "inserter", "offshore-pump", "pipe", "pipe-to-ground", "small-electric-pole", "assembling-machine-1", "repair-pack", "transport-belt", "science-pack-1", "science-pack-2", "pistol", "iron-gear-wheel", "iron-stick", "burner-inserter", "copper-cable"}
Recipe_T3_Tech = {"radar"}

for k,v in pairs(Recipe_T2_Tech) do
	data.raw["recipe"][v].enabled = false
	local result = {type = "unlock-recipe", recipe = v}
	table.insert(data.raw.technology[dyworld_prefix.."tech-"..basic].effects, result)
end	

for k,v in pairs(Recipe_T3_Tech) do
	data.raw["recipe"][v].enabled = false
	local result = {type = "unlock-recipe", recipe = v}
	table.insert(data.raw.technology[dyworld_prefix.."tech-"..intermediate].effects, result)
end