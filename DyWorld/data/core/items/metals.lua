require "data/core/functions/prefix"
require "data/core/functions/colors"
-- NO BALANCING HERE

local Data_Table = {
	{ Name = "silver", Icon = 1},
	{ Name = "tin", Icon = 1},
	{ Name = "gold", Icon = 1},
	{ Name = "bronze", Icon = 2},
	{ Name = "lead", Icon = 1},
	{ Name = "cobalt", Icon = 2},
	{ Name = "invar", Icon = 2},
	{ Name = "electrum", Icon = 2},
	{ Name = "stainless-steel", Icon = 3},
	{ Name = "arditium", Icon = 2},
	{ Name = "titanium", Icon = 3},
	{ Name = "tungsten", Icon = 3},
	{ Name = "electranium", Icon = 3},
	{ Name = "arditium-tungstenate", Icon = 3},
	{ Name = "tungstvar", Icon = 3},
	{ Name = "neutronium", Icon = 2},
	{ Name = "neutrobaltium", Icon = 3},
}

--@todo Add chemical formula descriptions for ores and metals

for k,v in pairs(Data_Table) do
data:extend(
{
  {
    type = "item",
    name = v.Name.."-plate",
	localised_name = {"looped-name.plate", {"looped-name."..v.Name}},
	icons = 
	{
	  {
		icon = dyworld_path_icon.."base-plate-"..v.Icon..".png",
		tint = Material_Colors[v.Name],
	  }
	},
	icon_size = 32,
    subgroup = dy.."material-"..(Metal_Tiers[v.Name]-1),
    stack_size = 200,
	order = v.Name.."-plate",
  },
})
end	
