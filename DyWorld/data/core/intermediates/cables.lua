require "data/prefix"

data.raw.recipe["iron-stick"].hidden = true
data.raw.recipe["copper-cable"].result_count = 1

for k,v in pairs(Material_Table) do
	if v.Type == "Basic" or v.Type == "Simple_Alloy" or v.Type == "Alloy" or v.Type == "Complex_Alloy" or v.Type == "Super_Alloy" then
		data:extend(
		{ 
		  {
			type = "item",
			name = v.Name.."-cable",
			localised_name = {"looped-name.cable", {"looped-name."..v.Name}},
			localised_description = {"looped-name.cable-machine"},
			icons = 
			{
			  {
				icon = dyworld_path_icon.."wire.png",
				tint = Material_Colors[v.Table],
			  },
			},
			flags = {},
			subgroup = dy.."circuit-01-cables",
			stack_size = 200,
			order = v.Name,
		  },
		  {
			type = "recipe",
			name = dy..v.Name.."-cable",
			energy_required = 0.15,
			category = dy.."cable-crafting", 
			enabled = true,
			hidden = settings.startup["DyWorld_Hidden_Recipes"].value,
			ingredients = {{v.Name.."-plate", 1}},
			result = v.Name.."-cable",
			result_count = 3,
		  },
		  {
			type = "recipe",
			name = v.Name.."-cable",
			energy_required = 1,
			enabled = true,
			allow_as_intermediate = settings.startup["DyWorld_Circuit_Components_Auto_Craft"].value,
			ingredients = {{v.Name.."-plate", 1}},
			result = v.Name.."-cable",
			result_count = 1,
		  },
		})
		if data.raw.technology[dy..v.Name.."-processing"] then
			data.raw.recipe[dy..v.Name.."-cable"].enabled = false
			data.raw.recipe[v.Name.."-cable"].enabled = false
			DyWorld_Add_To_Tech(dy..v.Name.."-processing", dy..v.Name.."-cable")
			DyWorld_Add_To_Tech(dy..v.Name.."-processing", v.Name.."-cable")
		elseif data.raw.technology[v.Name.."-processing"] then
			data.raw.recipe[dy..v.Name.."-cable"].enabled = false
			data.raw.recipe[v.Name.."-cable"].enabled = false
			DyWorld_Add_To_Tech(v.Name.."-processing", dy..v.Name.."-cable")
			DyWorld_Add_To_Tech(v.Name.."-processing", v.Name.."-cable")
		end
		table.insert(DyWorld_TD.Module_List, dy..v.Name.."-cable")
		table.insert(DyWorld_TD.Module_List, v.Name.."-cable")
	end
end