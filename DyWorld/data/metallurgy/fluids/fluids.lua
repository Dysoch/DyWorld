require "data/prefix"

local Data_Table = {
	{
		Name = "molten-rock",
		Icon = dyworld_path_icon_temp,
		Def_Temp = Materials.Stone.Melting_Point,
		Max_Temp = Materials.Stone.Boiling_Point,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = false,
	},
	{
		Name = "molten-iron",
		Icon = dyworld_path_icon_temp,
		Def_Temp = Materials.Iron.Melting_Point,
		Max_Temp = Materials.Iron.Boiling_Point,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = false,
	},
	{
		Name = "molten-copper",
		Icon = dyworld_path_icon_temp,
		Def_Temp = Materials.Copper.Melting_Point,
		Max_Temp = Materials.Copper.Boiling_Point,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = false,
	},
	{
		Name = "molten-steel",
		Icon = dyworld_path_icon_temp,
		Def_Temp = Materials.Steel.Melting_Point,
		Max_Temp = Materials.Steel.Boiling_Point,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = false,
	},
	{
		Name = "molten-stainless-steel",
		Icon = dyworld_path_icon_temp,
		Def_Temp = Materials.Stainless_Steel.Melting_Point,
		Max_Temp = Materials.Stainless_Steel.Boiling_Point,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = false,
	},
}

for k,v in pairs(Data_Table) do
data:extend(
	{
		DyWorld_Fluid(v),
	})
end