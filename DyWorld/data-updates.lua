require "data/prefix"

function DyWorld_Fluid_Recycle(v)
data:extend(
{	
  {
    type = "recipe",
    name = dy.."recycle-fluid-"..v.name,
	icon = "__DyWorld__/graphics/delete.png",
    energy_required = 1,
	category = dy.."recycling",
	subgroup = dy.."zzz-void-recipes",
    enabled = true,
	hidden = true,
    ingredients =
    {
      {type = "fluid", name = v.name, amount = 50},
    },
    results = {{type = "fluid", name = dy.."sludge", amount = 25}},
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
    energy_required = 1,
	category = dy.."recycling",
	subgroup = dy.."zzz-void-recipes",
    enabled = true,
	hidden = true,
    ingredients =
    {
      {type = "item", name = v.name, amount = 1},
    },
    results = {{type = "fluid", name = dy.."sludge", amount = 25}},
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

for k,v in pairs(data.raw["mining-tool"]) do
	DyWorld_Item_Recycle(v)
end	

for k,v in pairs(data.raw["repair-tool"]) do
	DyWorld_Item_Recycle(v)
end	

for k,v in pairs(data.raw["rail-planner"]) do
	DyWorld_Item_Recycle(v)
end	

for k,v in pairs(data.raw.unit) do
	if not v.loot then
		v.loot = {}
	end
end

Loot_Table = {
	{
		Name = dy.."crystal",
		Chance = 0.02,
		Max_Count = 2,
	},
	{
		Name = dy.."crystai",
		Chance = 0.03,
		Max_Count = 4,
	},
	{
		Name = dy.."chitin",
		Chance = 0.10,
		Max_Count = 10,
	},
	{
		Name = dy.."obsidian",
		Chance = 0.05,
		Max_Count = 4,
	},
}

for k,v in pairs(Loot_Table) do
	for _,z in pairs(data.raw.unit) do	
		loottable = {
			item = v.Name,
			probability = v.Chance,
			count_min = 1,
			count_max = v.Max_Count,
		}
		table.insert(z.loot, loottable)
	end
end