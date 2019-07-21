require "data/core/functions/prefix"
require "data/core/functions/colors"

for k,v in pairs(data.raw.item) do
	if v.DyWorld and v.DyWorld.Metallurgy and v.DyWorld.Metallurgy.Melting_Point and v.DyWorld.Metallurgy.Boiling_Point then
data:extend(
{
  {
    type = "fluid",
    name = "molten-"..v.DyWorld.Name,
	localised_name = {"looped-name.molten", {"looped-name."..v.DyWorld.Name}},
	icons = 
	{
	  {
		icon = dyworld_path_fluid.."base.png",
		tint = Material_Colors[v.DyWorld.Name],
	  }
	},
    default_temperature = v.DyWorld.Metallurgy.Melting_Point,
    max_temperature = v.DyWorld.Metallurgy.Boiling_Point,
    base_color = Material_Colors[v.DyWorld.Name],
    flow_color = Material_Colors[v.DyWorld.Name],
    order = "molten-"..v.DyWorld.Name,
    subgroup = dy.."fluids-"..(v.DyWorld.Tier-1),
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    auto_barrel = false,
  },
})
	end
end
