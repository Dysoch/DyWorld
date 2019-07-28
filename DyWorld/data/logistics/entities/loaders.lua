require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

--@todo change belt script to work with predefined data table
for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Belt then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("loader", "loader", v.DyWorld.Name.."-loader", true)
	DyWorld_Prototype_Entity.speed = Round((v.DyWorld.Entity.Belt_Speed / 426.67), 2)
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
	DyWorld_Prototype_Recipe.ingredients = {{type = "item", name = v.DyWorld.Name.."-transport-belt", amount = 2}}
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.belt-4", {"looped-name."..v.DyWorld.Name}}

	data:extend({DyWorld_Prototype_Entity, DyWorld_Prototype_Item, DyWorld_Prototype_Recipe})
	
	if v.DyWorld.Entity.Belt_Tech then
		DyWorld_Add_To_Tech(v.DyWorld.Entity.Belt_Tech, v.DyWorld.Name.."-loader")
	end
	if v.DyWorld.Entity.Loader_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Loader_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-loader"].ingredients, Ingredient)
		end
	end
	if v.DyWorld.Tier >= 7 then
		local Ingredient = {type = "item", name = "processing-unit", amount = v.DyWorld.Tier}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-loader"].ingredients, Ingredient)
	elseif v.DyWorld.Tier >= 4 then
		local Ingredient = {type = "item", name = "advanced-circuit", amount = v.DyWorld.Tier}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-loader"].ingredients, Ingredient)
	elseif v.DyWorld.Tier >= 1 then
		local Ingredient = {type = "item", name = "electronic-circuit", amount = v.DyWorld.Tier}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-loader"].ingredients, Ingredient)
	end
end
end

data.raw["loader"]["loader"].next_upgrade = "iron-loader"
data.raw["loader"]["loader"].speed = Round((5 / 426.67), 5)
data.raw["loader"]["loader"].localised_name = {"looped-name.belt-4", {"looped-name.stone"}}
data.raw["item"]["loader"].localised_name = {"looped-name.belt-4", {"looped-name.stone"}}
data.raw["item"]["loader"].flags = {}
data.raw["recipe"]["loader"].localised_name = {"looped-name.belt-4", {"looped-name.stone"}}
data.raw.recipe["loader"].enabled = true
data.raw.recipe["loader"].ingredients = {
	{type = "item", name = "electronic-circuit", amount = 1},
	{type = "item", name = "transport-belt", amount = 2},
	{type = "item", name = "stone", amount = 3},
}