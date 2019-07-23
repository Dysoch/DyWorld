require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

--@todo change belt script to work with predefined data table
for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Belt then	
	local DyWorld_Prototype = DyWorld_CopyPrototype("transport-belt", "express-transport-belt", v.DyWorld.Name.."-transport-belt", true)
	DyWorld_Prototype.speed = Round((v.DyWorld.Entity.Belt_Speed / 426.67), 2)
	DyWorld_Prototype.localised_name = {"looped-name.belt-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype.next_upgrade = v.DyWorld.Entity.Belt_Next.."-transport-belt"
	DyWorld_Prototype.icon = nil
	DyWorld_Prototype.icons = {
	  {
		icon = "__base__/graphics/icons/express-transport-belt.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}
	DyWorld_Prototype.belt_animation_set = DyWorld_express_belt_animation_set(Material_Colors[v.DyWorld.Name])

	data:extend({DyWorld_Prototype})

	local DyWorld_Prototype = DyWorld_CopyPrototype("item", "express-transport-belt", v.DyWorld.Name.."-transport-belt", true)
	DyWorld_Prototype.localised_name = {"looped-name.belt-1", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype.icon = nil
	DyWorld_Prototype.icons = {
	  {
		icon = "__base__/graphics/icons/express-transport-belt.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	data:extend({DyWorld_Prototype})

	local DyWorld_Prototype = DyWorld_CopyPrototype("recipe", "express-transport-belt", v.DyWorld.Name.."-transport-belt", true)

	data:extend({DyWorld_Prototype})
end
end

data.raw["transport-belt"]["transport-belt"].next_upgrade = "iron-transport-belt"