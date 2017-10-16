require "data/prefix"

local Data_Table = {
	{
		Name = "water-clean",
		Icon = dyworld_path_icon_temp,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = true,
	},
	{
		Name = "sewage",
		Icon = dyworld_path_icon_temp,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = true,
	},
	{
		Name = "sludge",
		Icon = dyworld_path_icon_temp,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = true,
	},
	{
		Name = "acid",
		Icon = dyworld_path_icon_temp,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=10, g=255, b=10},
		Color_Flow = {r=10, g=255, b=10},
		Barrel = true,
	},
	{
		Name = "methane",
		Icon = dyworld_path_icon_temp,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = true,
	},
	{
		Name = "oxygen",
		Icon = dyworld_path_icon_temp,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = true,
	},
	{
		Name = "hydrogen",
		Icon = dyworld_path_icon_temp,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = true,
	},
	{
		Name = "blood",
		Icon = dyworld_path_icon_temp,
		Def_Temp = 37,
		Max_Temp = 100,
		Color_Base = {r=255, g=10, b=10},
		Color_Flow = {r=255, g=10, b=10},
		Barrel = true,
	},
	{
		Name = "clean-oil",
		Icon = "__base__/graphics/icons/fluid/crude-oil.png",
		Def_Temp = 25,
		Max_Temp = 100,
		Color_Base = {r=0, g=0, b=0},
		Color_Flow = {r=0.5, g=0.5, b=0.5},
		Barrel = true,
	},
}

for k,v in pairs(Data_Table) do
data:extend(
	{
		DyWorld_Fluid(v),
	})
end