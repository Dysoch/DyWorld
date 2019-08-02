require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

--@todo change belt script to work with predefined data table
for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Belt then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("underground-belt", "underground-belt", v.DyWorld.Name.."-underground-belt", true)
	DyWorld_Prototype_Entity.speed = Round((v.DyWorld.Entity.Belt_Speed / 426.67), 5)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.belt-2", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Belt_Next.."-underground-belt"
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.max_health = 150 * Metal_Tiers[v.DyWorld.Name]
	DyWorld_Prototype_Entity.max_distance = v.DyWorld.Entity.Belt_Range
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/underground-belt.png",
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

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "underground-belt", v.DyWorld.Name.."-underground-belt", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.belt-2", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/underground-belt.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "underground-belt", v.DyWorld.Name.."-underground-belt", true)
	DyWorld_Prototype_Recipe.enabled = false
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {{type = "item", name = v.DyWorld.Name.."-transport-belt", amount = v.DyWorld.Entity.Belt_Range}}
	DyWorld_Prototype_Recipe.normal.results = {{type = "item", name = v.DyWorld.Name.."-underground-belt", amount = 2}}
	DyWorld_Prototype_Recipe.expensive.ingredients = {{type = "item", name = v.DyWorld.Name.."-transport-belt", amount = v.DyWorld.Entity.Belt_Range * 5}}
	DyWorld_Prototype_Recipe.expensive.results = {{type = "item", name = v.DyWorld.Name.."-underground-belt", amount = 2}}
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.normal.enabled = false
	DyWorld_Prototype_Recipe.expensive.enabled = false
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.belt-2", {"looped-name."..v.DyWorld.Name}}

	data:extend({DyWorld_Prototype_Entity, DyWorld_Prototype_Item, DyWorld_Prototype_Recipe})
	
	if v.DyWorld.Entity.Belt_Tech then
		DyWorld_Add_To_Tech(v.DyWorld.Entity.Belt_Tech, v.DyWorld.Name.."-underground-belt")
	end
	if v.DyWorld.Entity.Loader_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Loader_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = a * 5}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-underground-belt"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-underground-belt"].expensive.ingredients, Ingredient_2)
		end
	end
end
end

data.raw.recipe["stone-underground-belt"].enabled = true
data.raw.recipe["stone-underground-belt"].normal.enabled = true
data.raw.recipe["stone-underground-belt"].expensive.enabled = true