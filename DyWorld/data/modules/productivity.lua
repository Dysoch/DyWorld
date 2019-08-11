require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Productivity_Module then	
	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("module", "productivity-module", v.DyWorld.Name.."-productivity-module", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.productivity-module-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.tier = v.DyWorld.Tier
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.effect = {
      productivity = {bonus = v.DyWorld.Entity.Productivity_Module.Productivity_Module_Productivity_Boost},
      consumption = {bonus = v.DyWorld.Entity.Productivity_Module.Productivity_Module_Consumption_Boost},
      pollution = {bonus = v.DyWorld.Entity.Productivity_Module.Productivity_Module_Pollution_Boost},
      speed = {bonus = v.DyWorld.Entity.Productivity_Module.Productivity_Module_Speed_Boost}
    }
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/productivity-module.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "productivity-module", v.DyWorld.Name.."-productivity-module", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-productivity-module"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-productivity-module"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.productivity-module-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Recipe.energy_required = 0
	DyWorld_Prototype_Recipe.normal.energy_required = (5 * v.DyWorld.Tier) * v.DyWorld.Tier
	DyWorld_Prototype_Recipe.expensive.energy_required = (5 * v.DyWorld.Tier) * v.DyWorld.Tier
	DyWorld_Prototype_Recipe.enabled = false
	DyWorld_Prototype_Recipe.normal.enabled = false
	DyWorld_Prototype_Recipe.expensive.enabled = false

	data:extend({DyWorld_Prototype_Item, DyWorld_Prototype_Recipe})
	
	if data.raw.technology["productivity-module-"..v.DyWorld.Tier] then
		DyWorld_Add_To_Tech("productivity-module-"..v.DyWorld.Tier, v.DyWorld.Name.."-productivity-module")
	end
	if v.DyWorld.Tier == 1 then
		if data.raw.technology["productivity-module"] then
			DyWorld_Add_To_Tech("productivity-module", v.DyWorld.Name.."-productivity-module")
		end
	end
	
	if v.DyWorld.Entity.Productivity_Module.Productivity_Module_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Productivity_Module.Productivity_Module_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = a * 5}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-productivity-module"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-productivity-module"].expensive.ingredients, Ingredient_2)
		end
	end
end
end