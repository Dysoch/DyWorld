require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Radar then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("radar", "radar", v.DyWorld.Name.."-radar", true)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.radar-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.localised_description = {"looped-name.radar-2", v.DyWorld.Entity.Radar.Scan_Range, v.DyWorld.Entity.Radar.Active_Range}
	DyWorld_Prototype_Entity.max_health = 250 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.max_distance_of_sector_revealed = v.DyWorld.Entity.Radar.Scan_Range
	DyWorld_Prototype_Entity.max_distance_of_nearby_sector_revealed = v.DyWorld.Entity.Radar.Active_Range
	DyWorld_Prototype_Entity.pictures.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.pictures.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.energy_usage = (50 + (50 * v.DyWorld.Entity.Radar.Active_Range) + (v.DyWorld.Entity.Radar.Scan_Range * 10)).."kW"
	DyWorld_Prototype_Entity.fast_replaceable_group = "radar"
	DyWorld_Prototype_Entity.resistances = v.DyWorld.Resistances
	DyWorld_Prototype_Entity.hide_resistances = settings.startup["DyWorld_Hide_Resistances"].value
	if v.DyWorld.Entity.Radar.Next then
		DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Radar.Next.."-radar"
	end
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/radar.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "radar", v.DyWorld.Name.."-radar", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.radar-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.localised_description = {"looped-name.radar-2", v.DyWorld.Entity.Radar.Scan_Range, v.DyWorld.Entity.Radar.Active_Range}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.stack_size = 50
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/radar.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "radar", v.DyWorld.Name.."-radar", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-radar"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-radar"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.radar-1", {"looped-name."..v.DyWorld.Name}}
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
	
	if data.raw.technology["defensive-structures-"..v.DyWorld.Tier] and v.DyWorld.Tier >= 2 then
		DyWorld_Add_To_Tech("defensive-structures-"..v.DyWorld.Tier, v.DyWorld.Name.."-radar")
	end
	
	if v.DyWorld.Entity.Radar.Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Radar.Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = Expensive_Check(a)}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-radar"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-radar"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Radar.Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Radar.Previous.."-radar", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-radar"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-radar"].expensive.ingredients, Ingredient)
	end
end
end