require "data/prefix"

function DyWorld_Module_Speed_Item(Level)
  local result =
  {
    type = "module",
    name = dyworld_prefix.."module-speed-"..Level,
	icons =
	{
	  {
		icon = "__base__/graphics/icons/speed-module.png",
		tint = Color_Tier[Level]
	  }
	},
    flags = {"goes-to-main-inventory"},
    subgroup = dyworld_prefix.."module-speed",
    category = "speed",
    tier = Level,
    order = (100+Level),
    stack_size = 50,
    default_request_amount = 10,
    effect = { speed = {bonus = ((Level*1.5)/10)}, consumption = {bonus = (0.2+(Level/5))}}
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
    },
    energy_required = (10+(Level*5)),
    result = dyworld_prefix.."module-speed-"..Level,
  }
  if Level == 1 then
	result.ingredients = {{"advanced-circuit", 5}, {"electronic-circuit", 5}}
  elseif Level == 4 or Level == 5 then
	result.ingredients = {{dyworld_prefix.."module-speed-"..(Level-1), 1},{"advanced-circuit", (5*Level)}, {"processing-unit", (4*(Level-3))}}
  elseif Level == 6 or Level == 7 or Level == 8 then
	result.ingredients = {{dyworld_prefix.."module-speed-"..(Level-1), 1},{"processing-unit", (5*Level)}, {dyworld_prefix.."processing-advanced", (4*(Level-3))}}
  elseif Level == 9 or Level == 10 then
	result.ingredients = {{dyworld_prefix.."module-speed-"..(Level-1), 1},{dyworld_prefix.."processing-advanced", (5*Level)}, {dyworld_prefix.."processing-logic", (4*(Level-3))}}
  end
  return result
end

for i=1,9 do
 data:extend(
{
  DyWorld_Module_Speed_Item(i),
  DyWorld_Module_Speed_Recipe(i),
})
end