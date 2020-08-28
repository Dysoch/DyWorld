require "data/prefix"

for k,v in pairs(Material_Table) do
	if v.Pebble then
		data:extend(
		{	  
		  {
			type = "item",
			name = v.Name.."-pebble",
			localised_name = {"looped-name.pebble", {"looped-name."..v.Name}},
			icons = 
			{
			  {
				icon = dyworld_path_icon.."base-pebble.png",
				tint = Material_Colors[v.Table],
			  },
			},
			flags = {},
			subgroup = dy.."metal-1-pebble",
			stack_size = 500,
			order = v.Name,
		  },
		  {
			type = "recipe",
			name = v.Name.."-pebble",
			energy_required = 1,
			enabled = false,
			ingredients = {{v.Name.."-pebble", 10}},
			result = v.Name.."-ore",
			result_count = 1,
		  },
		})
		if v.Name == "iron" or v.Name == "copper" then
			data.raw.recipe[v.Name.."-pebble"].enabled = true
		else
			DyWorld_Add_To_Tech(dy..v.Name.."-processing", v.Name.."-pebble")
		end
	end
end