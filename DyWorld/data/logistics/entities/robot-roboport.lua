require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

--TODO Add more Roboports
--BODY @ZukiiG
for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Robot then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("roboport", "roboport", v.DyWorld.Name.."-roboport", true)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.roboport-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.max_health = 1000 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.fast_replaceable_group = "roboport"
	DyWorld_Prototype_Entity.base.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.base.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.base_patch.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.base_patch.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.base_animation.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.base_animation.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.energy_usage = v.DyWorld.Entity.Robot.Roboport_Energy_Usage_KW.."kW"
	DyWorld_Prototype_Entity.charging_energy = v.DyWorld.Entity.Robot.Roboport_Charging_Energy_KW.."kW"
	DyWorld_Prototype_Entity.energy_source.input_flow_limit = v.DyWorld.Entity.Robot.Roboport_Input_MW.."MW"
	DyWorld_Prototype_Entity.energy_source.buffer_capacity = v.DyWorld.Entity.Robot.Roboport_Buffer_MJ.."MJ"
	DyWorld_Prototype_Entity.recharge_minimum = Round((v.DyWorld.Entity.Robot.Roboport_Buffer_MJ * 0.4), 0).."MJ"
	DyWorld_Prototype_Entity.logistics_radius = v.DyWorld.Entity.Robot.Roboport_Range_Logistic
	DyWorld_Prototype_Entity.construction_radius = v.DyWorld.Entity.Robot.Roboport_Range_Construction
	DyWorld_Prototype_Entity.robot_slots_count = v.DyWorld.Entity.Robot.Roboport_Slot_Count
	DyWorld_Prototype_Entity.material_slots_count = v.DyWorld.Entity.Robot.Roboport_Slot_Count
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/roboport.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "roboport", v.DyWorld.Name.."-roboport", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.roboport-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.stack_size = 200
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/roboport.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "roboport", v.DyWorld.Name.."-roboport", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-roboport"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-roboport"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.roboport-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Recipe.energy_required = 0
	DyWorld_Prototype_Recipe.normal.energy_required = (2 * v.DyWorld.Tier) * v.DyWorld.Tier
	DyWorld_Prototype_Recipe.expensive.energy_required = (2 * v.DyWorld.Tier) * v.DyWorld.Tier
	DyWorld_Prototype_Recipe.enabled = false
	DyWorld_Prototype_Recipe.normal.enabled = false
	DyWorld_Prototype_Recipe.expensive.enabled = false

	data:extend({DyWorld_Prototype_Entity, DyWorld_Prototype_Item, DyWorld_Prototype_Recipe})
	
	if data.raw.technology["logistic-robotics"] and v.DyWorld.Tier == 1 then 
		DyWorld_Add_To_Tech("logistic-robotics", v.DyWorld.Name.."-roboport")
		DyWorld_Add_To_Tech("construction-robotics", v.DyWorld.Name.."-roboport")
	elseif data.raw.technology["logistic-robotics-"..v.DyWorld.Tier] and v.DyWorld.Tier >= 2 then
		DyWorld_Add_To_Tech("logistic-robotics-"..v.DyWorld.Tier, v.DyWorld.Name.."-roboport")
		DyWorld_Add_To_Tech("construction-robotics-"..v.DyWorld.Tier, v.DyWorld.Name.."-roboport")
	end
	
	if v.DyWorld.Entity.Robot.Roboport_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Robot.Roboport_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = Expensive_Check(a)}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-roboport"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-roboport"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Robot.Robot_Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Robot.Robot_Previous.."-roboport", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-roboport"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-roboport"].expensive.ingredients, Ingredient)
	end
end
end