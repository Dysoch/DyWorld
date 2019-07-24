require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

--@todo change belt script to work with predefined data table
for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Belt then	
	local DyWorld_Prototype = DyWorld_CopyPrototype("splitter", "express-splitter", v.DyWorld.Name.."-splitter", true)
	DyWorld_Prototype.speed = Round((v.DyWorld.Entity.Belt_Speed / 426.67), 2)
	DyWorld_Prototype.localised_name = {"looped-name.belt-3", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype.next_upgrade = v.DyWorld.Entity.Belt_Next.."-splitter"
	DyWorld_Prototype.structure.north.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype.structure.north.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype.structure.east.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype.structure.east.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype.structure.south.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype.structure.south.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype.structure.west.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype.structure.west.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype.max_health = 170 * Metal_Tiers[v.DyWorld.Name]
	DyWorld_Prototype.icon = nil
	DyWorld_Prototype.icons = {
	  {
		icon = "__base__/graphics/icons/express-splitter.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}
	DyWorld_Prototype.belt_animation_set = DyWorld_express_belt_animation_set(Material_Colors[v.DyWorld.Name])

	data:extend({DyWorld_Prototype})

	local DyWorld_Prototype = DyWorld_CopyPrototype("item", "express-splitter", v.DyWorld.Name.."-splitter", true)
	DyWorld_Prototype.localised_name = {"looped-name.belt-2", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype.icon = nil
	DyWorld_Prototype.icons = {
	  {
		icon = "__base__/graphics/icons/express-splitter.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	data:extend({DyWorld_Prototype})

	local DyWorld_Prototype = DyWorld_CopyPrototype("recipe", "express-splitter", v.DyWorld.Name.."-splitter", true)

	data:extend({DyWorld_Prototype})
end
end

data.raw["splitter"]["splitter"].next_upgrade = "iron-splitter"