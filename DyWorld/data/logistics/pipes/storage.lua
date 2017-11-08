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
	DyWorld_Storage_Tanks(v)
end

DyWorld_Add_To_Tech("automation", dy.."copper-storage-tank")
DyWorld_Add_To_Tech("automation", dy.."iron-storage-tank")
DyWorld_Add_To_Tech("steel-processing", dy.."steel-storage-tank")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-storage-tank")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-storage-tank")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-storage-tank")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-storage-tank")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-storage-tank")

data.raw.recipe[dy.."wood-storage-tank"].enabled = true

data.raw.recipe[dy.."stone-storage-tank"].enabled = true