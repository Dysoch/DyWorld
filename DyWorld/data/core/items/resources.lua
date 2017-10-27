require "data/prefix"

local Data_Table = {
	{
		Name = "chromium",
		Icon_1 = dyworld_path_icon_temp,
		Icon_2 = dyworld_path_icon_temp,
		Mining_Hardness = Materials.Chromium.Hardness,
		Mining_Time = (Materials.Chromium.Hardness / Materials.Chromium.Density),
		Tint = Material_Colors.Chromium,
	},
	{
		Name = "gold",
		Icon_1 = dyworld_path_icon.."gold-ore.png",
		Icon_2 = dyworld_path_icon.."gold-plate.png",
		Mining_Hardness = Materials.Gold.Hardness,
		Mining_Time = (Materials.Gold.Hardness / Materials.Gold.Density),
		Tint = Material_Colors.Gold,
	},
	{
		Name = "lead",
		Icon_1 = dyworld_path_icon.."lead-ore.png",
		Icon_2 = dyworld_path_icon.."lead-plate.png",
		Mining_Hardness = Materials.Lead.Hardness,
		Mining_Time = (Materials.Lead.Hardness / Materials.Lead.Density),
		Tint = Material_Colors.Lead,
	},
	{
		Name = "tin",
		Icon_1 = dyworld_path_icon.."tin-ore.png",
		Icon_2 = dyworld_path_icon.."tin-plate.png",
		Mining_Hardness = Materials.Tin.Hardness,
		Mining_Time = (Materials.Tin.Hardness / Materials.Tin.Density),
		Tint = Material_Colors.Tin,
	},
	{
		Name = "silver",
		Icon_1 = dyworld_path_icon.."silver-ore.png",
		Icon_2 = dyworld_path_icon.."silver-plate.png",
		Mining_Hardness = Materials.Silver.Hardness,
		Mining_Time = (Materials.Silver.Hardness / Materials.Silver.Density),
		Tint = Material_Colors.Silver,
	},
}

for k,v in pairs(Data_Table) do
data:extend(
	{
		DyWorld_Noise_Layer(v),
		DyWorld_Autoplace(v),
		DyWorld_Item_Ore(v),
		DyWorld_Resource(v),
		DyWorld_Item_Plate(v),
	})
end