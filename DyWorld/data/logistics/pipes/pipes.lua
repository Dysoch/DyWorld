require "data/prefix"

local Data_Table = {
	{
		Name = "copper",
		Tint = Material_Colors.Copper,
		Capacity = DyWorld_Material_Formulas(4, "Copper"),
		Range = DyWorld_Material_Formulas(2, "Copper"),
		Health = DyWorld_Material_Formulas(3, "Copper"),
	},
	{
		Name = "stone",
		Tint = Material_Colors.Stone,
		Capacity = DyWorld_Material_Formulas(4, "Stone"),
		Range = DyWorld_Material_Formulas(2, "Stone"),
		Health = DyWorld_Material_Formulas(3, "Stone"),
	},
	{
		Name = "iron",
		Tint = Material_Colors.Iron,
		Capacity = DyWorld_Material_Formulas(4, "Iron"),
		Range = DyWorld_Material_Formulas(2, "Iron"),
		Health = DyWorld_Material_Formulas(3, "Iron"),
	},
	{
		Name = "steel",
		Tint = Material_Colors.Steel,
		Capacity = DyWorld_Material_Formulas(4, "Steel"),
		Range = DyWorld_Material_Formulas(2, "Steel"),
		Health = DyWorld_Material_Formulas(3, "Steel"),
	},
	{
		Name = "wood",
		Tint = Material_Colors.Wood,
		Capacity = DyWorld_Material_Formulas(4, "Wood"),
		Range = DyWorld_Material_Formulas(2, "Wood"),
		Health = DyWorld_Material_Formulas(3, "Wood"),
	},
	{
		Name = "chromium",
		Tint = Material_Colors.Chromium,
		Capacity = DyWorld_Material_Formulas(4, "Chromium"),
		Range = DyWorld_Material_Formulas(2, "Chromium"),
		Health = DyWorld_Material_Formulas(3, "Chromium"),
	},
	{
		Name = "tin",
		Tint = Material_Colors.Tin,
		Capacity = DyWorld_Material_Formulas(4, "Tin"),
		Range = (DyWorld_Material_Formulas(2, "Tin")+2),
		Health = DyWorld_Material_Formulas(3, "Tin"),
	},
	{
		Name = "silver",
		Tint = Material_Colors.Silver,
		Capacity = DyWorld_Material_Formulas(4, "Silver"),
		Range = DyWorld_Material_Formulas(2, "Silver"),
		Health = DyWorld_Material_Formulas(3, "Silver"),
	},
	{
		Name = "gold",
		Tint = Material_Colors.Gold,
		Capacity = DyWorld_Material_Formulas(4, "Gold"),
		Range = DyWorld_Material_Formulas(2, "Gold"),
		Health = DyWorld_Material_Formulas(3, "Gold"),
	},
	{
		Name = "lead",
		Tint = Material_Colors.Lead,
		Capacity = DyWorld_Material_Formulas(4, "Lead"),
		Range = DyWorld_Material_Formulas(2, "Lead"),
		Health = DyWorld_Material_Formulas(3, "Lead"),
	},
}
	
for k,v in pairs(Data_Table) do
	DyWorld_Transport_Pipe(v)
end

DyWorld_Add_To_Tech("automation", dy.."copper-pipe")
DyWorld_Add_To_Tech("automation", dy.."iron-pipe")
DyWorld_Add_To_Tech("steel-processing", dy.."steel-pipe")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-pipe")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-pipe")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-pipe")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-pipe")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-pipe")

DyWorld_Add_To_Tech("automation", dy.."copper-pipe-to-ground")
DyWorld_Add_To_Tech("automation", dy.."iron-pipe-to-ground")
DyWorld_Add_To_Tech("steel-processing", dy.."steel-pipe-to-ground")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-pipe-to-ground")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-pipe-to-ground")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-pipe-to-ground")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-pipe-to-ground")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-pipe-to-ground")

data.raw.recipe[dy.."wood-pipe"].enabled = true
data.raw.recipe[dy.."wood-pipe-to-ground"].enabled = true

data.raw.recipe[dy.."stone-pipe"].enabled = true
data.raw.recipe[dy.."stone-pipe-to-ground"].enabled = true