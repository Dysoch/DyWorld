require "data/prefix"

local Data_Table = {
	{
		Name = "atoms",
		Icon = dyworld_path_fluid.."atom.png",
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0, b=255},
		Color_Flow = {r=0, g=0, b=255},
		Barrel = false,
	},
}

for k,v in pairs(Data_Table) do
data:extend(
	{
		DyWorld_Fluid(v),
	})
end