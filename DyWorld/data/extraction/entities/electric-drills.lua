require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

--@todo change belt script to work with predefined data table
for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Drill then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("mining-drill", "electric-mining-drill", v.DyWorld.Name.."-electric-mining-drill", true)
	DyWorld_Prototype_Entity.resource_searching_radius = ((v.DyWorld.Entity.Drill.Drill_Range / 2) - 0.01)
	DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Drill.Drill_Next.."-electric-mining-drill"
	DyWorld_Prototype_Entity.mining_speed = v.DyWorld.Entity.Drill.Drill_Speed
	DyWorld_Prototype_Entity.energy_usage = Round((v.DyWorld.Entity.Drill.Drill_Speed * 180), 0).."kW"
	DyWorld_Prototype_Entity.localised_name = {"looped-name.drill-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.animations.north.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.animations.north.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.animations.east.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.animations.east.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.animations.south.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.animations.south.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.animations.west.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.animations.west.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.max_health = 300 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.energy_source.emissions_per_minute = 10 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.module_specification.module_slots = 2 + v.DyWorld.Tier
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/electric-mining-drill.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}
	DyWorld_Prototype_Entity.belt_animation_set = DyWorld_express_belt_animation_set(Material_Colors[v.DyWorld.Name])

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "electric-mining-drill", v.DyWorld.Name.."-electric-mining-drill", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.drill-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.stack_size = 200
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/electric-mining-drill.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "electric-mining-drill", v.DyWorld.Name.."-electric-mining-drill", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-electric-mining-drill"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-electric-mining-drill"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.drill-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Recipe.energy_required = 0
	DyWorld_Prototype_Recipe.normal.energy_required = (2 * v.DyWorld.Tier) * v.DyWorld.Tier
	DyWorld_Prototype_Recipe.expensive.energy_required = ((2 * v.DyWorld.Tier) * v.DyWorld.Tier)
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
	
	if v.DyWorld.Tier >= 2 and data.raw.technology["automation-"..v.DyWorld.Tier] then
		DyWorld_Add_To_Tech("automation-"..v.DyWorld.Tier, v.DyWorld.Name.."-electric-mining-drill")
	end
	if v.DyWorld.Entity.Drill.Drill_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Drill.Drill_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = a * 5}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-electric-mining-drill"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-electric-mining-drill"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Drill.Drill_Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Drill.Drill_Previous.."-electric-mining-drill", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-electric-mining-drill"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-electric-mining-drill"].expensive.ingredients, Ingredient)
	end
end
end