require "data/prefix"

	
for k,v in pairs(Material_Table) do
	if v.Type == "Basic" or v.Type == "Alloy" then
		data:extend(
		{
		  {
			type = "recipe",
			name = dy..v.Name.."-plate",
			category = dy.."forge",
			energy_required = 7.5,
			enabled = false,
			ingredients =
			{
			  {type = "fluid", name = dy.."molten-"..v.Name, amount = 100},
			},
			results=
			{
			  {type = "item", name = v.Name.."-plate", amount = 10},
			},
			subgroup = dy.."casting-recipes",
			order = v.Name.."-plate",
		  },
		})
		DyWorld_Add_To_Tech(dy.."ore-smelting", dy..v.Name.."-plate")
	end
end

data:extend(
{
  {
	type = "recipe",
	name = dy.."molten-rock-result-1",
	category = dy.."forge",
	energy_required = 7.5,
	enabled = false,
	ingredients =
	{
	  {type = "fluid", name = dy.."molten-rock", amount = 100, maximum_temperature = 1999},
	},
	results=
	{
	  {type = "item", name = "stone-brick", amount = 10},
	},
	subgroup = dy.."casting-recipes",
	order = "stone-brick",
  },
  {
	type = "recipe",
	name = dy.."molten-rock-result-2",
	category = dy.."forge",
	energy_required = 7.5,
	enabled = false,
	ingredients =
	{
	  {type = "fluid", name = dy.."molten-rock", amount = 100, minimum_temperature = 2000},
	},
	results=
	{
	  {type = "item", name = dy.."obsidian", amount = 10},
	},
	subgroup = dy.."casting-recipes",
	order = "obsidian",
  },
})

DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-rock-result-1")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-rock-result-2")