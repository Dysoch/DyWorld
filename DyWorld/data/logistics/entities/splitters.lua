require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Belt then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("splitter", "splitter", v.DyWorld.Name.."-splitter", true)
	DyWorld_Prototype_Entity.speed = Round(((v.DyWorld.Entity.Belt.Speed * Transport_Belt_Modifier) / 426.67), 5)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.belt-3", {"looped-name."..v.DyWorld.Name}}
	if v.DyWorld.Entity.Belt.Next then
		DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Belt.Next.."-splitter"
	else
		DyWorld_Prototype_Entity.next_upgrade = nil
	end
	DyWorld_Prototype_Entity.structure.north.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.north.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.east.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.east.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.south.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.south.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.west.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.structure.west.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.max_health = 170 * Metal_Tiers[v.DyWorld.Name]
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/splitter.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}
	DyWorld_Prototype_Entity.belt_animation_set = DyWorld_express_belt_animation_set(Material_Colors[v.DyWorld.Name])

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "splitter", v.DyWorld.Name.."-splitter", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.belt-3", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.stack_size = 200
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/splitter.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "splitter", v.DyWorld.Name.."-splitter", true)
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.belt-3", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {{type = "item", name = v.DyWorld.Name.."-transport-belt", amount = 2}}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-splitter"
	DyWorld_Prototype_Recipe.expensive.ingredients = {{type = "item", name = v.DyWorld.Name.."-transport-belt", amount = Expensive_Check(2)}}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-splitter"
	DyWorld_Prototype_Recipe.ingredients = nil
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
	
	if data.raw.technology["logistics-"..(v.DyWorld.Tier-1)] and v.DyWorld.Tier >= 3 then
		DyWorld_Add_To_Tech("logistics-"..(v.DyWorld.Tier-1), v.DyWorld.Name.."-splitter")
	elseif data.raw.technology["logistics"] and v.DyWorld.Tier == 2 then
		DyWorld_Add_To_Tech("logistics", v.DyWorld.Name.."-splitter")
	end
	if v.DyWorld.Entity.Belt.Splitter_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Belt.Splitter_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = Expensive_Check(a)}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-splitter"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-splitter"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Belt.Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Belt.Previous.."-splitter", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-splitter"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-splitter"].expensive.ingredients, Ingredient)
	end
end
end