require "data/prefix"

local Data_Table = {
	{
		Name = "molten-rock",
		Icon = dyworld_path_icon_temp,
		Def_Temp = 1000,
		Max_Temp = 5000,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = false,
	},
	{
		Name = "molten-iron",
		Icon = dyworld_path_icon_temp,
		Def_Temp = 1150,
		Max_Temp = 1150,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = false,
	},
	{
		Name = "molten-copper",
		Icon = dyworld_path_icon_temp,
		Def_Temp = 1100,
		Max_Temp = 1100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = false,
	},
	{
		Name = "molten-steel",
		Icon = dyworld_path_icon_temp,
		Def_Temp = 1500,
		Max_Temp = 1500,
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