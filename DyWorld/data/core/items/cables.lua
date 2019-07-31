require "data/core/functions/prefix"
require "data/core/functions/colors"

for k,v in pairs(data.raw.item) do
	if v.DyWorld and v.DyWorld.Metallurgy and v.DyWorld.Metallurgy.Cable then
		if not data.raw.item[v.DyWorld.Name.."-cable"] then
data:extend(
{
  {
    type = "item",
    name = v.DyWorld.Name.."-cable",
	localised_name = {"looped-name.cable", {"looped-name."..v.DyWorld.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/copper-cable.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	},
	icon_size = 32,
    subgroup = dy.."intermediates-tier-"..(v.DyWorld.Tier-1),
    stack_size = 200,
	order = v.DyWorld.Name.."-cable",
  },
  {
    type = "recipe",
    name = v.DyWorld.Name.."-cable",
    enabled = true,
    normal = {
	  energy_required = 2,
	  ingredients = {{type = "item", name = v.DyWorld.Name.."-plate", amount = 1},},
      results = {{type = "item", name = v.DyWorld.Name.."-cable", amount = 3},},
	},
    expensive = {
	  energy_required = 2,
	  ingredients = {{type = "item", name = v.DyWorld.Name.."-plate", amount = 5},},
      results = {{type = "item", name = v.DyWorld.Name.."-cable", amount = 3},},
	},
  },
})
		if v.DyWorld.Metallurgy.Tech_Processing then
			data.raw.recipe[v.DyWorld.Name.."-cable"].enabled = false
			DyWorld_Add_To_Tech(v.DyWorld.Name.."-processing", v.DyWorld.Name.."-cable")
		end
		end
	end
end
