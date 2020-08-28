require "data/prefix"

for k,v in pairs(Material_Table) do
	if v.Type == "Basic" or v.Type == "Simple_Alloy" or v.Type == "Alloy" or v.Type == "Complex_Alloy" or v.Type == "Super_Alloy" then
		data:extend(
		{ 
		  {
			type = "item",
			name = v.Name.."-pcb",
			localised_name = {"looped-name.pcb", {"looped-name."..v.Name}},
			localised_description = {"looped-name.pcb-machine"},
			icons = 
			{
			  {
				icon = dyworld_path_icon.."pcb.png",
				tint = Material_Colors[v.Table],
			  },
			},
			flags = {},
			subgroup = dy.."circuit-03-pcbs",
			stack_size = 200,
			order = v.Name,
		  },
		  {
			type = "recipe",
			name = dy..v.Name.."-pcb",
			energy_required = 0.15,
			category = dy.."pcb-crafting", 
			enabled = true,
			hidden = settings.startup["DyWorld_Hidden_Recipes"].value,
			ingredients = {{v.Name.."-coil", 1}},
			result = v.Name.."-pcb",
			result_count = 1,
		  },
		  {
			type = "recipe",
			name = v.Name.."-pcb",
			energy_required = 1,
			enabled = true,
			allow_as_intermediate = settings.startup["DyWorld_Circuit_Components_Auto_Craft"].value,
			ingredients = {{v.Name.."-coil", 3}},
			result = v.Name.."-pcb",
			result_count = 1,
		  },
		})
		if data.raw.technology[dy..v.Name.."-processing"] then
			data.raw.recipe[dy..v.Name.."-pcb"].enabled = false
			data.raw.recipe[v.Name.."-pcb"].enabled = false
			DyWorld_Add_To_Tech(dy..v.Name.."-processing", dy..v.Name.."-pcb")
			DyWorld_Add_To_Tech(dy..v.Name.."-processing", v.Name.."-pcb")
		elseif data.raw.technology[v.Name.."-processing"] then
			data.raw.recipe[dy..v.Name.."-pcb"].enabled = false
			data.raw.recipe[v.Name.."-pcb"].enabled = false
			DyWorld_Add_To_Tech(v.Name.."-processing", dy..v.Name.."-pcb")
			DyWorld_Add_To_Tech(v.Name.."-processing", v.Name.."-pcb")
		end
		table.insert(DyWorld_TD.Module_List, dy..v.Name.."-pcb")
		table.insert(DyWorld_TD.Module_List, v.Name.."-pcb")
	end
end