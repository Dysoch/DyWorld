require "data/prefix"

for k,v in pairs(Material_Table) do
	if v.Type == "Basic" then
		data:extend(
		{	  
		  {
			type = "item",
			name = v.Name.."-clean-ore",
			localised_name = {"looped-name.clean-ore", {"looped-name."..v.Name}},
			icons = 
			{
			  {
				icon = dyworld_path_icon.."ore/"..v.Name..".png",
			  },
			},
			flags = {"goes-to-main-inventory"},
			subgroup = dy.."metal-1-ore-clean",
			stack_size = 200,
			order = v.Name,
		  },
		  {
			type = "recipe",
			name = v.Name.."-clean-ore-smelting",
			energy_required = 2.5,
			enabled = false,
			category = "smelting",
			ingredients = {{v.Name.."-clean-ore", 2}},
			result = v.Name.."-plate",
			result_count = 1,
		  },
		})
		if v.Name == "iron" or v.Name == "copper" then
			data.raw.recipe[v.Name.."-clean-ore-smelting"].enabled = true
		else
			DyWorld_Add_To_Tech(dy..v.Name.."-processing", v.Name.."-clean-ore-smelting")
		end
	end
end