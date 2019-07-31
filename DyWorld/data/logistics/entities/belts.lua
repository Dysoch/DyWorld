require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

--@todo change belt script to work with predefined data table
for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Belt then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("transport-belt", "transport-belt", v.DyWorld.Name.."-transport-belt", true)
	DyWorld_Prototype_Entity.speed = Round((v.DyWorld.Entity.Belt_Speed / 426.67), 5)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.belt-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Belt_Next.."-transport-belt"
	DyWorld_Prototype_Entity.max_health = 150 * Metal_Tiers[v.DyWorld.Name]
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/transport-belt.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}
	DyWorld_Prototype_Entity.belt_animation_set = DyWorld_express_belt_animation_set(Material_Colors[v.DyWorld.Name])

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "transport-belt", v.DyWorld.Name.."-transport-belt", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.belt-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/transport-belt.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "transport-belt", v.DyWorld.Name.."-transport-belt", true)
	DyWorld_Prototype_Recipe.enabled = false
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.belt-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-transport-belt"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-transport-belt"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.enabled = false

	data:extend({DyWorld_Prototype_Entity, DyWorld_Prototype_Item, DyWorld_Prototype_Recipe})
	
	if v.DyWorld.Entity.Belt_Tech then
		DyWorld_Add_To_Tech(v.DyWorld.Entity.Belt_Tech, v.DyWorld.Name.."-transport-belt")
	end
	if v.DyWorld.Entity.Belt_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Belt_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = a * 5}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-transport-belt"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-transport-belt"].expensive.ingredients, Ingredient_2)
		end
	end
end
end

data.raw["transport-belt"]["transport-belt"].next_upgrade = "iron-transport-belt"
data.raw["transport-belt"]["transport-belt"].speed = Round((5 / 426.67), 5)
data.raw["transport-belt"]["transport-belt"].localised_name = {"looped-name.belt-1", {"looped-name.stone"}}
data.raw.item["transport-belt"].localised_name = {"looped-name.belt-1", {"looped-name.stone"}}
data.raw.recipe["transport-belt"].localised_name = {"looped-name.belt-1", {"looped-name.stone"}}
data.raw.recipe["transport-belt"].ingredients = nil
data.raw.recipe["transport-belt"].normal = {}
data.raw.recipe["transport-belt"].expensive = {}
data.raw.recipe["transport-belt"].normal.ingredients = {
	{type = "item", name = "stone", amount = 3},
	{type = "item", name = "stone-gear-wheel", amount = 2},
}
data.raw.recipe["transport-belt"].expensive.ingredients = {
	{type = "item", name = "stone", amount = 15},
	{type = "item", name = "stone-gear-wheel", amount = 10},
}
data.raw.recipe["transport-belt"].normal.result = "transport-belt"
data.raw.recipe["transport-belt"].expensive.result = "transport-belt"