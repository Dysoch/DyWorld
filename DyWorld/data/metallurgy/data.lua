
-- Edits
require("data.metallurgy.edits.items")
require("data.metallurgy.edits.recipes")

-- Items
require("data.metallurgy.items.alloys")
require("data.metallurgy.items.clean-ore")
require("data.metallurgy.items.pebble")

-- Fluids
require("data.metallurgy.fluids.fluids")

-- Machines
require("data.metallurgy.machines.blast-furnace")
require("data.metallurgy.machines.forge")
require("data.metallurgy.machines.washer")
require("data.metallurgy.machines.rock-boiler-1000")
require("data.metallurgy.machines.rock-boiler-2000")
require("data.metallurgy.machines.rock-boiler-3000")
require("data.metallurgy.machines.rock-boiler-4000")
require("data.metallurgy.machines.rock-boiler-5000")

-- Melting Recipes
require("data.metallurgy.recipes.melting")

-- Casting Recipes
require("data.metallurgy.recipes.casting")

-- Cleaning Recipes
require("data.metallurgy.recipes.cleaning")

-- Mixing Recipes
require("data.metallurgy.recipes.mixing-simple-alloy")
require("data.metallurgy.recipes.mixing-alloy")
require("data.metallurgy.recipes.mixing-complex-alloy")
require("data.metallurgy.recipes.mixing-super-alloy")

for k,v in pairs(Material_Table) do
	if v.Type == "Simple_Alloy" or v.Type == "Alloy" or v.Type == "Complex_Alloy" or v.Type == "Super_Alloy" then
		if data.raw.technology[dy..v.Name.."-advanced-melting"] then
			data.raw.recipe[dy..v.Name.."-cable"].enabled = false
			data.raw.recipe[v.Name.."-cable"].enabled = false
			DyWorld_Add_To_Tech(dy..v.Name.."-advanced-melting", dy..v.Name.."-cable")
			DyWorld_Add_To_Tech(dy..v.Name.."-advanced-melting", v.Name.."-cable")
			data.raw.recipe[dy..v.Name.."-coil"].enabled = false
			data.raw.recipe[v.Name.."-coil"].enabled = false
			DyWorld_Add_To_Tech(dy..v.Name.."-advanced-melting", dy..v.Name.."-coil")
			DyWorld_Add_To_Tech(dy..v.Name.."-advanced-melting", v.Name.."-coil")
			data.raw.recipe[dy..v.Name.."-gear-wheel"].enabled = false
			data.raw.recipe[v.Name.."-gear-wheel"].enabled = false
			DyWorld_Add_To_Tech(dy..v.Name.."-advanced-melting", dy..v.Name.."-gear-wheel")
			DyWorld_Add_To_Tech(dy..v.Name.."-advanced-melting", v.Name.."-gear-wheel")
			data.raw.recipe[dy..v.Name.."-pcb"].enabled = false
			data.raw.recipe[v.Name.."-pcb"].enabled = false
			DyWorld_Add_To_Tech(dy..v.Name.."-advanced-melting", dy..v.Name.."-pcb")
			DyWorld_Add_To_Tech(dy..v.Name.."-advanced-melting", v.Name.."-pcb")
		end
	end
end
