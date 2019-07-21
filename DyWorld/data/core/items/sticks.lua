require "data/core/functions/prefix"
require "data/core/functions/colors"

for k,v in pairs(data.raw.item) do
	if v.DyWorld and v.DyWorld.Intermediates and v.DyWorld.Intermediates.Stick then
data:extend(
{
  {
    type = "item",
    name = v.DyWorld.Intermediates.Name.."-stick",
	localised_name = {"looped-name.stick", {"looped-name."..v.DyWorld.Intermediates.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/iron-stick.png",
		tint = Material_Colors[v.DyWorld.Intermediates.Name],
	  },
	},
	icon_size = 32,
    subgroup = dy.."intermediates-tier-"..(v.DyWorld.Intermediates.Tier-1),
    stack_size = 200,
	order = v.DyWorld.Intermediates.Name.."-stick",
  },
  {
    type = "recipe",
    name = v.DyWorld.Intermediates.Name.."-stick",
    energy_required = 2,
    enabled = true,
    ingredients =
    {
      {type = "item", name = v.DyWorld.Intermediates.Name.."-plate", amount = 1},
    },
    result = v.DyWorld.Intermediates.Name.."-stick",
	result_amount = 2,
  },
})
		if v.DyWorld.Intermediates.Tech_Processing then
			data.raw.recipe[v.DyWorld.Intermediates.Name.."-stick"].enabled = false
		end
	end
end
