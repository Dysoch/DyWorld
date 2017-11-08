require "data/prefix"

for k,v in pairs(data.raw.fluid) do
data:extend(
{	
  {
    type = "recipe",
    name = dy.."void-"..v.name,
	localised_name = {"looped-name.void", {"fluid-name."..v.name}},
	icons = {
	  {
		icon = "__DyWorld__/graphics/delete.png",
	  },
	  {
		icon = v.icon,
	  },
	},
    energy_required = 1,
	category = "crafting-with-fluid",
	subgroup = dy.."zzz-void-recipes",
    enabled = true,
    ingredients =
    {
      {type = "fluid", name = v.name, amount = 50},
    },
    results = {{type = "fluid", name = v.name, amount = 0}},
  },
}
)
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