require "data/prefix"

for k,v in pairs(Material_Table) do
	if v.Type == "Basic" or v.Type == "Simple_Alloy" or v.Type == "Alloy" or v.Type == "Complex_Alloy" or v.Type == "Super_Alloy" then
		data:extend(
		{ 
		  {
			type = "item",
			name = v.Name.."-gear-wheel",
			localised_name = {"looped-name.gear", {"looped-name."..v.Name}},
			localised_description = {"looped-name.gear-machine"},
			icons = 
			{
			  {
				icon = "__base__/graphics/icons/iron-gear-wheel.png",
				tint = Material_Colors[v.Table],
			  },
			},
			flags = {"goes-to-main-inventory"},
			subgroup = dy.."gears",
			stack_size = 200,
			order = v.Name,
		  },
		  {
			type = "recipe",
			name = dy..v.Name.."-gear-wheel",
			energy_required = 0.15,
			category = dy.."gear-crafting", 
			enabled = true,
			hidden = settings.startup["DyWorld_Hidden_Recipes"].value,
			ingredients = {{v.Name.."-plate", 2}},
			result = v.Name.."-gear-wheel",
			result_count = 1,
		  },
		  {
			type = "recipe",
			name = v.Name.."-gear-wheel",
			energy_required = 1,
			enabled = true,
			allow_as_intermediate = settings.startup["DyWorld_Circuit_Components_Auto_Craft"].value,
			ingredients = {{v.Name.."-plate", 5}},
			result = v.Name.."-gear-wheel",
			result_count = 1,
		  },
		})
		if data.raw.technology[dy..v.Name.."-processing"] then
			data.raw.recipe[dy..v.Name.."-gear-wheel"].enabled = false
			data.raw.recipe[v.Name.."-gear-wheel"].enabled = false
			DyWorld_Add_To_Tech(dy..v.Name.."-processing", dy..v.Name.."-gear-wheel")
			DyWorld_Add_To_Tech(dy..v.Name.."-processing", v.Name.."-gear-wheel")
		elseif data.raw.technology[v.Name.."-processing"] then
			data.raw.recipe[dy..v.Name.."-gear-wheel"].enabled = false
			data.raw.recipe[v.Name.."-gear-wheel"].enabled = false
			DyWorld_Add_To_Tech(v.Name.."-processing", dy..v.Name.."-gear-wheel")
			DyWorld_Add_To_Tech(v.Name.."-processing", v.Name.."-gear-wheel")
		end
		table.insert(DyWorld_TD.Module_List, dy..v.Name.."-gear-wheel")
		table.insert(DyWorld_TD.Module_List, v.Name.."-gear-wheel")
	end
end