require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Tile then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("tile", "concrete", v.DyWorld.Name.."-concrete", true)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.tile-metal", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.minable.result = v.DyWorld.Name.."-plate"
	
	DyWorld_Prototype_Entity.decorative_removal_probability = 1
	
	DyWorld_Prototype_Entity.tint = Material_Colors[v.DyWorld.Name] 
	DyWorld_Prototype_Entity.map_color = Material_Colors[v.DyWorld.Name] 
	
	data:extend({DyWorld_Prototype_Entity})
	
	data.raw.item[v.DyWorld.Name.."-plate"]. place_as_tile = {
      result = v.DyWorld.Name.."-concrete",
      condition_size = 1,
      condition = { "water-tile" }
    }
	
end
end