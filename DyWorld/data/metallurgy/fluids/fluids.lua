require "data/prefix"

local Data_Table = {
	{
		Name = "molten-rock",
		Icon = dyworld_path_fluid.."rock.png",
		Def_Temp = Materials.Stone.Melting_Point,
		Max_Temp = Materials.Stone.Boiling_Point,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = false,
	},
	{
		Name = "molten-iron",
		Icon = dyworld_path_fluid.."iron.png",
		Def_Temp = Materials.Iron.Melting_Point,
		Max_Temp = Materials.Iron.Boiling_Point,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = false,
	},
	{
		Name = "molten-copper",
		Icon = dyworld_path_fluid.."copper.png",
		Def_Temp = Materials.Copper.Melting_Point,
		Max_Temp = Materials.Copper.Boiling_Point,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = false,
	},
	{
		Name = "molten-steel-normal",
		Icon = dyworld_path_icon_temp,
		Def_Temp = Materials.Steel.Melting_Point,
		Max_Temp = Materials.Steel.Boiling_Point,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = false,
	},
	{
		Name = "molten-tin",
		Icon = dyworld_path_icon_temp,
		Def_Temp = Materials.Tin.Melting_Point,
		Max_Temp = Materials.Tin.Boiling_Point,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = false,
	},
	{
		Name = "molten-silver",
		Icon = dyworld_path_icon_temp,
		Def_Temp = Materials.Silver.Melting_Point,
		Max_Temp = Materials.Silver.Boiling_Point,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = false,
	},
	{
		Name = "molten-gold",
		Icon = dyworld_path_icon_temp,
		Def_Temp = Materials.Gold.Melting_Point,
		Max_Temp = Materials.Gold.Boiling_Point,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = false,
	},
	{
		Name = "molten-lead",
		Icon = dyworld_path_icon_temp,
		Def_Temp = Materials.Lead.Melting_Point,
		Max_Temp = Materials.Lead.Boiling_Point,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = false,
	},
	{
		Name = "molten-chromium",
		Icon = dyworld_path_icon_temp,
		Def_Temp = Materials.Chromium.Melting_Point,
		Max_Temp = Materials.Chromium.Boiling_Point,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Barrel = false,
	},
	{
		Name = "molten-steel-stainless",
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