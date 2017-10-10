require "data/prefix"

function DyWorld_Module_Productivity_Item(Level)
  local result =
  {
    type = "module",
    name = dyworld_prefix.."module-productivity-"..Level,
	icons =
	{
	  {
		icon = "__base__/graphics/icons/productivity-module.png",
		tint = Color_Tier[Level]
	  }
	},
    flags = {"goes-to-main-inventory"},
    subgroup = dyworld_prefix.."module-productivity",
    category = "productivity",
    tier = Level,
    order = (100+Level),
    stack_size = 50,
    default_request_amount = 10,
    effect = 
    {
      productivity = {bonus = 0.05},
      consumption = {bonus = (0.25+(Level*0.25))},
      pollution = {bonus = (0.05*(Level+(Level/25)))},
      speed = {bonus = -0.25}
    },
    limitation = productivitymodulelimitation(),
    limitation_message_key = "production-module-usable-only-on-intermediates"
  }
  if Level == 2 then
	result.effect.productivity = {bonus = 0.09}
  elseif Level == 3 then
	result.effect.productivity = {bonus = 0.14}
  elseif Level == 4 then
	result.effect.productivity = {bonus = 0.20}
  elseif Level == 5 then
	result.effect.productivity = {bonus = 0.26}
  elseif Level == 6 then
	result.effect.productivity = {bonus = 0.35}
  elseif Level == 7 then
	result.effect.productivity = {bonus = 0.46}
  elseif Level == 8 then
	result.effect.productivity = {bonus = 0.57}
  elseif Level == 9 then
	result.effect.productivity = {bonus = 0.69}
  elseif Level == 10 then
	result.effect.productivity = {bonus = 0.80}
  end
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
      {"advanced-circuit", (5*Level)},
    },
    energy_required = (10+(Level*5)),
    result = dyworld_prefix.."module-productivity-"..Level,
  }
  if Level == 1 then
	result.ingredients = {{"advanced-circuit", 5}, {"electronic-circuit", 5}}
  elseif Level == 4 or Level == 5 then
	result.ingredients = {{dyworld_prefix.."module-productivity-"..(Level-1), 1},{"advanced-circuit", (5*Level)}, {"processing-unit", (4*(Level-3))}}
  elseif Level == 6 or Level == 7 or Level == 8 then
	result.ingredients = {{dyworld_prefix.."module-productivity-"..(Level-1), 1},{"processing-unit", (5*Level)}, {dyworld_prefix.."processing-advanced", (4*(Level-3))}}
  elseif Level == 9 or Level == 10 then
	result.ingredients = {{dyworld_prefix.."module-productivity-"..(Level-1), 1},{dyworld_prefix.."processing-advanced", (5*Level)}, {dyworld_prefix.."processing-logic", (4*(Level-3))}}
  end
  return result
end

for i=1,9 do
 data:extend(
{
  DyWorld_Module_Productivity_Item(i),
  DyWorld_Module_Productivity_Recipe(i),
})
end