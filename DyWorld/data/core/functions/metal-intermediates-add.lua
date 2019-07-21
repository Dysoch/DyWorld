require "data/core/functions/prefix"

-- Add only items to this list
local Data_Metal_Intermediates = {
	{
		Name = "silver",
		Stick = true,
	},
	{
		Name = "tin",
		Cable = true,
		Gear = true,
	},
	{
		Name = "gold",
		Cable = true,
		Stick = true,
	},
	{
		Name = "bronze",
		Cable = true,
		Stick = true,
		Gear = true,
	},
	{
		Name = "lead",
		Stick = true,
		Gear = true,
	},
	{
		Name = "cobalt",
		Cable = true,
		Stick = true,
		Gear = true,
	},
	{
		Name = "invar",
		Cable = true,
		Stick = true,
		Gear = true,
	},
	{
		Name = "electrum",
		Cable = true,
		Stick = true,
	},
	{
		Name = "stainless-steel",
		Stick = true,
		Gear = true,
	},
	{
		Name = "arditium",
		Gear = true,
	},
	{
		Name = "titanium",
		Cable = true,
		Stick = true,
		Gear = true,
	},
	{
		Name = "tungsten",
		Stick = true,
		Gear = true,
	},
	{
		Name = "electranium",
		Cable = true,
		Stick = true,
	},
	{
		Name = "arditium-tungstenate",
		Stick = true,
		Gear = true,
	},
	{
		Name = "tungstvar",
		Stick = true,
	},
	{
		Name = "neutronium",
		Stick = true,
	},
	{
		Name = "neutrobaltium",
		Cable = true,
		Stick = true,
		Gear = true,
	},
}

for k,v in pairs(Data_Metal_Intermediates) do
	if data.raw.item[v.Name.."-plate"] then
		data.raw.item[v.Name.."-plate"].Intermediates = {}
		data.raw.item[v.Name.."-plate"].Intermediates.Name = v.Name
		data.raw.item[v.Name.."-plate"].Intermediates.Tier = Metal_Tiers[v.Name]
		if v.Cable then
			data.raw.item[v.Name.."-plate"].Intermediates.Cable = true
		end
		if v.Gear then
			data.raw.item[v.Name.."-plate"].Intermediates.Gear = true
		end
		if v.Stick then
			data.raw.item[v.Name.."-plate"].Intermediates.Stick = true
		end
	end
end