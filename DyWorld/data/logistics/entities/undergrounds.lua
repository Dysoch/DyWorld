require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

--@todo change belt script to work with predefined data table
for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Belt then	
	local DyWorld_Prototype = DyWorld_CopyPrototype("underground-belt", "express-underground-belt", v.DyWorld.Name.."-underground-belt", true)
	DyWorld_Prototype.speed = Round((v.DyWorld.Entity.Belt_Speed / 426.67), 2)
	DyWorld_Prototype.localised_name = {"looped-name.belt-2", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype.next_upgrade = v.DyWorld.Entity.Belt_Next.."-underground-belt"
	DyWorld_Prototype.icon = nil
	DyWorld_Prototype.max_health = 150 * Metal_Tiers[v.DyWorld.Name]
	DyWorld_Prototype.max_distance = v.DyWorld.Entity.Belt_Range
	DyWorld_Prototype.icons = {
	  {
		icon = "__base__/graphics/icons/express-underground-belt.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}
	DyWorld_Prototype.belt_animation_set = DyWorld_express_belt_animation_set(Material_Colors[v.DyWorld.Name])
	DyWorld_Prototype.structure.direction_in.sheet.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype.structure.direction_in.sheet.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype.structure.direction_out.sheet.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype.structure.direction_out.sheet.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype.structure.direction_in_side_loading.sheet.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype.structure.direction_in_side_loading.sheet.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype.structure.direction_out_side_loading.sheet.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype.structure.direction_out_side_loading.sheet.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype.structure.back_patch.sheet.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype.structure.back_patch.sheet.hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype.structure.front_patch.sheet.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype.structure.front_patch.sheet.hr_version.tint = Material_Colors[v.DyWorld.Name]

	data:extend({DyWorld_Prototype})

	local DyWorld_Prototype = DyWorld_CopyPrototype("item", "express-underground-belt", v.DyWorld.Name.."-underground-belt", true)
	DyWorld_Prototype.localised_name = {"looped-name.belt-2", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype.icon = nil
	DyWorld_Prototype.icons = {
	  {
		icon = "__base__/graphics/icons/express-underground-belt.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	data:extend({DyWorld_Prototype})

	local DyWorld_Prototype = DyWorld_CopyPrototype("recipe", "express-underground-belt", v.DyWorld.Name.."-underground-belt", true)

	data:extend({DyWorld_Prototype})
end
end

data.raw["underground-belt"]["underground-belt"].next_upgrade = "iron-underground-belt"