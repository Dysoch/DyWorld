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
	localised_name = {"looped-name.plate-casting", {"looped-name."..v.DyWorld.Name}},
	icons = data.raw.item[v.DyWorld.Name.."-plate"].icons,
    enabled = false,
	category = dy.."casting",
	icon_size = 32,
    subgroup = dy.."material-"..(Metal_Tiers[v.DyWorld.Name]-1),
    normal = { 
	  energy_required = 1.5 * v.DyWorld.Tier,
	  enabled = false,
	  ingredients = {{type = "fluid", name = "molten-"..v.DyWorld.Name, amount = Molten_To_Plate_Molten_Amount}},
	  results = { 
	    {type = "item", name = v.DyWorld.Name.."-plate", amount = math.floor(Molten_To_Plate_Molten_Amount / Molten_To_Plate_Ratio)},
	    {type = "item", name = v.DyWorld.Name.."-slag", amount_min = 1, amount_max = 3, probability = 0.6},
	  },
	},
    expensive = { 
	  energy_required = 2.5 * v.DyWorld.Tier,
	  enabled = false,
	  ingredients = {{type = "fluid", name = "molten-"..v.DyWorld.Name, amount = Expensive_Check(Molten_To_Plate_Molten_Amount)}},
	  results = { 
		{type = "item", name = v.DyWorld.Name.."-plate", amount = math.floor(Molten_To_Plate_Molten_Amount / Molten_To_Plate_Ratio)},
		{type = "item", name = v.DyWorld.Name.."-slag", amount_min = 1, amount_max = 3, probability = 0.4},
	  },
	},
  },
})
		if data.raw.item[v.DyWorld.Name.."-plate"].icons then
			data.raw.recipe["metallurgy-"..v.DyWorld.Name.."-plate"].icons = data.raw.item[v.DyWorld.Name.."-plate"].icons
		else
			data.raw.recipe["metallurgy-"..v.DyWorld.Name.."-plate"].icon = data.raw.item[v.DyWorld.Name.."-plate"].icon
		end
	DyWorld_Add_To_Tech("metallurgy-"..v.DyWorld.Tier, "metallurgy-"..v.DyWorld.Name.."-plate")
	end
end	