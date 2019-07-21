require "data/core/functions/prefix"
require "data/core/functions/colors"

for k,v in pairs(data.raw.item) do
	if v.DyWorld and v.DyWorld.Intermediates and v.DyWorld.Intermediates.Gear then
data:extend(
{
  {
    type = "item",
    name = v.DyWorld.Name.."-gear-wheel",
	localised_name = {"looped-name.gear", {"looped-name."..v.DyWorld.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/iron-gear-wheel.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	},
	icon_size = 32,
    subgroup = dy.."intermediates-tier-"..(v.DyWorld.Tier-1),
    stack_size = 200,
	order = v.DyWorld.Name.."-gear-wheel",
  },
  {
    type = "recipe",
    name = v.DyWorld.Name.."-gear-wheel",
    energy_required = 2,
    enabled = true,
    ingredients =
    {
      {type = "item", name = v.DyWorld.Name.."-plate", amount = 2},
    },
    result = v.DyWorld.Name.."-gear-wheel",
  },
})

		--@todo Add metal processing tech
		--@body with unlocking recipes added in data-updates
		if v.DyWorld.Intermediates.Tech_Processing then
			data.raw.recipe[v.DyWorld.Name.."-gear-wheel"].enabled = false
		end
	end
end
