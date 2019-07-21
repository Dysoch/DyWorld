require "data/core/functions/prefix"
require "data/core/functions/colors"

for k,v in pairs(data.raw.item) do
	if v.Intermediates and v.Intermediates.Gear then
data:extend(
{
  {
    type = "item",
    name = v.Intermediates.Name.."-gear-wheel",
	localised_name = {"looped-name.gear", {"looped-name."..v.Intermediates.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/iron-gear-wheel.png",
		tint = Material_Colors[v.Intermediates.Name],
	  },
	},
	icon_size = 32,
    subgroup = dy.."intermediates-tier-"..(v.Intermediates.Tier-1),
    stack_size = 200,
	order = v.Intermediates.Name.."-gear-wheel",
  },
  {
    type = "recipe",
    name = v.Intermediates.Name.."-gear-wheel",
    energy_required = 2,
    enabled = true,
    ingredients =
    {
      {type = "item", name = v.Intermediates.Name.."-plate", amount = 2},
    },
    result = v.Intermediates.Name.."-gear-wheel",
  },
})

		--@todo Add metal processing tech
		--@body with unlocking recipes added in data-updates
		if v.Intermediates.Tech_Processing then
			data.raw.recipe[v.Intermediates.Name.."-gear-wheel"].enabled = false
		end
	end
end
