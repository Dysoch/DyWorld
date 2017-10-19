require "data/prefix"

-- speed = (Ultimate / (Hardness + Density))
-- health = (((Density * Hardness) - Elasticity) + Ultimate)

local Data_Table = {
	{
		Name = "copper-transport-belt",
		Icons = {{icon = "__base__/graphics/icons/transport-belt.png", tint = Material_Colors.Copper}},
		Recipe = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 2,
		Recipe_Ingredients = {{"copper-plate", 2},{dy.."binding-copper", 1}},
		Recipe_Without_Tech = false,
		Stack = 200,
		Subgroup = "transport-belt",
		Order = "copper",
		Item_Place = "quickbar",
		Entity = true,
		Health = math.floor(((Materials.Copper.Density * Materials.Copper.Hardness) - Materials.Copper.Elasticity) + Materials.Copper.Strength_Ultimate),
		Tint = Material_Colors.Copper,
		Item_Per_Sec = math.floor(Materials.Copper.Strength_Ultimate / (Materials.Copper.Hardness + Materials.Copper.Density)),
	},
	{
		Name = "stone-transport-belt",
		Icons = {{icon = "__base__/graphics/icons/transport-belt.png", tint = Material_Colors.Stone}},
		Recipe = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 3,
		Recipe_Ingredients = {{"stone", 2},{dy.."stone-stick", 1}},
		Recipe_Without_Tech = true,
		Stack = 200,
		Subgroup = "transport-belt",
		Order = "stone",
		Item_Place = "quickbar",
		Entity = true,
		Health = math.floor(((Materials.Stone.Density * Materials.Stone.Hardness) - Materials.Stone.Elasticity) + Materials.Stone.Strength_Ultimate),
		Tint = Material_Colors.Stone,
		Item_Per_Sec = math.floor(Materials.Stone.Strength_Ultimate / (Materials.Stone.Hardness + Materials.Stone.Density))+1,
	},
	{
		Name = "wood-transport-belt",
		Icons = {{icon = "__base__/graphics/icons/transport-belt.png", tint = Material_Colors.Wood}},
		Recipe = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 5,
		Recipe_Ingredients = {{"wood", 4},{dy.."wood-stick", 1}},
		Recipe_Without_Tech = true,
		Stack = 200,
		Subgroup = "transport-belt",
		Order = "wood",
		Item_Place = "quickbar",
		Entity = true,
		Health = math.floor(((Materials.Wood.Density * Materials.Wood.Hardness) - Materials.Wood.Elasticity) + Materials.Wood.Strength_Ultimate),
		Tint = Material_Colors.Wood,
		Item_Per_Sec = math.floor(Materials.Wood.Strength_Ultimate / (Materials.Wood.Hardness + Materials.Wood.Density)),
	},
}
	
for k,v in pairs(Data_Table) do
	data:extend(
		{
			DyWorld_Entity_Transport_Belt(v),
			DyWorld_Item(v),
			DyWorld_Recipe(v),
		})
end

DyWorld_Add_To_Tech("logistics", dy.."copper-transport-belt")