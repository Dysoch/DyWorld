require "config"
require "data/prefix"

Recipe_T2_Tech = {"boiler", "steam-engine", "electric-mining-drill", "electronic-circuit", "inserter", "offshore-pump", "pipe", "pipe-to-ground", "small-electric-pole", "assembling-machine-1", "repair-pack", "transport-belt", "science-pack-1", "science-pack-2", "pistol", "iron-gear-wheel", "iron-stick", "burner-inserter", "lab", "copper-cable"}
Recipe_T3_Tech = {"radar"}

Disable_Recipes = {"firearm-magazine", "piercing-rounds-magazine", "iron-axe", "steel-axe", "burner-mining-drill", "stone-furnace"}

for k,v in pairs(Recipe_T2_Tech) do
	if data.raw["recipe"][v].normal then
		data.raw["recipe"][v].normal.enabled = false
		data.raw["recipe"][v].expensive.enabled = false
	else
		data.raw["recipe"][v].enabled = false
	end
	local result = {type = "unlock-recipe", recipe = v}
	table.insert(data.raw.technology[dyworld_prefix.."tech-"..basic].effects, result)
end	

for k,v in pairs(Recipe_T3_Tech) do
	if data.raw["recipe"][v].normal then
		data.raw["recipe"][v].normal.enabled = false
		data.raw["recipe"][v].expensive.enabled = false
	else
		data.raw["recipe"][v].enabled = false
	end
	local result = {type = "unlock-recipe", recipe = v}
	table.insert(data.raw.technology[dyworld_prefix.."tech-"..intermediate].effects, result)
end

for k,v in pairs(Disable_Recipes) do
	if data.raw["recipe"][v].normal then
		data.raw["recipe"][v].normal.hidden = true
		data.raw["recipe"][v].expensive.hidden = true
	else
		data.raw["recipe"][v].hidden = true
	end
end		

local piercing = {type = "unlock-recipe",recipe = "piercing-rounds-magazine"}
local piercing_replacement = {type = "unlock-recipe",recipe = dyworld_prefix.."ammo-basic-03"}
table.remove(data.raw.technology["military-2"].effects,piercing)
table.remove(data.raw.technology["military-2"].effects,piercing)