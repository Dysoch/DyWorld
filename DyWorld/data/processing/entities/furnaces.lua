require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Furnace then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("furnace", "electric-furnace", v.DyWorld.Name.."-electric-furnace", true)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.furnace-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.max_health = 200 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.energy_source.emissions_per_minute = 1 * (v.DyWorld.Tier * (v.DyWorld.Tier * 0.75))
	DyWorld_Prototype_Entity.module_specification.module_slots = 2 + v.DyWorld.Tier
	DyWorld_Prototype_Entity.animation.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.animation.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Furnace.Furnace_Next.."-electric-furnace"
	DyWorld_Prototype_Entity.crafting_speed = Round(((0.5 * (v.DyWorld.Tier * (v.DyWorld.Tier * 0.5))) * v.DyWorld.Entity.Furnace.Furnace_Speed_Mod), 2)
	DyWorld_Prototype_Entity.energy_usage = (150 * v.DyWorld.Tier).."kW"
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/electric-furnace.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "electric-furnace", v.DyWorld.Name.."-electric-furnace", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.furnace-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/electric-furnace.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "electric-furnace", v.DyWorld.Name.."-electric-furnace", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-electric-furnace"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-electric-furnace"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.furnace-1", {"looped-name."..v.DyWorld.Name}}
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
	
	DyWorld_Add_To_Tech("smelting-"..v.DyWorld.Tier, v.DyWorld.Name.."-electric-furnace")
	
	if v.DyWorld.Entity.Furnace.Furnace_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Furnace.Furnace_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = a * 5}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-electric-furnace"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-electric-furnace"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Furnace.Furnace_Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Furnace.Furnace_Previous.."-electric-furnace", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-electric-furnace"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-electric-furnace"].expensive.ingredients, Ingredient)
	end
end
end
