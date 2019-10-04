require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

--TODO Add more Boilers
--BODY @ZukiiG
for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Boiler then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("boiler", "boiler", v.DyWorld.Name.."-boiler", true)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.boiler-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.max_health = 200 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.structure.north.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.north.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.east.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.east.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.south.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.south.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.west.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.west.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.target_temperature = v.DyWorld.Entity.Boiler.Max_Temp
	DyWorld_Prototype_Entity.energy_source.effectivity = v.DyWorld.Entity.Boiler.Effectivity
	DyWorld_Prototype_Entity.energy_source.emissions_per_minute = 20 + (10 * v.DyWorld.Tier)
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.energy_consumption = (v.DyWorld.Entity.Boiler.Energy_Consumption_KW).."kW"
	DyWorld_Prototype_Entity.fast_replaceable_group = "boiler"
	if v.DyWorld.Entity.Boiler.Next then
		DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Boiler.Next.."-boiler"
	end
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/boiler.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "boiler", v.DyWorld.Name.."-boiler", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.boiler-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.stack_size = 50
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/boiler.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "boiler", v.DyWorld.Name.."-boiler", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-boiler"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-boiler"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.boiler-1", {"looped-name."..v.DyWorld.Name}}
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
	
	if data.raw.technology["steam-energy-"..v.DyWorld.Tier] and v.DyWorld.Tier >= 2 then
		DyWorld_Add_To_Tech("steam-energy-"..v.DyWorld.Tier, v.DyWorld.Name.."-boiler")
	end
	
	if v.DyWorld.Entity.Boiler.Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Boiler.Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = Expensive_Check(a)}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-boiler"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-boiler"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Boiler.Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Boiler.Previous.."-boiler", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-boiler"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-boiler"].expensive.ingredients, Ingredient)
	end
end
end