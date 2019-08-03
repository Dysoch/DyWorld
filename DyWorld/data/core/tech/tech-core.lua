require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

local Data_Table = {
	{
		Name = "metallurgy",
		Icon = {{icon = dyworld_path_icon.."blast-furnace.png", scale = 2}},
		Icon_Size = 32,
		Pre_Req_Above = 2,
		Tiers = 10,
		Count = 50,
		Military = false,
	},
	{
		Name = "automation",
		Icon = {{icon = "__base__/graphics/technology/automation.png"}},
		Pre_Req_Above = 3,
		Tiers = 10,
		Count = 100,
		Military = false,
	},
	{
		Name = "smelting",
		Icon = {{icon = "__base__/graphics/technology/advanced-material-processing.png"}},
		Pre_Req_Above = 2,
		Tiers = 10,
		Count = 50,
		Military = false,
	},
	{
		Name = "intermediates",
		Icon = {{icon = "__base__/graphics/technology/advanced-electronics.png"}},
		Pre_Req_Above = 2,
		Tiers = 10,
		Count = 25,
		Military = false,
	},
	{
		Name = "effectivity-module",
		Icon = {{icon = "__base__/graphics/technology/effectivity-module.png"}},
		Pre_Req_Above = 2,
		Tiers = 10,
		Count = 100,
		Military = false,
	},
	{
		Name = "speed-module",
		Icon = {{icon = "__base__/graphics/technology/speed-module.png"}},
		Pre_Req_Above = 2,
		Tiers = 10,
		Count = 100,
		Military = false,
	},
	{
		Name = "productivity-module",
		Icon = {{icon = "__base__/graphics/technology/productivity-module.png"}},
		Pre_Req_Above = 2,
		Tiers = 10,
		Count = 100,
		Military = false,
	},
}

for k,v in pairs(Data_Table) do
	for i = 1,v.Tiers do
		if i == 1 then
			if data.raw.technology[v.Name] or data.raw.technology[v.Name.."-1"] then
				-- do nothing
			else
				DyWorld_Tech_Add(v, i)
			end		
		elseif i >= 2 then
			if not data.raw.technology[v.Name.."-"..i] then
				DyWorld_Tech_Add(v, i)
			end	
		end
	end
end
