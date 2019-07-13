require "data/prefix"
require "data/chemistry/prefix"

for k,v in pairs(Solids) do
	if not data.raw.item[v.Name] then
		data:extend(
		{
		  {
			type = "item",
			name = v.Name,
			icon = dyworld_path_icon_temp,
			icon_size = 32,
			flags = {},
			subgroup = dy.."pt-hidden",
			order = v.Name,
			stack_size = 200
		  },
		})
	end
end

for k,v in pairs(Liquids) do
	if not data.raw.fluid[v.Name] then
		data:extend(
		{
		  {
			type = "fluid",
			name = v.Name,
			icon = dyworld_path_icon_temp,
			default_temperature = 15,
			max_temperature = 100,
			base_color = {r=0, g=0, b=255},
			flow_color = {r=0, g=0, b=255},
			order = v.Name,
			pressure_to_speed_ratio = 0.4,
			flow_to_energy_ratio = 0.59,
			heat_capacity = "0.2KJ",
			auto_barrel = false
			},
		})
	end
end
