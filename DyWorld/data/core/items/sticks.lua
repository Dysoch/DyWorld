require "data/core/functions/prefix"
require "data/core/functions/colors"

for k,v in pairs(data.raw.item) do
	if v.DyWorld and v.DyWorld.Metallurgy and v.DyWorld.Metallurgy.Stick then
		if not data.raw.item[v.DyWorld.Name.."-stick"] then
data:extend(
{
  {
    type = "item",
    name = v.DyWorld.Name.."-stick",
	localised_name = {"looped-name.stick", {"looped-name."..v.DyWorld.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/iron-stick.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	},
	icon_size = 32,
    subgroup = dy.."intermediates-tier-"..(v.DyWorld.Tier-1),
    stack_size = 200,
	order = v.DyWorld.Name.."-stick",
  },
  {
    type = "recipe",
    name = v.DyWorld.Name.."-stick",
    enabled = false,
    normal = {
	  energy_required = 2,
	  enabled = false,
	  ingredients = {{type = "item", name = v.DyWorld.Name.."-plate", amount = 1},},
      results = {{type = "item", name = v.DyWorld.Name.."-stick", amount = 2},},
	},
    expensive = {
	  energy_required = 2,
	  enabled = false,
	  ingredients = {{type = "item", name = v.DyWorld.Name.."-plate", amount = 5},},
      results = {{type = "item", name = v.DyWorld.Name.."-stick", amount = 2},},
	},
  },
})
		if v.DyWorld.Metallurgy.Tech_Processing then
			DyWorld_Add_To_Tech(v.DyWorld.Name.."-processing", v.DyWorld.Name.."-stick")
		end
		DyWorld_Add_To_Tech("intermediates-"..(v.DyWorld.Tier-1), v.DyWorld.Name.."-stick")
		end
	end
end
