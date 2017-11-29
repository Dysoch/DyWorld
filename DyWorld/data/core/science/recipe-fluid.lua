require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."science-fluid-1",
	icon = data.raw.fluid[dy.."science-fluid-1"].icon,
    category = "centrifuging",
    energy_required = 1.5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 50},
      {type = "item", name = dy.."filter-iron", amount = 1},
      {type = "item", name = dy.."filter-copper", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."science-fluid-1", amount = 10},
      {type = "item", name = dy.."filter-empty", amount = 2},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."science-fluid-1",
  },
  {
    type = "recipe",
    name = dy.."science-fluid-2",
	icon = data.raw.fluid[dy.."science-fluid-2"].icon,
    category = "centrifuging",
    energy_required = 1.5,
	enabled = true,
    ingredients =
    {
      {type = "fluid", name = dy.."oxygen", amount = 50},
      {type = "fluid", name = dy.."acid", amount = 5},
    },
    results=
    {
      {type = "fluid", name = dy.."science-fluid-2", amount = 10},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."science-fluid-2",
  },
  {
    type = "recipe",
    name = dy.."science-fluid-3",
	icon = data.raw.fluid[dy.."science-fluid-3"].icon,
    category = "centrifuging",
    energy_required = 1.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."sludge", amount = 250},
      {type = "item", name = "advanced-circuit", amount = 3},
    },
    results=
    {
      {type = "fluid", name = dy.."science-fluid-3", amount = 10},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."science-fluid-3",
  },
  {
    type = "recipe",
    name = dy.."science-fluid-4",
	icon = data.raw.fluid[dy.."science-fluid-4"].icon,
    category = "centrifuging",
    energy_required = 1.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."sewage", amount = 50},
      {type = "fluid", name = dy.."acid", amount = 25},
      {type = "fluid", name = dy.."methane", amount = 25},
    },
    results=
    {
      {type = "fluid", name = dy.."science-fluid-4", amount = 10},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."science-fluid-4",
  },
  {
    type = "recipe",
    name = dy.."science-fluid-5",
	icon = data.raw.fluid[dy.."science-fluid-5"].icon,
    category = "centrifuging",
    energy_required = 1.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."hydrogen", amount = 50},
      {type = "fluid", name = dy.."clean-oil", amount = 5},
    },
    results=
    {
      {type = "fluid", name = dy.."science-fluid-5", amount = 10},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."science-fluid-5",
  },
  {
    type = "recipe",
    name = dy.."science-fluid-6",
	icon = data.raw.fluid[dy.."science-fluid-6"].icon,
    category = "centrifuging",
    energy_required = 1.5,
	enabled = false,
    ingredients =
    {
      {type = "fluid", name = dy.."methane", amount = 35},
      {type = "fluid", name = dy.."water-clean", amount = 250},
      {type = "item", name = dy.."controller", amount = 1},
      {type = "item", name = "iron-gear-wheel", amount = 2},
      {type = "item", name = dy.."crystai", amount = 2},
      {type = "item", name = dy.."processing-logic", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."science-fluid-6", amount = 10},
    },
    subgroup = dy.."fluid-recipes",
    order = dy.."science-fluid-6",
  },
})

DyWorld_Add_To_Tech("advanced-electronics", dy.."science-fluid-3")
DyWorld_Add_To_Tech("military-2", dy.."science-fluid-4")
DyWorld_Add_To_Tech("advanced-material-processing-2", dy.."science-fluid-5")
DyWorld_Add_To_Tech("advanced-electronics-2", dy.."science-fluid-6")

if settings.startup["DyWorld_Metallurgy"].value then
	local result = {type = "fluid", name = dy.."molten-lead", amount = 5}
	table.insert(data.raw.recipe[dy.."science-fluid-3"].ingredients, result)
	local result = {type = "fluid", name = dy.."molten-billon", amount = 15}
	table.insert(data.raw.recipe[dy.."science-fluid-6"].ingredients, result)
	local result = {type = "fluid", name = dy.."molten-gold", amount = 5}
	table.insert(data.raw.recipe[dy.."science-fluid-6"].ingredients, result)
