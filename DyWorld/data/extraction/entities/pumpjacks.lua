require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Pumpjack then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("mining-drill", "pumpjack", v.DyWorld.Name.."-pumpjack", true)
	DyWorld_Prototype_Entity.resource_searching_radius = ((v.DyWorld.Entity.Pumpjack.Range / 2) - 0.01)
	if v.DyWorld.Entity.Pumpjack.Next then
		DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Pumpjack.Next.."-pumpjack"
	end
	DyWorld_Prototype_Entity.mining_speed = v.DyWorld.Entity.Pumpjack.Speed
	DyWorld_Prototype_Entity.energy_usage = Round((v.DyWorld.Entity.Pumpjack.Speed * 180), 0).."kW"
	DyWorld_Prototype_Entity.localised_name = {"looped-name.pumpjack-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.base_picture.sheets[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.base_picture.sheets[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.max_health = 300 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.energy_source.emissions_per_minute = 10 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.module_specification.module_slots = 2 + v.DyWorld.Tier
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/pumpjack.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}
	DyWorld_Prototype_Entity.animation_set = DyWorld_express_belt_animation_set(Material_Colors[v.DyWorld.Name])

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "pumpjack", v.DyWorld.Name.."-pumpjack", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.pumpjack-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.stack_size = 200
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/pumpjack.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "pumpjack", v.DyWorld.Name.."-pumpjack", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-pumpjack"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-pumpjack"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.pumpjack-1", {"looped-name."..v.DyWorld.Name}}
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
	
	if data.raw.technology["fluid-handling-"..v.DyWorld.Tier] then
		DyWorld_Add_To_Tech("fluid-handling-"..v.DyWorld.Tier, v.DyWorld.Name.."-pumpjack")
	end
	
	if v.DyWorld.Entity.Pumpjack.Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Pumpjack.Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = Expensive_Check(a)}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-pumpjack"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-pumpjack"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Pumpjack.Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Pumpjack.Previous.."-pumpjack", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-pumpjack"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-pumpjack"].expensive.ingredients, Ingredient)
	end
end
end