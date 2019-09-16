require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Chemical then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("assembling-machine", "chemical-plant", v.DyWorld.Name.."-chemical-plant", true)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.chemical-plant-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.max_health = 500 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.energy_source.emissions_per_minute = 2 * (v.DyWorld.Tier * (v.DyWorld.Tier * 0.75))
	DyWorld_Prototype_Entity.module_specification.module_slots = 2 + v.DyWorld.Tier
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.fast_replaceable_group = "chemical-plant"
	DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Chemical.Chemical_Next.."-chemical-plant"
	DyWorld_Prototype_Entity.crafting_speed = Round(((0.5 * (v.DyWorld.Tier * (v.DyWorld.Tier * 0.5))) * v.DyWorld.Entity.Chemical.Chemical_Speed_Mod), 2)
	DyWorld_Prototype_Entity.energy_usage = (250 * v.DyWorld.Tier).."kW"
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/chemical-plant.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "chemical-plant", v.DyWorld.Name.."-chemical-plant", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.chemical-plant-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.stack_size = 200
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/chemical-plant.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "chemical-plant", v.DyWorld.Name.."-chemical-plant", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.energy_required = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-chemical-plant"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-chemical-plant"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.chemical-plant-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Recipe.energy_required = 0
	DyWorld_Prototype_Recipe.normal.energy_required = (4 * v.DyWorld.Tier) * v.DyWorld.Tier
	DyWorld_Prototype_Recipe.expensive.energy_required = (4 * v.DyWorld.Tier) * v.DyWorld.Tier
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
	
	if data.raw.technology["oil-processing-"..v.DyWorld.Tier] then
		DyWorld_Add_To_Tech("oil-processing-"..v.DyWorld.Tier, v.DyWorld.Name.."-chemical-plant")
	end
	if v.DyWorld.Entity.Chemical.Chemical_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Chemical.Chemical_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = a * 5}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-chemical-plant"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-chemical-plant"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Chemical.Chemical_Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Chemical.Chemical_Previous.."-chemical-plant", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-chemical-plant"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-chemical-plant"].expensive.ingredients, Ingredient)
	end
end
end

--data.raw["assembling-machine"]["chemical-plant"].next_upgrade = "iron-chemical-plant"
data.raw["assembling-machine"]["chemical-plant"].fast_replaceable_group = "chemical-plant"