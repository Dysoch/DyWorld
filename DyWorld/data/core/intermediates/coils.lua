require "data/prefix"

for k,v in pairs(Material_Table) do
	if v.Type == "Basic" or v.Type == "Simple_Alloy" or v.Type == "Alloy" or v.Type == "Complex_Alloy" or v.Type == "Super_Alloy" then
		data:extend(
		{ 
		  {
			type = "item",
			name = v.Name.."-coil",
			localised_name = {"looped-name.coil", {"looped-name."..v.Name}},
			localised_description = {"looped-name.coil-machine"},
			icons = 
			{
			  {
				icon = dyworld_path_icon.."coil.png",
				tint = Material_Colors[v.Table],
			  },
			},
			flags = {"goes-to-main-inventory"},
			subgroup = dy.."circuit-02-coils",
			stack_size = 200,
			order = v.Name,
		  },
		  {
			type = "recipe",
			name = dy..v.Name.."-coil",
			energy_required = 0.15,
			category = dy.."coil-crafting", 
			enabled = true,
			hidden = settings.startup["DyWorld_Hidden_Recipes"].value,
			ingredients = {{v.Name.."-cable", 1}},
			result = v.Name.."-coil",
			result_count = 1,
		  },
		  {
			type = "recipe",
			name = v.Name.."-coil",
			energy_required = 1,
			enabled = true,
			allow_as_intermediate = settings.startup["DyWorld_Circuit_Components_Auto_Craft"].value,
			ingredients = {{v.Name.."-cable", 5}},
			result = v.Name.."-coil",
			result_count = 1,
		  },
		})
		if data.raw.technology[dy..v.Name.."-processing"] then
			data.raw.recipe[dy..v.Name.."-coil"].enabled = false
			data.raw.recipe[v.Name.."-coil"].enabled = false
			DyWorld_Add_To_Tech(dy..v.Name.."-processing", dy..v.Name.."-coil")
			DyWorld_Add_To_Tech(dy..v.Name.."-processing", v.Name.."-coil")
		elseif data.raw.technology[v.Name.."-processing"] then
			data.raw.recipe[dy..v.Name.."-coil"].enabled = false
			data.raw.recipe[v.Name.."-coil"].enabled = false
			DyWorld_Add_To_Tech(v.Name.."-processing", dy..v.Name.."-coil")
			DyWorld_Add_To_Tech(v.Name.."-processing", v.Name.."-coil")
		end
		table.insert(DyWorld_TD.Module_List, dy..v.Name.."-coil")
		table.insert(DyWorld_TD.Module_List, v.Name.."-coil")
	end
end