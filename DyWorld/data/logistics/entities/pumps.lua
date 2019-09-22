require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Pump then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("pump", "pump", v.DyWorld.Name.."-pump", true)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.pump-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.max_health = 150 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.energy_usage = (90 * v.DyWorld.Tier).."kW"
	DyWorld_Prototype_Entity.pumping_speed = v.DyWorld.Entity.Pump.Speed
	DyWorld_Prototype_Entity.animations.north.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.animations.north.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.animations.east.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.animations.east.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.animations.south.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.animations.south.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.animations.west.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.animations.west.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.fluid_box.base_area = v.DyWorld.Entity.Pump.Amount / 10
	DyWorld_Prototype_Entity.fast_replaceable_group = "pump"
	if v.DyWorld.Entity.Pump.Next then
		DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Pump.Next.."-pump"
	end
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/pump.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "pump", v.DyWorld.Name.."-pump", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.pump-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.stack_size = 200
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/pump.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "pump", v.DyWorld.Name.."-pump", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-pump"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-pump"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.pump-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Recipe.energy_required = 0
	DyWorld_Prototype_Recipe.normal.energy_required = (0.5 * v.DyWorld.Tier) * v.DyWorld.Tier
	DyWorld_Prototype_Recipe.expensive.energy_required = (0.5 * v.DyWorld.Tier) * v.DyWorld.Tier
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
	
	if data.raw.technology["logistics-"..v.DyWorld.Tier] then
		DyWorld_Add_To_Tech("logistics-"..v.DyWorld.Tier, v.DyWorld.Name.."-pump")
	end
	
	if v.DyWorld.Entity.Pump.Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Pump.Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = Expensive_Check(a)}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-pump"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-pump"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Pump.Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Pump.Previous.."-pump", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-pump"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-pump"].expensive.ingredients, Ingredient)
	end
end
end