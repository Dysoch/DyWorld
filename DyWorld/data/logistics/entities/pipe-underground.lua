require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Pipe then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("pipe-to-ground", "pipe-to-ground", v.DyWorld.Name.."-pipe-to-ground", true)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.pipe-to-ground-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.max_health = 150 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.pictures.up.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.pictures.up.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.pictures.down.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.pictures.down.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.pictures.left.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.pictures.left.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.pictures.right.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.pictures.right.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.fluid_box.base_area = v.DyWorld.Entity.Pipe.Pipe_Amount / 10
	DyWorld_Prototype_Entity.fluid_box.pipe_connections[2].max_underground_distance =v.DyWorld.Entity.Pipe.Pipe_Range
	DyWorld_Prototype_Entity.fast_replaceable_group = "pipe"
	DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Pipe.Pipe_Next.."-pipe-to-ground"
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/pipe-to-ground.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "pipe-to-ground", v.DyWorld.Name.."-pipe-to-ground", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.pipe-to-ground-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.stack_size = 200
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/pipe-to-ground.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "pipe-to-ground", v.DyWorld.Name.."-pipe-to-ground", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {{type = "item", name = v.DyWorld.Name.."-pipe", amount = v.DyWorld.Entity.Pipe.Pipe_Range}}
	DyWorld_Prototype_Recipe.normal.results = {{type = "item", name = v.DyWorld.Name.."-pipe-to-ground", amount = 2}}
	DyWorld_Prototype_Recipe.expensive.ingredients = {{type = "item", name = v.DyWorld.Name.."-pipe", amount = v.DyWorld.Entity.Pipe.Pipe_Range}}
	DyWorld_Prototype_Recipe.expensive.results = {{type = "item", name = v.DyWorld.Name.."-pipe-to-ground", amount = 2}}
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.pipe-to-ground-1", {"looped-name."..v.DyWorld.Name}}
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
	
	if data.raw.technology["logistics-"..v.DyWorld.Tier] then
		DyWorld_Add_To_Tech("logistics-"..v.DyWorld.Tier, v.DyWorld.Name.."-pipe-to-ground")
	end
	
	if v.DyWorld.Entity.Pipe.Pipe_Underground_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Pipe.Pipe_Underground_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = a * 5}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-pipe-to-ground"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-pipe-to-ground"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Pipe.Pipe_Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Pipe.Pipe_Previous.."-pipe-to-ground", amount = 2}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-pipe-to-ground"].normal.ingredients, Ingredient)
	end
end
end