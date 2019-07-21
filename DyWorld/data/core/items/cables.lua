require "data/core/functions/prefix"
require "data/core/functions/colors"

for k,v in pairs(data.raw.item) do
	if v.Intermediates and v.Intermediates.Cable then
data:extend(
{
  {
    type = "item",
    name = v.Intermediates.Name.."-cable",
	localised_name = {"looped-name.cable", {"looped-name."..v.Intermediates.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/copper-cable.png",
		tint = Material_Colors[v.Intermediates.Name],
	  },
	},
	icon_size = 32,
    subgroup = dy.."intermediates-tier-"..(v.Intermediates.Tier-1),
    stack_size = 200,
	order = v.Intermediates.Name.."-cable",
  },
  {
    type = "recipe",
    name = v.Intermediates.Name.."-cable",
    energy_required = 2,
    enabled = true,
    ingredients =
    {
      {type = "item", name = v.Intermediates.Name.."-plate", amount = 1},
    },
    result = v.Intermediates.Name.."-cable",
	result_amount = 3,
  },
})
		if v.Intermediates.Tech_Processing then
			data.raw.recipe[v.Intermediates.Name.."-cable"].enabled = false
		end
	end
end
