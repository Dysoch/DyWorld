require "data/core/functions/prefix"
require "data/core/functions/colors"
-- Balancing here is just the tier in which is resides in the crafting menu (the number behind the =)

local Data_Table = {
	["chitin"] = 1,
	["stone-gear-wheel"] = 1,
	["stone-plate"] = 1,
	["diamond"] = 5,
	["gunpowder"] = 3, --
	["obsidian"] = 2,
	["sand"] = 1,
	["frame"] = 3, --
	["filter-empty"] = 2, --
	["heater"] = 3, --
	["blade"] = 2, --
	["gearbox"] = 3, --
	["glass"] = 2, --
	["rotor"] = 2, --
	["wheat"] = 2,
	["carrot"] = 2,
	["coil"] = 3, --
	["solar-cell"] = 3, --
	["battery-pack"] = 3, --
	["logistic-unit"] = 5, --
	["resin"] = 2, --
	["acorn"] = 1, --
	["rubber"] = 3, --
	["controller"] = 6, --
	["housing"] = 4, --
	["intake"] = 4,
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