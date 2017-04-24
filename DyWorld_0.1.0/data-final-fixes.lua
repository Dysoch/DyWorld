require "config"

ProjectileFix = true

Recipe_T2_Tech = {"boiler", "steam-engine", "electric-mining-drill", "electronic-circuit", "inserter", "offshore-pump", "pipe", "pipe-to-ground", "small-electric-pole", "assembling-machine-1", "repair-pack", "transport-belt", "science-pack-1", "science-pack-2", "pistol", "iron-gear-wheel", "iron-stick", "burner-inserter", "copper-cable"}
Recipe_T3_Tech = {"radar"}

Disable_Recipes = {"firearm-magazine", "piercing-rounds-magazine", "lab", "iron-axe", "steel-axe", "burner-mining-drill", "stone-furnace"}

if ProjectileFix then
	for k,v in pairs(data.raw["projectile"]) do
		if not v.collision_box then
			v.collision_box = {{-0.05, -0.25}, {0.05, 0.25}}
		end
		if not v.direction_only then
			v.direction_only = true
		end
	end
end

if ProjectileFix then
	for k,v in pairs(data.raw["ammo"]) do
		if not v.magazine_size then
			v.magazine_size = 50
		else
			v.magazine_size = v.magazine_size*2
		end
	end
end

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
	if not data.raw["recipe"][v].hidden then
		data.raw["recipe"][v].hidden = true
	end
end		

