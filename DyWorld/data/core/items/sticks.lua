require "data/core/functions/prefix"
require "data/core/functions/colors"

for k,v in pairs(data.raw.item) do
	if v.DyWorld and v.DyWorld.Intermediates and v.DyWorld.Intermediates.Stick then
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
    energy_required = 2,
    enabled = true,
    ingredients =
    {
      {type = "item", name = v.DyWorld.Name.."-plate", amount = 1},
    },
    result = v.DyWorld.Name.."-stick",
	result_amount = 2,
  },
})
		if v.DyWorld.Intermediates.Tech_Processing then
			data.raw.recipe[v.DyWorld.Name.."-stick"].enabled = false
		end
	end
end
