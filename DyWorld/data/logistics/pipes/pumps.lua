require "data/prefix"

local Data_Table = {
	{
		Name = "copper",
		Table = "Copper",
	},
	{
		Name = "stone",
		Table = "Stone",
	},
	{
		Name = "iron",
		Table = "Iron",
	},
	{
		Name = "steel",
		Table = "Steel",
	},
	{
		Name = "wood",
		Table = "Wood",
	},
	{
		Name = "chromium",
		Table = "Chromium",
	},
	{
		Name = "tin",
		Table = "Tin",
	},
	{
		Name = "silver",
		Table = "Silver",
	},
	{
		Name = "gold",
		Table = "Gold",
	},
	{
		Name = "lead",
		Table = "Lead",
	},
}
	
for k,v in pairs(Data_Table) do
	DyWorld_Pumps(v)
end

DyWorld_Add_To_Tech("automation", dy.."copper-pump")
DyWorld_Add_To_Tech("automation", dy.."iron-pump")
DyWorld_Add_To_Tech("steel-processing", dy.."steel-pump")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-pump")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-pump")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-pump")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-pump")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-pump")

DyWorld_Add_To_Tech("automation", dy.."copper-offshore-pump")
DyWorld_Add_To_Tech("automation", dy.."iron-offshore-pump")
DyWorld_Add_To_Tech("steel-processing", dy.."steel-offshore-pump")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-offshore-pump")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-offshore-pump")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-offshore-pump")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-offshore-pump")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-offshore-pump")

data.raw.recipe[dy.."wood-pump"].enabled = true
data.raw.recipe[dy.."wood-offshore-pump"].enabled = true

data.raw.recipe[dy.."stone-pump"].enabled = true
data.raw.recipe[dy.."stone-offshore-pump"].enabled = true