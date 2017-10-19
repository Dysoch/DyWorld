require "data/prefix"

-- range = (((Ultimate + Yield) / Elasticity) - Hardness)

local Data_Table = {
	{
		Name = "copper-underground-belt",
		Icons = {{icon = "__base__/graphics/icons/underground-belt.png", tint = Material_Colors.Copper}},
		Recipe = true,
		Recipe_Craft_Time = 2,
		Recipe_Result_Count = 2,
		Recipe_Ingredients = {{dy.."copper-transport-belt", 4},{dy.."binding-copper", 8}},
		Recipe_Without_Tech = false,
		Stack = 200,
		Subgroup = "transport-underground",
		Order = "copper",
		Item_Place = "quickbar",
		Entity = true,
		Health = math.floor(((Materials.Copper.Density * Materials.Copper.Hardness) - Materials.Copper.Elasticity) + Materials.Copper.Strength_Ultimate),
		Tint = Material_Colors.Copper,
		Item_Per_Sec = math.floor(Materials.Copper.Strength_Ultimate / (Materials.Copper.Hardness + Materials.Copper.Density)),
		Range = math.floor(((Materials.Copper.Strength_Ultimate + Materials.Copper.Strength_Yield) / Materials.Copper.Elasticity) - Materials.Copper.Hardness),
	},
	{
		Name = "stone-underground-belt",
		Icons = {{icon = "__base__/graphics/icons/underground-belt.png", tint = Material_Colors.Stone}},
		Recipe = true,
		Recipe_Craft_Time = 2,
		Recipe_Result_Count = 2,
		Recipe_Ingredients = {{dy.."stone-transport-belt", 10},{dy.."stone-stick", 20}},
		Recipe_Without_Tech = true,
		Stack = 200,
		Subgroup = "transport-underground",
		Order = "stone",
		Item_Place = "quickbar",
		Entity = true,
		Health = math.floor(((Materials.Stone.Density * Materials.Stone.Hardness) - Materials.Stone.Elasticity) + Materials.Stone.Strength_Ultimate),
		Tint = Material_Colors.Stone,
		Item_Per_Sec = math.floor(Materials.Stone.Strength_Ultimate / (Materials.Stone.Hardness + Materials.Stone.Density))+1,
		Range = math.floor(((Materials.Stone.Strength_Ultimate + Materials.Stone.Strength_Yield) / Materials.Stone.Elasticity) - Materials.Stone.Hardness),
	},
	{
		Name = "wood-underground-belt",
		Icons = {{icon = "__base__/graphics/icons/underground-belt.png", tint = Material_Colors.Wood}},
		Recipe = true,
		Recipe_Craft_Time = 2,
		Recipe_Result_Count = 2,
		Recipe_Ingredients = {{dy.."wood-transport-belt", 3},{dy.."wood-stick", 6}},
		Recipe_Without_Tech = true,
		Stack = 200,
		Subgroup = "transport-underground",
		Order = "wood",
		Item_Place = "quickbar",
		Entity = true,
		Health = math.floor(((Materials.Wood.Density * Materials.Wood.Hardness) - Materials.Wood.Elasticity) + Materials.Wood.Strength_Ultimate),
		Tint = Material_Colors.Wood,
		Item_Per_Sec = math.floor(Materials.Wood.Strength_Ultimate / (Materials.Wood.Hardness + Materials.Wood.Density)),
		Range = math.floor(((Materials.Wood.Strength_Ultimate + Materials.Wood.Strength_Yield) / Materials.Wood.Elasticity) - Materials.Wood.Hardness)+1,
	},
}
	
for k,v in pairs(Data_Table) do
	data:extend(
		{
			DyWorld_Entity_Underground_Belt(v),
			DyWorld_Item(v),
			DyWorld_Recipe(v),
		})
end

DyWorld_Add_To_Tech("logistics", dy.."copper-underground-belt")