require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"
-- No balancing here, check "data/core/functions/metal-info.lua"
-- check also "data/core/functions/amounts.lua"

for k,v in pairs(data.raw.item) do
	if v.DyWorld and v.DyWorld.Metallurgy and v.DyWorld.Metallurgy.Molten and data.raw.fluid["molten-"..v.DyWorld.Name] then	
data:extend(
{
  {
    type = "recipe",
    name = "metallurgy-"..v.DyWorld.Name.."-plate",
    energy_required = 1.5 * v.DyWorld.Tier,
    enabled = false,
	category = dy.."casting",
    ingredients = 
	{ 
	  {type = "fluid", name = "molten-"..v.DyWorld.Name, amount = Molten_To_Plate_Molten_Amount},
	},
    results = 
	{ 
	  {type = "item", name = v.DyWorld.Name.."-plate", amount = math.floor(Molten_To_Plate_Molten_Amount / Molten_To_Plate_Ratio)},
	},
  },
})
	DyWorld_Add_To_Tech("metallurgy-"..v.DyWorld.Tier, "metallurgy-"..v.DyWorld.Name.."-plate")
	end
end	