require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

data.raw["solar-panel"]["solar-panel"].fast_replaceable_group = "solar"

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Solar then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("solar-panel", "solar-panel", v.DyWorld.Name.."-solar-panel", true)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.solar-panel-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.max_health = 100 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.picture.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.picture.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.resistances = v.DyWorld.Resistances
	DyWorld_Prototype_Entity.hide_resistances = settings.startup["DyWorld_Hide_Resistances"].value
	DyWorld_Prototype_Entity.fast_replaceable_group = "solar"
	if v.DyWorld.Entity.Solar.Next then
		DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Solar.Next.."-solar-panel"
	end
	DyWorld_Prototype_Entity.production = (v.DyWorld.Entity.Solar.Production * 5).."kW"
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/solar-panel.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "solar-panel", v.DyWorld.Name.."-solar-panel", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.solar-panel-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.stack_size = 50
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/solar-panel.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "solar-panel", v.DyWorld.Name.."-solar-panel", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {{type = "item", name = "solar-cell", amount = math.ceil(v.DyWorld.Entity.Solar.Production / 100)}}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-solar-panel"
	DyWorld_Prototype_Recipe.expensive.ingredients = {{type = "item", name = "solar-cell", amount = math.ceil(v.DyWorld.Entity.Solar.Production / 100)}}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-solar-panel"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.solar-panel-1", {"looped-name."..v.DyWorld.Name}}
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
	
	if data.raw.technology["solar-energy-"..(v.DyWorld.Tier - 1)] then
		DyWorld_Add_To_Tech("solar-energy-"..(v.DyWorld.Tier - 1), v.DyWorld.Name.."-solar-panel")
	end
	if data.raw.technology["solar-energy"] and v.DyWorld.Tier <= 2 then
		DyWorld_Add_To_Tech("solar-energy", v.DyWorld.Name.."-solar-panel")
	end
	
	if v.DyWorld.Entity.Solar.Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Solar.Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = Expensive_Check(a)}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-solar-panel"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-solar-panel"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Solar.Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Solar.Previous.."-solar-panel", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-solar-panel"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-solar-panel"].expensive.ingredients, Ingredient)
	end
end
end