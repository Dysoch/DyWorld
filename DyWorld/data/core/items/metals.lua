require "data/core/functions/prefix"
require "data/core/functions/colors"

local Data_Table = {
	{ Name = "silver", Icon = 1, Tier = 2 },
	{ Name = "tin", Icon = 1, Tier = 2 },
	{ Name = "gold", Icon = 1, Tier = 3 },
	{ Name = "lead", Icon = 1, Tier = 3 },
	{ Name = "cobalt", Icon = 2, Tier = 4 },
	{ Name = "arditium", Icon = 2, Tier = 5 },
	{ Name = "titanium", Icon = 3, Tier = 6 },
	{ Name = "tungsten", Icon = 3, Tier = 6 },
	{ Name = "bronze", Icon = 2, Tier = 3 },
	{ Name = "invar", Icon = 2, Tier = 4 },
	{ Name = "electrum", Icon = 2, Tier = 4 },
	{ Name = "stainless-steel", Icon = 3, Tier = 5 },
	{ Name = "electranium", Icon = 3, Tier = 7 },
	{ Name = "arditium-tungstenate", Icon = 3, Tier = 7 },
	{ Name = "tungstvar", Icon = 3, Tier = 8 },
	{ Name = "neutronium", Icon = 2, Tier = 9 },
	{ Name = "neutrobaltium", Icon = 3, Tier = 10 },
}

for k,v in pairs(Data_Table) do
data:extend(
{
  {
    type = "item",
    name = v.Name.."-plate",
	icons = 
	{
	  {
		icon = dyworld_path_icon.."base-plate-"..v.Icon..".png",
		tint = Material_Colors[v.Name],
	  }
	},
	icon_size = 32,
    subgroup = dy.."material-"..(v.Tier-1),
    stack_size = 200,
	order = v.Name.."-plate",
  },
})
end	
