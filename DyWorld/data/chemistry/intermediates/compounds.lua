require "data/prefix"
require "data/chemistry/prefix"

for k,v in pairs(Compounds) do
	if v.Type == "item" then
		if not data.raw.item[k] then
			data:extend(
			{
			  {
				type = "item",
				name = k,
				icon = dyworld_path_icon_temp,
				icon_size = 32,
				flags = {"goes-to-quickbar"},
				subgroup = dy.."pt-hidden",
				order = k,
				stack_size = 200
			  },
			})
		end
	elseif v.Type == "fluid" then
		if not data.raw.fluid[k] then
			data:extend(
			{
			  {
				type = "fluid",
				name = k,
				icon = dyworld_path_icon_temp,
				default_temperature = 15,
				max_temperature = 100,
				base_color = {r=0, g=0, b=255},
				flow_color = {r=0, g=0, b=255},
				order = k,
				pressure_to_speed_ratio = 0.4,
				flow_to_energy_ratio = 0.59,
				heat_capacity = "0.2KJ",
				auto_barrel = false
				},
			})
		end
	end
end
