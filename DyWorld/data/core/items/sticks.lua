require "data/core/functions/prefix"
require "data/core/functions/colors"

for k,v in pairs(data.raw.item) do
	if v.Intermediates and v.Intermediates.Stick then
data:extend(
{
  {
    type = "item",
    name = v.Intermediates.Name.."-stick",
	localised_name = {"looped-name.stick", {"looped-name."..v.Intermediates.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/iron-stick.png",
		tint = Material_Colors[v.Intermediates.Name],
	  },
	},
	icon_size = 32,
    subgroup = dy.."intermediates-tier-"..(v.Intermediates.Tier-1),
    stack_size = 200,
	order = v.Intermediates.Name.."-stick",
  },
  {
    type = "recipe",
    name = v.Intermediates.Name.."-stick",
    energy_required = 2,
    enabled = true,
    ingredients =
    {
      {type = "item", name = v.Intermediates.Name.."-plate", amount = 1},
    },
    result = v.Intermediates.Name.."-stick",
	result_amount = 2,
  },
})
		if v.Intermediates.Tech_Processing then
			data.raw.recipe[v.Intermediates.Name.."-stick"].enabled = false
		end
	end
end
