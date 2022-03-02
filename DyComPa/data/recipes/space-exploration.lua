


if data.raw.recipe["se-iron-smelting-vulcanite"] then
data.raw.recipe["se-iron-smelting-vulcanite"].icons[1] = {
	icon = DyDs_path_icon.."base-plate-1.png", 
	tint = Iron_Color,
	icon_size = 64, 
	scale = 32/64
}
end
if data.raw.recipe["se-copper-smelting-vulcanite"] then
data.raw.recipe["se-copper-smelting-vulcanite"].icons[1] = {
	icon = DyDs_path_icon.."base-plate-1.png", 
	tint = Copper_Color,
	icon_size = 64, 
	scale = 32/64
}
end
if data.raw.recipe["landfill-iron-ore"] then
data.raw.recipe["landfill-iron-ore"].icons[2] = {
	icon = DyDs_path_icon.."base-plate-1.png", 
	tint = Iron_Color,
	icon_size = 64, 
	scale = 32/64
}
end
if data.raw.recipe["landfill-copper-ore"] then
data.raw.recipe["landfill-copper-ore"].icons[2] = {
	icon = DyDs_path_icon.."base-plate-1.png", 
	tint = Copper_Color,
	icon_size = 64, 
	scale = 32/64
}
end
if data.raw.recipe["se-cargo-rocket-cargo-pod"] then
	data.raw.recipe["se-cargo-rocket-cargo-pod"].ingredients = {
		{ "steel-plate", 6 },
		{ "control-board-2", 4 },
		{ "small-storage-2", 4 },
		{ "normal-inserter", 2 }
	}
end
if data.raw.recipe["se-core-fragment-omni"] then
	for recipe_name,_ in pairs(data.raw.recipe) do
		if (string.find(recipe_name, "se-core-fragment-", 1, true) == 1) then
			for i,result in pairs(data.raw.recipe[recipe_name].results) do
				if (result.name == "stone" or
						recipe_name == "se-core-fragment-omni" and (result.name == "wood" or result.name == "carrot")) then
					data.raw.recipe[recipe_name].results[i] = nil
				end
			end
		end
	end
end
if data.raw.recipe["scrap-recycling"] then
	data.raw.recipe["scrap-recycling"].results = {
		{ name = "tin-ore", amount_min = 1, amount_max = 1, probability = 0.1},
		{ name = "copper-ore", amount_min = 1, amount_max = 1, probability = 0.1},
		{ name = "iron-ore", amount_min = 1, amount_max = 1, probability = 0.1},
		{ type = "fluid", name = "heavy-oil", amount_min = 1, amount_max = 1, probability = 0.1},
	}
end
if data.raw.recipe["se-vulcanite-washed"] then
	data.raw.recipe["se-vulcanite-washed"].results[2] = {
		name = "limestone", amount_min = 1, amount_max = 1, probability = 0.25
	}
end
if data.raw.recipe["se-cryonite-washed"] then
	data.raw.recipe["se-cryonite-washed"].results[2] = {
		name = "limestone", amount_min = 1, amount_max = 1, probability = 0.25
	}
end
if data.raw.recipe["se-holmium-ore-washed"] then
	data.raw.recipe["se-holmium-ore-washed"].results[2] = {
		name = "limestone", amount_min = 1, amount_max = 1, probability = 0.25
	}
end
if data.raw.recipe["se-iridium-ore-washed"] then
	data.raw.recipe["se-iridium-ore-washed"].results[2] = {
		name = "limestone", amount_min = 1, amount_max = 1, probability = 0.25
	}
end
if data.raw.recipe["se-naquium-ore-washed"] then
	data.raw.recipe["se-naquium-ore-washed"].results[2] = {
		name = "limestone", amount_min = 1, amount_max = 1, probability = 0.25
	}
end
