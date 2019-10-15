require "data/core/functions/prefix"
require "data/core/functions/colors"
-- Balancing here is just the tier in which is resides in the crafting menu (the number behind the =)

local Data_Table = {
	["chitin"] = 1,
	["acorn"] = 1, --
	["sand"] = 1,
	["stone-gear-wheel"] = 1,
	["stone-plate"] = 1,
	["simple-control-board"] = 1,
	["simple-motor"] = 1,
	
	["glass"] = 2, --
	["rotor"] = 2, --
	["wheat"] = 2,
	["obsidian"] = 2,
	["filter-empty"] = 2, --
	["blade"] = 2, --
	["resin"] = 2, --
	["basic-control-board"] = 2,
	["turret-barrel"] = 2,
	["turret-base-2x2"] = 2,
	
	["gunpowder"] = 3, --
	["frame"] = 3, --
	["heater"] = 3, --
	["gearbox"] = 3, --
	["coil"] = 3, --
	["solar-cell"] = 3, --
	["battery-pack"] = 3, --
	["rubber"] = 3, --
	["electronic-control-board"] = 3,
	["electronic-motor"] = 3,
	["turret-base-3x3"] = 3,
	
	["housing"] = 4, --
	["intake"] = 4,
	["turret-base-5x5"] = 4,
	["advanced-control-board"] = 4,
	
	["logistic-unit"] = 5, --
	["diamond"] = 5,
	["tough-control-board"] = 5,
	["tough-motor"] = 5,
	
	["controller"] = 6, --
	["processing-control-board"] = 6,
	["argonium-fuel-cell"] = 6,
	
	["logic-control-board"] = 7,
	["logic-motor"] = 7,
	["space-artifact"] = 7,
	
	["super-control-board"] = 8,
	
	["extreme-control-board"] = 9,
	["extreme-motor"] = 9,
	
	["quantum-control-board"] = 10,
	
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
	  }
	},
	icon_size = 32,
    subgroup = dy.."intermediates-tier-"..(v-1),
    stack_size = 200,
	order = k,
  },
})
end	

data.raw.item["argonium-fuel-cell"].fuel_category = "nuclear"
data.raw.item["argonium-fuel-cell"].fuel_value = "32GJ"

data.raw.item["acorn"].fuel_category = "chemical"
data.raw.item["acorn"].fuel_value = "0.5MJ"