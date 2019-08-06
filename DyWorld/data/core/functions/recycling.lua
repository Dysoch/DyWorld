require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

function DyWorld_Fluid_Recycle(v)
data:extend(
{	
  {
    type = "recipe",
    name = dy.."recycle-fluid-"..v.name,
	icon = "__DyWorld__/graphics/delete.png",
	icon_size = 32,
	category = dy.."recycling",
	subgroup = dy.."recycler-recipes",
    enabled = true,
	hidden = true,
    ingredients =
    {
      {type = "fluid", name = v.name, amount = 50},
    },
    results = {
      {type = "fluid", name = "water", amount = 0},
    },
  },
})
end

function DyWorld_Item_Recycle(v)
data:extend(
{	
  {
    type = "recipe",
    name = dy.."recycle-item-"..v.name,
	icon = "__DyWorld__/graphics/delete.png",
	icon_size = 32,
	category = dy.."recycling",
	subgroup = dy.."recycler-recipes",
    enabled = true,
	hidden = true,
    ingredients = {
      {type = "item", name = v.name, amount = 1},
    },
    results = {
      {type = "fluid", name = "water", amount = 0},
    },
  },
})
end

for k,v in pairs(data.raw.fluid) do
	DyWorld_Fluid_Recycle(v)
end	

for k,v in pairs(data.raw.item) do
	DyWorld_Item_Recycle(v)
end	

for k,v in pairs(data.raw.module) do
	DyWorld_Item_Recycle(v)
end	

for k,v in pairs(data.raw.ammo) do
	DyWorld_Item_Recycle(v)
end	

for k,v in pairs(data.raw.capsule) do
	DyWorld_Item_Recycle(v)
end	

for k,v in pairs(data.raw.tool) do
	DyWorld_Item_Recycle(v)
end	

for k,v in pairs(data.raw.gun) do
	DyWorld_Item_Recycle(v)
end	

for k,v in pairs(data.raw.armor) do
	DyWorld_Item_Recycle(v)
end		

for k,v in pairs(data.raw["repair-tool"]) do
	DyWorld_Item_Recycle(v)
end	

for k,v in pairs(data.raw["rail-planner"]) do
	DyWorld_Item_Recycle(v)
end	