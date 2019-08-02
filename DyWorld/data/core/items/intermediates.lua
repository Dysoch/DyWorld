require "data/core/functions/prefix"
require "data/core/functions/colors"
-- Balancing here is just the tier in which is resides in the crafting menu (the number behind the =)

local Data_Table = {
	["chitin"] = 1,
	["acorn"] = 1, --
	["sand"] = 1,
	["stone-gear-wheel"] = 1,
	["stone-plate"] = 1,
	
	["glass"] = 2, --
	["rotor"] = 2, --
	["wheat"] = 2,
	["carrot"] = 2,
	["obsidian"] = 2,
	["filter-empty"] = 2, --
	["blade"] = 2, --
	["resin"] = 2, --
	
	["gunpowder"] = 3, --
	["frame"] = 3, --
	["heater"] = 3, --
	["gearbox"] = 3, --
	["coil"] = 3, --
	["solar-cell"] = 3, --
	["battery-pack"] = 3, --
	["rubber"] = 3, --
	
	["housing"] = 4, --
	["intake"] = 4,
	
	["logistic-unit"] = 5, --
	["diamond"] = 5,
	
	["controller"] = 6, --
	
	--["silver"] = 2,
}



for k,v in pairs(Data_Table) do
data:extend(
{
  {
    type = "item",
    name = k,
	icons = 
	{
	  {
		icon = dyworld_path_icon..k..".png",
		--icon = dyworld_path_icon_temp,
	  }
	},
	icon_size = 32,
    subgroup = dy.."intermediates-tier-"..(v-1),
    stack_size = 200,
	order = k,
  },
})
end	