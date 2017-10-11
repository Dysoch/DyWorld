require "data/prefix"

for k,v in pairs(data.raw.fluid) do
data:extend(
{	
  {
    type = "recipe",
    name = dy.."void-"..v.name,
	localised_name = {"looped-name.void", "fluid-name."..v.name},
	icons = {
	  {
		icon = v.icon,
	  },
	  {
		icon = dyworld_path_icon_temp,
	  },
	},
    energy_required = 1,
	category = "crafting-with-fluid",
    enabled = true,
    ingredients =
    {
      {type = "fluid", name = v.name, amount = 50},
    },
    results = {{type = "fluid", name = v.name, amount = 0}},
  },
}
)
end	