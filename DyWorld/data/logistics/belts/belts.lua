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
		Range = (DyWorld_Material_Formulas(2, "Tin")+2),
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
DyWorld_Add_To_Tech("logistics", dy.."lead-transport-belt")
DyWorld_Add_To_Tech("logistics", dy.."silver-transport-belt")
DyWorld_Add_To_Tech("logistics", dy.."gold-transport-belt")
DyWorld_Add_To_Tech("logistics", dy.."tin-transport-belt")
DyWorld_Add_To_Tech("logistics", dy.."chromium-transport-belt")

DyWorld_Add_To_Tech("logistics", dy.."copper-underground-belt")
DyWorld_Add_To_Tech("logistics", dy.."lead-underground-belt")
DyWorld_Add_To_Tech("logistics", dy.."silver-underground-belt")
DyWorld_Add_To_Tech("logistics", dy.."gold-underground-belt")
DyWorld_Add_To_Tech("logistics", dy.."tin-underground-belt")
DyWorld_Add_To_Tech("logistics", dy.."chromium-underground-belt")

DyWorld_Add_To_Tech("logistics", dy.."copper-splitter")
DyWorld_Add_To_Tech("logistics", dy.."lead-splitter")
DyWorld_Add_To_Tech("logistics", dy.."silver-splitter")
DyWorld_Add_To_Tech("logistics", dy.."gold-splitter")
DyWorld_Add_To_Tech("logistics", dy.."tin-splitter")
DyWorld_Add_To_Tech("logistics", dy.."chromium-splitter")

data.raw.recipe[dy.."stone-transport-belt"].enabled = true
data.raw.recipe[dy.."wood-transport-belt"].enabled = true

data.raw.recipe[dy.."stone-underground-belt"].enabled = true
data.raw.recipe[dy.."wood-underground-belt"].enabled = true

data.raw.recipe[dy.."stone-splitter"].enabled = true
data.raw.recipe[dy.."wood-splitter"].enabled = true