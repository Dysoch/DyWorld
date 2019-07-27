require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

--@todo change belt script to work with predefined data table
for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Belt then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("underground-belt", "express-underground-belt", v.DyWorld.Name.."-underground-belt", true)
	DyWorld_Prototype_Entity.speed = Round((v.DyWorld.Entity.Belt_Speed / 426.67), 2)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.belt-2", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Belt_Next.."-underground-belt"
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.max_health = 150 * Metal_Tiers[v.DyWorld.Name]
	DyWorld_Prototype_Entity.max_distance = v.DyWorld.Entity.Belt_Range
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/express-underground-belt.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}
	DyWorld_Prototype_Entity.belt_animation_set = DyWorld_express_belt_animation_set(Material_Colors[v.DyWorld.Name])
	DyWorld_Prototype_Entity.structure.direction_in.sheet.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.direction_in.sheet.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.direction_out.sheet.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.direction_out.sheet.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.direction_in_side_loading.sheet.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.direction_in_side_loading.sheet.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.direction_out_side_loading.sheet.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.direction_out_side_loading.sheet.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.back_patch.sheet.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.back_patch.sheet.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.front_patch.sheet.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.front_patch.sheet.hr_version.tint = Material_Colors[v.DyWorld.Name]

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "express-underground-belt", v.DyWorld.Name.."-underground-belt", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.belt-2", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/express-underground-belt.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "express-underground-belt", v.DyWorld.Name.."-underground-belt", true)
	DyWorld_Prototype_Recipe.ingredients = {{type = "item", name = v.DyWorld.Name.."-transport-belt", amount = v.DyWorld.Entity.Belt_Range}}

	data:extend({DyWorld_Prototype_Entity, DyWorld_Prototype_Item, DyWorld_Prototype_Recipe})
	
	if v.DyWorld.Entity.Belt_Tech then
		DyWorld_Add_To_Tech(v.DyWorld.Entity.Belt_Tech, v.DyWorld.Name.."-underground-belt")
	end
	if v.DyWorld.Entity.Underground_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Underground_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-underground-belt"].ingredients, Ingredient)
		end
	end
end
end

--TODO change recipe underground belt
data.raw["underground-belt"]["underground-belt"].next_upgrade = "iron-underground-belt"
data.raw["underground-belt"]["underground-belt"].speed = Round((5 / 426.67), 5)
data.raw["underground-belt"]["underground-belt"].localised_name = {"looped-name.belt-2", {"looped-name.stone"}}
data.raw["item"]["underground-belt"].localised_name = {"looped-name.belt-2", {"looped-name.stone"}}
data.raw["recipe"]["underground-belt"].localised_name = {"looped-name.belt-2", {"looped-name.stone"}}