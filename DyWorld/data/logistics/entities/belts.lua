require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

--@todo change belt script to work with predefined data table
for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Belt then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("transport-belt", "express-transport-belt", v.DyWorld.Name.."-transport-belt", true)
	DyWorld_Prototype_Entity.speed = Round((v.DyWorld.Entity.Belt_Speed / 426.67), 2)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.belt-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Belt_Next.."-transport-belt"
	DyWorld_Prototype_Entity.max_health = 150 * Metal_Tiers[v.DyWorld.Name]
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/express-transport-belt.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}
	DyWorld_Prototype_Entity.belt_animation_set = DyWorld_express_belt_animation_set(Material_Colors[v.DyWorld.Name])

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "express-transport-belt", v.DyWorld.Name.."-transport-belt", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.belt-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/express-transport-belt.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "transport-belt", v.DyWorld.Name.."-transport-belt", true)
	DyWorld_Prototype_Recipe.ingredients = {}

	data:extend({DyWorld_Prototype_Entity, DyWorld_Prototype_Item, DyWorld_Prototype_Recipe})
	
	if v.DyWorld.Entity.Belt_Tech then
		DyWorld_Add_To_Tech(v.DyWorld.Entity.Belt_Tech, v.DyWorld.Name.."-transport-belt")
	end
	if v.DyWorld.Entity.Belt_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Belt_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-transport-belt"].ingredients, Ingredient)
		end
	end
end
end

data.raw["transport-belt"]["transport-belt"].next_upgrade = "iron-transport-belt"