else	
	local result = {"sulfuric-acid", 75}
	table.insert(data.raw.recipe[dy.."science-fluid-6"].ingredients, result)
	local result = {dy.."acid", 25}
	table.insert(data.raw.recipe[dy.."science-fluid-3"].ingredients, result)
end

if settings.startup["DyWorld_Extraction"].value then
	local result = {type = "item", name = dy.."chromium-mining-tool", amount = 1}
	table.insert(data.raw.recipe[dy.."science-fluid-3"].ingredients, result)
else	
	local result = {"steel-axe", 1}
	table.insert(data.raw.recipe[dy.."science-fluid-3"].ingredients, result)
	
end

if settings.startup["DyWorld_Logistics"].value then
	local result = {type = "item", name = dy.."gold-stack-inserter", amount = 1}
	table.insert(data.raw.recipe[dy.."science-fluid-5"].ingredients, result)
	local result = {type = "item", name = dy.."steel-pump", amount = 1}
	table.insert(data.raw.recipe[dy.."science-fluid-5"].ingredients, result)
	local result = {type = "item", name = dy.."zinc-repair-tool", amount = 1}
	table.insert(data.raw.recipe[dy.."science-fluid-5"].ingredients, result)
	local result = {type = "item", name = dy.."tin-storage-tank", amount = 1}
	table.insert(data.raw.recipe[dy.."science-fluid-3"].ingredients, result)
	local result = {type = "item", name = dy.."stone-transport-belt", amount = 1}
	table.insert(data.raw.recipe[dy.."science-fluid-2"].ingredients, result)
else	
	local result = {"transport-belt", 1}
	table.insert(data.raw.recipe[dy.."science-fluid-2"].ingredients, result)
	local result = {"storage-tank", 1}
	table.insert(data.raw.recipe[dy.."science-fluid-3"].ingredients, result)
	local result = {"stack-inserter", 1}
	table.insert(data.raw.recipe[dy.."science-fluid-5"].ingredients, result)
	local result = {"pump", 1}
	table.insert(data.raw.recipe[dy.."science-fluid-5"].ingredients, result)
	local result = {"repair-pack", 1}
	table.insert(data.raw.recipe[dy.."science-fluid-5"].ingredients, result)
end

if settings.startup["DyWorld_Power"].value then
	local result = {type = "item", name = dy.."copper-power-pole", amount = 1}
	table.insert(data.raw.recipe[dy.."science-fluid-2"].ingredients, result)
else	
	local result = {"small-electric-pole", 1}
	table.insert(data.raw.recipe[dy.."science-fluid-2"].ingredients, result)
end

if settings.startup["DyWorld_Processing"].value then
	local result = {type = "item", name = dy.."chromium-assembling-electric", amount = 1}
	table.insert(data.raw.recipe[dy.."science-fluid-5"].ingredients, result)
else	
	local result = {"assembling-machine-3", 1}
	table.insert(data.raw.recipe[dy.."science-fluid-5"].ingredients, result)
end

if settings.startup["DyWorld_Warfare"].value then
	local result = {type = "item", name = dy.."copper-shotgun-turret", amount = 1}
	table.insert(data.raw.recipe[dy.."science-fluid-4"].ingredients, result)
	local result = {type = "item", name = dy.."lead-shotgun-ammo", amount = 1}
	table.insert(data.raw.recipe[dy.."science-fluid-4"].ingredients, result)
else	
	local result = {"gun-turret", 1}
	table.insert(data.raw.recipe[dy.."science-fluid-4"].ingredients, result)
	local result = {"piercing-rounds-magazine", 2}
	table.insert(data.raw.recipe[dy.."science-fluid-4"].ingredients, result)
end