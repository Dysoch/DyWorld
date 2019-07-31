require "data/core/functions/prefix"
require "data/core/functions/colors"
-- Balancing here is just the tier in which is resides in the crafting menu (the number behind the =)

local Data_Table = {
	["obsidian"] = 3,
	["sand"] = 2,
	["resin"] = 3,
	["coal"] = 2,
	["stone"] = 2,
	--["silver"] = 2,
}



for k,v in pairs(Data_Table) do
if data.raw.item[k].icon then
data:extend(
{
  {
    type = "item",
    name = k.."-filter",
	localised_name = {"looped-name.filters", {"item-name."..k}},
	icons = 
	{
	  {
		icon = dyworld_path_icon.."filter-empty.png",
	  },
	  {
		icon = data.raw.item[k].icon, 
		scale= 0.6, 
		shift = {8, 9},
	  },
	},
	icon_size = 32,
    subgroup = dy.."intermediates-tier-"..(v-1),
    stack_size = 200,
	order = k,
  },
  {
    type = "recipe",
    name = k.."-filter",
    enabled = true,
    normal = {
	  energy_required = 5,
	  ingredients = {
		{type = "item", name = "filter-empty", amount = 1},
		{type = "item", name = k, amount = 5},
	  },
      result = k.."-filter",
	},
    expensive = {
	  energy_required = 5,
	  ingredients = {
		{type = "item", name = "filter-empty", amount = 1},
		{type = "item", name = k, amount = 25},
	  },
      result = k.."-filter",
	},
  },
})
else
data:extend(
{
  {
    type = "item",
    name = k.."-filter",
	localised_name = {"looped-name.filters", {"item-name."..k}},
	icons = 
	{
	  {
		icon = dyworld_path_icon.."filter-empty.png",
	  },
	  {
		icon = data.raw.item[k].icons[1].icon, 
		scale= 0.6, 
		shift = {8, 9},
	  },
	},
	icon_size = 32,
    subgroup = dy.."intermediates-tier-"..(v-1),
    stack_size = 200,
	order = k,
  },
  {
    type = "recipe",
    name = k.."-filter",
    enabled = true,
    normal = {
	  energy_required = 5,
	  ingredients = {
		{type = "item", name = "filter-empty", amount = 1},
		{type = "item", name = k, amount = 5},
	  },
      result = k.."-filter",
	},
    expensive = {
	  energy_required = 5,
	  ingredients = {
		{type = "item", name = "filter-empty", amount = 1},
		{type = "item", name = k, amount = 25},
	  },
      result = k.."-filter",
	},
  },
})
end

end	