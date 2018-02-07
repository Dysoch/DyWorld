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
			flags = {"goes-to-quickbar"},
			subgroup = dy.."pt-hidden",
			order = v.Name,
			stack_size = 200
		  },
		})
	end
end

for k,v in pairs(Liquids) do
	if not data.raw.item[v.Name] then
		data:extend(
		{
		  {
			type = "item",
			name = v.Name,
			icon = dyworld_path_icon_temp,
			icon_size = 32,
			flags = {"goes-to-quickbar"},
			subgroup = dy.."pt-hidden",
			order = v.Name,
			stack_size = 200
		  },
		})
	end
end
