require "data/prefix"

function DyWorld_Module_Speed_Item(Level)
  local result =
  {
    type = "module",
    name = dyworld_prefix.."module-speed-"..Level,
    icon = "__base__/graphics/icons/speed-module.png",
    flags = {"goes-to-main-inventory"},
    subgroup = dyworld_prefix.."module-speed",
    category = "speed",
    tier = Level,
    order = (100+Level),
    stack_size = 50,
    default_request_amount = 10,
    effect = { speed = {bonus = (Level/10)}, consumption = {bonus = (0.2+(Level/10))}}
  }
  return result
end

function DyWorld_Module_Speed_Recipe(Level)
  local result =
  {
    type = "recipe",
    name = dyworld_prefix.."module-speed-"..Level,
    enabled = true,
    ingredients =
    {
      {dyworld_prefix.."module-speed-"..(Level-1), 1},
      {"advanced-circuit", (5*Level)},
      {"processing-unit", (5*Level)}
    },
    energy_required = (10+(Level*5)),
    result = dyworld_prefix.."module-speed-"..Level,
  }
  if Level == 1 then
	result.ingredients = {{"advanced-circuit", 5}, {"electronic-circuit", 5}}
  end
  return result
end

function DyWorld_Module_Productivity_Item(Level)
  local result =
  {
    type = "module",
    name = dyworld_prefix.."module-productivity-"..Level,
    icon = "__base__/graphics/icons/productivity-module.png",
    flags = {"goes-to-main-inventory"},
    subgroup = dyworld_prefix.."module-productivity",
    category = "productivity",
    tier = Level,
    order = (100+Level),
    stack_size = 50,
    default_request_amount = 10,
    effect = 
    {
      productivity = {bonus = (0.04*Level)},
      consumption = {bonus = (0.2*Level)},
      pollution = {bonus = (0.05*Level)},
      speed = {bonus = (-0.1*Level)}
    },
    limitation = productivitymodulelimitation(),
    limitation_message_key = "production-module-usable-only-on-intermediates"
  }
  return result
end

function DyWorld_Module_Productivity_Recipe(Level)
  local result =
  {
    type = "recipe",
    name = dyworld_prefix.."module-productivity-"..Level,
    enabled = true,
    ingredients =
    {
      {dyworld_prefix.."module-productivity-"..(Level-1), 1},
      {"advanced-circuit", (8*Level)},
      {"processing-unit", (8*Level)}
    },
    energy_required = (10+(Level*5)),
    result = dyworld_prefix.."module-productivity-"..Level,
  }
  if Level == 1 then
	result.ingredients = {{"advanced-circuit", 5}, {"electronic-circuit", 5}}
  end
  return result
end

function DyWorld_Module_Effectivity_Item(Level)
  local result =
  {
    type = "module",
    name = dyworld_prefix.."module-effectivity-"..Level,
    icon = "__base__/graphics/icons/effectivity-module.png",
    flags = {"goes-to-main-inventory"},
    subgroup = dyworld_prefix.."module-effectivity",
    category = "effectivity",
    tier = Level,
    order = (100+Level),
    stack_size = 50,
    default_request_amount = 10,
    effect = { consumption = {bonus = (-0.3*Level)}},
    limitation = production
  }
  return result
end

function DyWorld_Module_Effectivity_Recipe(Level)
  local result =
  {
    type = "recipe",
    name = dyworld_prefix.."module-effectivity-"..Level,
    enabled = true,
    ingredients =
    {
      {dyworld_prefix.."module-effectivity-"..(Level-1), 1},
      {"advanced-circuit", (4*Level)},
      {"processing-unit", (4*Level)}
    },
    energy_required = (10+(Level*5)),
    result = dyworld_prefix.."module-effectivity-"..Level,
  }
  if Level == 1 then
	result.ingredients = {{"advanced-circuit", 5}, {"electronic-circuit", 5}}
  end
  return result
end

for i=1,25 do
 data:extend(
{
  DyWorld_Module_Speed_Item(i),
  DyWorld_Module_Speed_Recipe(i),
  DyWorld_Module_Productivity_Item(i),
  DyWorld_Module_Productivity_Recipe(i),
  DyWorld_Module_Effectivity_Item(i),
  DyWorld_Module_Effectivity_Recipe(i),
})
end