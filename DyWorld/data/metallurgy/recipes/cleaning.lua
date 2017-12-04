require "data/prefix"

for k,v in pairs(Material_Table) do
	if v.Type == "Basic" then
		data:extend(
		{
		  {
			type = "recipe",
			name = dy.."cleaning-"..v.Name,
			localised_name = {"looped-name.cleaning-ore", {"looped-name."..v.Name}},
			icons = 
			{
			  {
				icon = dyworld_path_icon.."base-ore.png",
				tint = Material_Colors[v.Table],
			  },
			},
			category = dy.."ore-cleaning",
			energy_required = 0.5,
			enabled = false,
			ingredients =
			{
			  {type = "item", name = v.Name.."-ore", amount = 1},
			  {type = "fluid", name = dy.."water-clean", amount = 5},
			},
			results = 
			{
			  {type = "item", name = v.Name.."-clean-ore", amount = 1},
			  {type = "item", name = v.Name.."-pebble", amount_min = 1, amount_max = 2, probability = 0.09},
			  {type = "fluid", name = dy.."sludge", amount = 5},
			},
			subgroup = dy.."cleaning-recipes",
			order = v.Name,
		  },
		})
		DyWorld_Add_To_Tech(dy..v.Name.."-advanced-melting", dy.."cleaning-"..v.Name)
	end
end

result = {type = "item", name = "tin-pebble", amount_min = 1, amount_max = 3, probability = 0.098}
table.insert(data.raw.recipe[dy.."cleaning-iron"].results, result)
table.insert(data.raw.recipe[dy.."cleaning-lead"].results, result)

result = {type = "item", name = "iron-pebble", amount_min = 1, amount_max = 3, probability = 0.078}
table.insert(data.raw.recipe[dy.."cleaning-tungsten"].results, result)
table.insert(data.raw.recipe[dy.."cleaning-lead"].results, result)

result = {type = "item", name = "copper-pebble", amount_min = 1, amount_max = 3, probability = 0.067}
table.insert(data.raw.recipe[dy.."cleaning-gold"].results, result)
table.insert(data.raw.recipe[dy.."cleaning-zinc"].results, result)
table.insert(data.raw.recipe[dy.."cleaning-nickel"].results, result)

result = {type = "item", name = "gold-pebble", amount_min = 1, amount_max = 2, probability = 0.067}
table.insert(data.raw.recipe[dy.."cleaning-copper"].results, result)
table.insert(data.raw.recipe[dy.."cleaning-zinc"].results, result)
table.insert(data.raw.recipe[dy.."cleaning-nickel"].results, result)