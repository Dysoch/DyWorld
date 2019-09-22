require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Robot then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("logistic-robot", "logistic-robot", v.DyWorld.Name.."-logistic-robot", true)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.logistic-robot-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.max_health = 100 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.idle.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.idle.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.in_motion.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.in_motion.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.in_motion_with_cargo.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.in_motion_with_cargo.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.idle_with_cargo.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.idle_with_cargo.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.max_payload_size = v.DyWorld.Tier
	DyWorld_Prototype_Entity.speed = v.DyWorld.Entity.Robot.Speed
	DyWorld_Prototype_Entity.max_energy = v.DyWorld.Entity.Robot.Energy_Max_MJ.."MJ"
	DyWorld_Prototype_Entity.energy_per_tick = v.DyWorld.Entity.Robot.Energy_Tick_KJ.."kJ"
	DyWorld_Prototype_Entity.energy_per_move = v.DyWorld.Entity.Robot.Energy_Move_KJ.."kJ"
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/logistic-robot.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "logistic-robot", v.DyWorld.Name.."-logistic-robot", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.logistic-robot-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.stack_size = 200
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/logistic-robot.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "logistic-robot", v.DyWorld.Name.."-logistic-robot", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-logistic-robot"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-logistic-robot"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.logistic-robot-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Recipe.energy_required = 0
	DyWorld_Prototype_Recipe.normal.energy_required = (2 * v.DyWorld.Tier) * v.DyWorld.Tier
	DyWorld_Prototype_Recipe.expensive.energy_required = (2 * v.DyWorld.Tier) * v.DyWorld.Tier
	DyWorld_Prototype_Recipe.enabled = false
	DyWorld_Prototype_Recipe.normal.enabled = false
	DyWorld_Prototype_Recipe.expensive.enabled = false

	data:extend({DyWorld_Prototype_Entity, DyWorld_Prototype_Item, DyWorld_Prototype_Recipe})
	
	if data.raw.technology["logistic-robotics"] and v.DyWorld.Tier == 1 then 
		DyWorld_Add_To_Tech("logistic-robotics", v.DyWorld.Name.."-logistic-robot")
	elseif data.raw.technology["logistic-robotics-"..v.DyWorld.Tier] and v.DyWorld.Tier >= 2 then
		DyWorld_Add_To_Tech("logistic-robotics-"..v.DyWorld.Tier, v.DyWorld.Name.."-logistic-robot")
	end
	
	if v.DyWorld.Entity.Robot.Logistic_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Robot.Logistic_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = Expensive_Check(a)}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-logistic-robot"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-logistic-robot"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Robot.Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Robot.Previous.."-logistic-robot", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-logistic-robot"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-logistic-robot"].expensive.ingredients, Ingredient)
	end
end
end