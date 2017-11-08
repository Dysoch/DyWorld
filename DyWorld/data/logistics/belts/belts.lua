require "data/prefix"

local Data_Table = {
	{
		Name = "copper",
		Tint = Material_Colors.Copper,
		Item_Per_Sec = DyWorld_Material_Formulas(1, "Copper"),
		Range = DyWorld_Material_Formulas(2, "Copper"),
		Health = DyWorld_Material_Formulas(3, "Copper"),
	},
	{
		Name = "iron",
		Tint = Material_Colors.Iron,
		Item_Per_Sec = DyWorld_Material_Formulas(1, "Iron"),
		Range = DyWorld_Material_Formulas(2, "Iron"),
		Health = DyWorld_Material_Formulas(3, "Iron"),
	},
	{
		Name = "steel",
		Tint = Material_Colors.Steel,
		Item_Per_Sec = DyWorld_Material_Formulas(1, "Steel"),
		Range = DyWorld_Material_Formulas(2, "Steel"),
		Health = DyWorld_Material_Formulas(3, "Steel"),
	},
	{
		Name = "stone",
		Tint = Material_Colors.Stone,
		Item_Per_Sec = DyWorld_Material_Formulas(1, "Stone"),
		Range = DyWorld_Material_Formulas(2, "Stone"),
		Health = DyWorld_Material_Formulas(3, "Stone"),
	},
	{
		Name = "wood",
		Tint = Material_Colors.Wood,
		Item_Per_Sec = DyWorld_Material_Formulas(1, "Wood"),
		Range = DyWorld_Material_Formulas(2, "Wood"),
		Health = DyWorld_Material_Formulas(3, "Wood"),
	},
	{
		Name = "chromium",
		Tint = Material_Colors.Chromium,
		Item_Per_Sec = DyWorld_Material_Formulas(1, "Chromium"),
		Range = DyWorld_Material_Formulas(2, "Chromium"),
		Health = DyWorld_Material_Formulas(3, "Chromium"),
	},
	{
		Name = "tin",
		Tint = Material_Colors.Tin,
		Item_Per_Sec = DyWorld_Material_Formulas(1, "Tin"),
		Range = DyWorld_Material_Formulas(2, "Tin"),
		Health = DyWorld_Material_Formulas(3, "Tin"),
	},
	{
		Name = "silver",
		Tint = Material_Colors.Silver,
		Item_Per_Sec = DyWorld_Material_Formulas(1, "Silver"),
		Range = DyWorld_Material_Formulas(2, "Silver"),
		Health = DyWorld_Material_Formulas(3, "Silver"),
	},
	{
		Name = "gold",
		Tint = Material_Colors.Gold,
		Item_Per_Sec = DyWorld_Material_Formulas(1, "Gold"),
		Range = DyWorld_Material_Formulas(2, "Gold"),
		Health = DyWorld_Material_Formulas(3, "Gold"),
	},
	{
		Name = "lead",
		Tint = Material_Colors.Lead,
		Item_Per_Sec = DyWorld_Material_Formulas(1, "Lead"),
		Range = DyWorld_Material_Formulas(2, "Lead"),
		Health = DyWorld_Material_Formulas(3, "Lead"),
	},
}
	
for k,v in pairs(Data_Table) do
	DyWorld_Transport_Belt(v)
end

DyWorld_Add_To_Tech("logistics", dy.."copper-transport-belt")
DyWorld_Add_To_Tech("logistics", dy.."iron-transport-belt")
DyWorld_Add_To_Tech("logistics", dy.."steel-transport-belt")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-transport-belt")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-transport-belt")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-transport-belt")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-transport-belt")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-transport-belt")

DyWorld_Add_To_Tech("logistics", dy.."copper-underground-belt")
DyWorld_Add_To_Tech("logistics", dy.."iron-underground-belt")
DyWorld_Add_To_Tech("logistics", dy.."steel-underground-belt")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-underground-belt")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-underground-belt")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-underground-belt")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-underground-belt")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-underground-belt")

DyWorld_Add_To_Tech("logistics", dy.."copper-splitter")
DyWorld_Add_To_Tech("logistics", dy.."iron-splitter")
DyWorld_Add_To_Tech("logistics", dy.."steel-splitter")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-splitter")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-splitter")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-splitter")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-splitter")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-splitter")

data.raw.recipe[dy.."stone-transport-belt"].enabled = true
data.raw.recipe[dy.."wood-transport-belt"].enabled = true

data.raw.recipe[dy.."stone-underground-belt"].enabled = true
data.raw.recipe[dy.."wood-underground-belt"].enabled = true

data.raw.recipe[dy.."stone-splitter"].enabled = true
data.raw.recipe[dy.."wood-splitter"].enabled = true