require "data/prefix"

local Data_Table = {
	{
		Name = "coffee",
		Icon = dyworld_path_icon_temp,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = true,
	},
	{
		Name = "energy_drink",
		Icon = dyworld_path_icon_temp,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = true,
	},
	{
		Name = "fertilized-water",
		Icon = dyworld_path_icon_temp,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = true,
	},
}

for k,v in pairs(Data_Table) do
data:extend(
	{
		DyWorld_Fluid(v),
	})
end