require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Power"].value then

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Heat_Exchanger then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("boiler", "heat-exchanger", v.DyWorld.Name.."-heat-exchanger", true)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.boiler-2", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.localised_description = {"looped-name.boiler-2-tp", {"looped-name."..v.DyWorld.Name}, v.DyWorld.Entity.Heat_Exchanger.Target_Temp}
	DyWorld_Prototype_Entity.max_health = 200 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.structure.north.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.north.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.east.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.east.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.resistances = v.DyWorld.Resistances
	DyWorld_Prototype_Entity.hide_resistances = settings.startup["DyWorld_Hide_Resistances"].value
	DyWorld_Prototype_Entity.structure.south.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.south.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.west.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.west.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.target_temperature = v.DyWorld.Entity.Heat_Exchanger.Target_Temp
	DyWorld_Prototype_Entity.energy_source.max_temperature = v.DyWorld.Entity.Heat_Exchanger.Target_Temp + 500
	DyWorld_Prototype_Entity.energy_source.min_working_temperature = v.DyWorld.Entity.Heat_Exchanger.Target_Temp
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.fast_replaceable_group = "boiler"
	if v.DyWorld.Entity.Heat_Exchanger.Next then
		DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Heat_Exchanger.Next.."-heat-exchanger"
	end
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/heat-boiler.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "heat-exchanger", v.DyWorld.Name.."-heat-exchanger", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.boiler-2", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.localised_description = {"looped-name.boiler-2-tp", {"looped-name."..v.DyWorld.Name}, v.DyWorld.Entity.Heat_Exchanger.Target_Temp}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.stack_size = 50
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/heat-boiler.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "heat-exchanger", v.DyWorld.Name.."-heat-exchanger", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-heat-exchanger"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-heat-exchanger"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.boiler-2", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Recipe.energy_required = 0
	DyWorld_Prototype_Recipe.normal.energy_required = (2 * v.DyWorld.Tier) * v.DyWorld.Tier
	DyWorld_Prototype_Recipe.expensive.energy_required = (2 * v.DyWorld.Tier) * v.DyWorld.Tier
	if v.DyWorld.Tier == 1 then 
		DyWorld_Prototype_Recipe.enabled = true
		DyWorld_Prototype_Recipe.normal.enabled = true
		DyWorld_Prototype_Recipe.expensive.enabled = true
	else
		DyWorld_Prototype_Recipe.enabled = false
		DyWorld_Prototype_Recipe.normal.enabled = false
		DyWorld_Prototype_Recipe.expensive.enabled = false
	end

	data:extend({DyWorld_Prototype_Entity, DyWorld_Prototype_Item, DyWorld_Prototype_Recipe})
	
	if data.raw.technology["nuclear-energy-"..v.DyWorld.Tier] and v.DyWorld.Tier >= 2 then
		DyWorld_Add_To_Tech("nuclear-energy-"..v.DyWorld.Tier, v.DyWorld.Name.."-heat-exchanger")
	end
	
	if v.DyWorld.Entity.Heat_Exchanger.Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Heat_Exchanger.Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = Expensive_Check(a)}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-heat-exchanger"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-heat-exchanger"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Heat_Exchanger.Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Heat_Exchanger.Previous.."-heat-exchanger", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-heat-exchanger"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-heat-exchanger"].expensive.ingredients, Ingredient)
	end
end
end

end