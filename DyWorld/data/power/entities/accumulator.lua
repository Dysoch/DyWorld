require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

--TODO Add more Accumulators
--BODY @ZukiiG

--TODO Change Accumulator Graphics
for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Accumulator then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("accumulator", "accumulator", v.DyWorld.Name.."-accumulator", true)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.accumulator-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.max_health = 200 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.energy_source.buffer_capacity = ((v.DyWorld.Entity.Accumulator.Buffer_MJ * v.DyWorld.Tier) * 5).."MJ"
	DyWorld_Prototype_Entity.energy_source.input_flow_limit = (5000 * v.DyWorld.Tier).."kW"
	DyWorld_Prototype_Entity.energy_source.output_flow_limit = (5000 * v.DyWorld.Tier).."kW"
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.fast_replaceable_group = "accumulator"
	if v.DyWorld.Entity.Accumulator.Next then
		DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Accumulator.Next.."-accumulator"
	end
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/accumulator.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "accumulator", v.DyWorld.Name.."-accumulator", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.accumulator-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.stack_size = 50
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/accumulator.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "accumulator", v.DyWorld.Name.."-accumulator", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {{type = "item", name = "battery-pack", amount = math.ceil(v.DyWorld.Entity.Accumulator.Buffer_MJ)}}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-accumulator"
	DyWorld_Prototype_Recipe.expensive.ingredients = {{type = "item", name = "battery-pack", amount = math.ceil(v.DyWorld.Entity.Accumulator.Buffer_MJ*3)}}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-accumulator"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.accumulator-1", {"looped-name."..v.DyWorld.Name}}
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
	
	if data.raw.technology["solar-energy-"..v.DyWorld.Tier] then
		DyWorld_Add_To_Tech("solar-energy-"..v.DyWorld.Tier, v.DyWorld.Name.."-accumulator")
	end
	
	if v.DyWorld.Entity.Accumulator.Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Accumulator.Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = Expensive_Check(a)}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-accumulator"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-accumulator"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Accumulator.Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Accumulator.Previous.."-accumulator", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-accumulator"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-accumulator"].expensive.ingredients, Ingredient)
	end
end
end