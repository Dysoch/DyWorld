require "data/prefix"

for k,v in pairs(data.raw.fluid) do
data:extend(
{	
  {
    type = "recipe",
    name = dy.."void-"..v.name,
	localised_name = {"looped-name.void", {"fluid-name."..v.name}},
	icons = {
	  {
		icon = "__DyWorld__/graphics/delete.png",
	  },
	  {
		icon = v.icon,
	  },
	},
    energy_required = 1,
	category = "crafting-with-fluid",
	subgroup = dy.."zzz-void-recipes",
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

for k,v in pairs(data.raw.unit) do
	if not v.loot then
		v.loot = {}
	end
end