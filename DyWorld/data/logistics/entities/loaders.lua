require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

--@todo change belt script to work with predefined data table
for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Belt then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("loader", "loader", v.DyWorld.Name.."-loader", true)
	DyWorld_Prototype_Entity.speed = Round((v.DyWorld.Entity.Belt_Speed / 426.67), 5)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.belt-4", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Belt_Next.."-loader"
	DyWorld_Prototype_Entity.structure.direction_in.sheet.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.direction_out.sheet.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.max_health = 170 * Metal_Tiers[v.DyWorld.Name]
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/loader.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}
	DyWorld_Prototype_Entity.belt_animation_set = DyWorld_express_belt_animation_set(Material_Colors[v.DyWorld.Name])

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "loader", v.DyWorld.Name.."-loader", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.belt-4", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.flags = {}
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/loader.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "loader", v.DyWorld.Name.."-loader", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {{type = "item", name = v.DyWorld.Name.."-transport-belt", amount = 2}}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-loader"
	DyWorld_Prototype_Recipe.expensive.ingredients = {{type = "item", name = v.DyWorld.Name.."-transport-belt", amount = 10}}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-loader"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.belt-4", {"looped-name."..v.DyWorld.Name}}
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
	
	if v.DyWorld.Entity.Belt_Tech then
		DyWorld_Add_To_Tech(v.DyWorld.Entity.Belt_Tech, v.DyWorld.Name.."-loader")
	end
	if v.DyWorld.Entity.Loader_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Loader_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = a * 5}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-loader"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-loader"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Tier >= 7 then
		local Ingredient = {type = "item", name = "processing-unit", amount = v.DyWorld.Tier * 3}
		local Ingredient_2 = {type = "item", name = "processing-unit", amount = v.DyWorld.Tier * 15}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-loader"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-loader"].expensive.ingredients, Ingredient_2)
	elseif v.DyWorld.Tier >= 4 then
		local Ingredient = {type = "item", name = "advanced-circuit", amount = v.DyWorld.Tier * 2}
		local Ingredient_2 = {type = "item", name = "advanced-circuit", amount = v.DyWorld.Tier * 10}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-loader"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-loader"].expensive.ingredients, Ingredient_2)
	elseif v.DyWorld.Tier >= 1 then
		local Ingredient = {type = "item", name = "electronic-circuit", amount = v.DyWorld.Tier * 1}
		local Ingredient_2 = {type = "item", name = "electronic-circuit", amount = v.DyWorld.Tier * 5}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-loader"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-loader"].expensive.ingredients, Ingredient_2)
	end
end
end