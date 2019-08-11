require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

--TODO Add more Nuclear Reactors
--BODY @ZukiiG
for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Nuclear_Reactor then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("reactor", "nuclear-reactor", v.DyWorld.Name.."-nuclear-reactor", true)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.nuclear-reactor-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.max_health = 200 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.picture.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.picture.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.heat_buffer.max_temperature = v.DyWorld.Entity.Nuclear_Reactor.Nuclear_Reactor_Max_Temperature
	DyWorld_Prototype_Entity.heat_buffer.specific_heat = v.DyWorld.Entity.Nuclear_Reactor.Nuclear_Reactor_Specific_Heat_MJ.."MJ"
	DyWorld_Prototype_Entity.heat_buffer.max_transfer = v.DyWorld.Entity.Nuclear_Reactor.Nuclear_Reactor_Max_Transfer_GW.."GW"
	DyWorld_Prototype_Entity.consumption = v.DyWorld.Entity.Nuclear_Reactor.Nuclear_Reactor_Consumption_MW.."MW"
	DyWorld_Prototype_Entity.neighbour_bonus = v.DyWorld.Entity.Nuclear_Reactor.Nuclear_Reactor_Neighbour_Bonus
	DyWorld_Prototype_Entity.energy_source.effectivity = v.DyWorld.Entity.Nuclear_Reactor.Nuclear_Reactor_Effectivity
	DyWorld_Prototype_Entity.fast_replaceable_group = "nuclear-reactor"
	DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Nuclear_Reactor.Nuclear_Reactor_Next.."-nuclear-reactor"
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/nuclear-reactor.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "nuclear-reactor", v.DyWorld.Name.."-nuclear-reactor", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.nuclear-reactor-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/nuclear-reactor.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "nuclear-reactor", v.DyWorld.Name.."-nuclear-reactor", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-nuclear-reactor"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-nuclear-reactor"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.nuclear-reactor-1", {"looped-name."..v.DyWorld.Name}}
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
	
	if data.raw.technology["nuclear-energy-"..v.DyWorld.Tier] and v.DyWorld.Tier >= 2 then
		DyWorld_Add_To_Tech("nuclear-energy-"..v.DyWorld.Tier, v.DyWorld.Name.."-nuclear-reactor")
	end
	
	if v.DyWorld.Entity.Nuclear_Reactor.Nuclear_Reactor_Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Nuclear_Reactor.Nuclear_Reactor_Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = a * 5}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-nuclear-reactor"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-nuclear-reactor"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Nuclear_Reactor.Nuclear_Reactor_Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Nuclear_Reactor.Nuclear_Reactor_Previous.."-nuclear-reactor", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-nuclear-reactor"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-nuclear-reactor"].expensive.ingredients, Ingredient)
	end
end
end