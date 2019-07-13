require "data/prefix"

	
for k,v in pairs(Material_Table) do
	if v.Molten then
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
	end
	if v.Type == "Basic" then
		data:extend(
		{
		  {
			type = "technology",
			name = dy..v.Name.."-advanced-melting",
			localised_name = {"looped-name.advanced-melting", {"looped-name."..v.Name}},
			icons = data.raw.fluid[dy.."molten-"..v.Name].icons,
			effects = {{type = "unlock-recipe", recipe = dy..v.Name.."-plate"}},
			prerequisites = {dy.."ore-smelting"},
			unit =
			{
			  count = math.floor(Materials[v.Table].Density * 10),
			  ingredients = {{"automation-science-pack", 1},{"logistic-science-pack", 1}},
			  time =  30
			},
			order = dy..v.Name.."-advanced-melting",
			upgrade = true,
		  },
		})
		DyWorld_Add_To_Tech(dy..v.Name.."-advanced-melting", dy.."molten-"..v.Name)
		DyWorld_Add_To_Tech(dy..v.Name.."-advanced-melting", dy.."molten-"..v.Name.."-pebble")
		table.insert(data.raw.technology[dy..v.Name.."-advanced-melting"].icons, Materials[v.Table].Icon_Tech)
	elseif v.Type == "Simple_Alloy" then
		data:extend(
		{
		  {
			type = "technology",
			name = dy..v.Name.."-advanced-melting",
			icons = data.raw.fluid[dy.."molten-"..v.Name].icons,
			localised_name = {"looped-name.advanced-mixing", {"looped-name."..v.Name}},
			effects = {{type = "unlock-recipe", recipe = dy..v.Name.."-plate"}},
			prerequisites = {dy.."ore-smelting-2"},
			unit =
			{
			  count = math.floor(Materials[v.Table].Density * 15),
			  ingredients = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack", 1}},
			  time =  30
			},
			order = dy..v.Name.."-advanced-melting",
			upgrade = true,
		  },
		})
		DyWorld_Add_To_Tech(dy..v.Name.."-advanced-melting", dy.."molten-"..v.Name)
		table.insert(data.raw.technology[dy..v.Name.."-advanced-melting"].icons, Materials[v.Table].Icon_Tech)
	elseif v.Type == "Alloy" then
		data:extend(
		{
		  {
			type = "technology",
			name = dy..v.Name.."-advanced-melting",
			icons = data.raw.fluid[dy.."molten-"..v.Name].icons,
			localised_name = {"looped-name.advanced-mixing", {"looped-name."..v.Name}},
			effects = {{type = "unlock-recipe", recipe = dy..v.Name.."-plate"}},
			prerequisites = {dy.."ore-smelting-3"},
			unit =
			{
			  count = math.floor(Materials[v.Table].Density * 25),
			  ingredients = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack", 1},{"production-science-pack", 1}},
			  time =  30
			},
			order = dy..v.Name.."-advanced-melting",
			upgrade = true,
		  },
		})
		DyWorld_Add_To_Tech(dy..v.Name.."-advanced-melting", dy.."molten-"..v.Name)
		table.insert(data.raw.technology[dy..v.Name.."-advanced-melting"].icons, Materials[v.Table].Icon_Tech)
	elseif v.Type == "Complex_Alloy" then
		data:extend(
		{
		  {
			type = "technology",
			name = dy..v.Name.."-advanced-melting",
			icons = data.raw.fluid[dy.."molten-"..v.Name].icons,
			localised_name = {"looped-name.advanced-mixing", {"looped-name."..v.Name}},
			effects = {{type = "unlock-recipe", recipe = dy..v.Name.."-plate"}},
			prerequisites = {dy.."ore-smelting-4"},
			unit =
			{
			  count = math.floor(Materials[v.Table].Density * 50),
			  ingredients = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack", 1},{"production-science-pack", 1},{"utility-science-pack", 1}},
			  time =  30
			},
			order = dy..v.Name.."-advanced-melting",
			upgrade = true,
		  },
		})
		DyWorld_Add_To_Tech(dy..v.Name.."-advanced-melting", dy.."molten-"..v.Name)
		table.insert(data.raw.technology[dy..v.Name.."-advanced-melting"].icons, Materials[v.Table].Icon_Tech)
	elseif v.Type == "Super_Alloy" then
		data:extend(
		{
		  {
			type = "technology",
			name = dy..v.Name.."-advanced-melting",
			icons = data.raw.fluid[dy.."molten-"..v.Name].icons,
			localised_name = {"looped-name.advanced-mixing", {"looped-name."..v.Name}},
			effects = {{type = "unlock-recipe", recipe = dy..v.Name.."-plate"}},
			prerequisites = {dy.."ore-smelting-5"},
			unit =
			{
			  count = math.floor(Materials[v.Table].Density * 250),
			  ingredients = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack", 1},{"production-science-pack", 1},{"utility-science-pack", 1},{dy.."extra-solar-science-pack", 1}},
			  time =  30
			},
			order = dy..v.Name.."-advanced-melting",
			upgrade = true,
		  },
		})
		DyWorld_Add_To_Tech(dy..v.Name.."-advanced-melting", dy.."molten-"..v.Name)
		table.insert(data.raw.technology[dy..v.Name.."-advanced-melting"].icons, Materials[v.Table].Icon_Tech)
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
  {
	type = "recipe",
	name = dy.."glass-advanced-melting",
	category = dy.."forge",
	energy_required = 7.5,
	enabled = false,
	ingredients =
	{
	  {type = "fluid", name = dy.."molten-glass", amount = 100},
	},
	results=
	{
	  {type = "item", name = dy.."glass", amount = 10},
	},
	subgroup = dy.."casting-recipes",
	order = "glass",
  },
  {
	type = "technology",
	name = dy.."glass-advanced-melting",
	localised_name = {"looped-name.advanced-melting", {"looped-name.glass"}},
	icon = data.raw.fluid[dy.."molten-glass"].icon,
	effects = 
	{
	  {type = "unlock-recipe", recipe = dy.."glass-advanced-melting"},
	  {type = "unlock-recipe", recipe = dy.."molten-glass"},
	},
	prerequisites = {dy.."ore-smelting"},
	unit =
	{
	  count = 75,
	  ingredients = {{"automation-science-pack", 1},{"logistic-science-pack", 1}},
	  time =  30
	},
	order = dy.."glass-advanced-melting",
	upgrade = true,
  },
})

DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-rock-result-1")
DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-rock-result-2")