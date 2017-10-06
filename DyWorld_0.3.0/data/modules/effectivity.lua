require "data/prefix"

function DyWorld_Module_Effectivity_Item(Level)
  local result =
  {
    type = "module",
    name = dyworld_prefix.."module-effectivity-"..Level,
	icons =
	{
	  {
		icon = "__base__/graphics/icons/effectivity-module.png",
		tint = Color_Tier[Level]
	  }
	},
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
      {"advanced-circuit", (5*Level)},
    },
    energy_required = (10+(Level*5)),
    result = dyworld_prefix.."module-effectivity-"..Level,
  }
  if Level == 1 then
	result.ingredients = {{"advanced-circuit", 5}, {"electronic-circuit", 5}}
  end
  return result
end

for i=1,9 do
 data:extend(
{
  DyWorld_Module_Effectivity_Item(i),
  DyWorld_Module_Effectivity_Recipe(i),
})
end