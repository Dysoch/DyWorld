require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Centrifuge then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("assembling-machine", "centrifuge", v.DyWorld.Name.."-centrifuge", true)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.centrifuge-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.max_health = 500 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.energy_source.emissions_per_minute = 2.5 * (v.DyWorld.Tier * (v.DyWorld.Tier * 0.75))
	DyWorld_Prototype_Entity.module_specification.module_slots = 2 + v.DyWorld.Tier
	DyWorld_Prototype_Entity.idle_animation.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.idle_animation.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.idle_animation.layers[3].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.idle_animation.layers[3].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.idle_animation.layers[5].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.idle_animation.layers[5].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.fluid_boxes = {
      {
        production_type = "input",
        picture = assembler3pipepictures(),
        covers = pipecoverspictures(),
        base_area = 2,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-2, 1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        picture = assembler3pipepictures(),
        covers = pipecoverspictures(),
        base_area = 2,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-2, -1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        picture = assembler3pipepictures(),
        covers = pipecoverspictures(),
        base_area = 20,
        base_level = 1,
        pipe_connections = {{ type="output", position = {2, -1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        picture = assembler3pipepictures(),
        covers = pipecoverspictures(),
        base_area = 20,
        base_level = 1,
        pipe_connections = {{ type="output", position = {2, 1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        picture = assembler3pipepictures(),
        covers = pipecoverspictures(),
        base_area = 20,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        picture = assembler3pipepictures(),
        covers = pipecoverspictures(),
        base_area = 20,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, -2} }},
        secondary_draw_orders = { north = -1 }
      },
      off_when_no_fluid_recipe = false
    }
	DyWorld_Prototype_Entity.fast_replaceable_group = "centrifuge"
	if v.DyWorld.Entity.Centrifuge.Next then
		DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Centrifuge.Next.."-centrifuge"
	end
	DyWorld_Prototype_Entity.crafting_speed = Round(((0.5 * (v.DyWorld.Tier * (v.DyWorld.Tier * 0.5))) * v.DyWorld.Entity.Centrifuge.Speed_Mod), 2)
	DyWorld_Prototype_Entity.energy_usage = (350 * v.DyWorld.Tier).."kW"
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/centrifuge.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "centrifuge", v.DyWorld.Name.."-centrifuge", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.centrifuge-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.stack_size = 200
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/centrifuge.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "centrifuge", v.DyWorld.Name.."-centrifuge", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-centrifuge"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-centrifuge"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.centrifuge-1", {"looped-name."..v.DyWorld.Name}}
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
	
	if data.raw.technology["automation-"..v.DyWorld.Tier] and v.DyWorld.Tier > 1 then
		DyWorld_Add_To_Tech("automation-"..v.DyWorld.Tier, v.DyWorld.Name.."-centrifuge")
	end
	if v.DyWorld.Entity.Centrifuge.Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Centrifuge.Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = Expensive_Check(a)}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-centrifuge"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-centrifuge"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Centrifuge.Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Centrifuge.Previous.."-centrifuge", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-centrifuge"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-centrifuge"].expensive.ingredients, Ingredient)
	end
end
end

data.raw["assembling-machine"]["centrifuge"].next_upgrade = "copper-centrifuge"