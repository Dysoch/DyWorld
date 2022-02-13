


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
