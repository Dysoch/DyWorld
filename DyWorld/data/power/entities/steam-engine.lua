require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Steam_Engine then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("generator", "steam-engine", v.DyWorld.Name.."-steam-engine", true)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.steam-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.max_health = 250 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.horizontal_animation.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.horizontal_animation.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.vertical_animation.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.vertical_animation.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.fast_replaceable_group = "steam"
	DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Steam_Engine_Next.."-steam-engine"
	DyWorld_Prototype_Entity.fluid_usage_per_tick = v.DyWorld.Entity.Steam_Engine_Fluid_Usage
	DyWorld_Prototype_Entity.effectivity = v.DyWorld.Entity.Steam_Engine_Effectivity
	DyWorld_Prototype_Entity.maximum_temperature = v.DyWorld.Entity.Steam_Engine_Maximum_Temperature
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/steam-engine.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "steam-engine", v.DyWorld.Name.."-steam-engine", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.steam-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/steam-engine.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "steam-engine", v.DyWorld.Name.."-steam-engine", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-steam-engine"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-steam-engine"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.steam-1", {"looped-name."..v.DyWorld.Name}}
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
	
	if data.raw.technology["steam-energy-"..v.DyWorld.Tier] and v.DyWorld.Tier > 1 then
		DyWorld_Add_To_Tech("steam-energy-"..v.DyWorld.Tier, v.DyWorld.Name.."-steam-engine")
	end
	
	if v.DyWorld.Entity.Steam_Engine_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Steam_Engine_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = a * 5}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-steam-engine"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-steam-engine"].expensive.ingredients, Ingredient_2)
		end
	end
end
end