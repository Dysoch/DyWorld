require "data/prefix"

function DyWorld_Recipe(DATA)
  local result =
  {
    type = "recipe",
    name = dyworld_prefix..DATA.Name,
    energy_required = DATA.Recipe_Craft_Time,
	enabled = DATA.Recipe_Without_Tech,
    ingredients = {},
    result = dyworld_prefix..DATA.Name,
    result_count = DATA.Recipe_Results_Count,
  }
  return result
end

function DyWorld_Item(DATA)
  local result =
  {
    type = "item",
    name = dyworld_prefix..DATA.Name,
    icon = DATA.Icon,
    flags = {"goes-to-quickbar"},
    subgroup = dyworld_prefix..DATA.Subgroup,
    order = DATA.Name,
    stack_size = DATA.Stack or 200,
  }
	if DATA.Item_Place == "quickbar" then
		result.flags = {"goes-to-quickbar"}
	else
		result.flags = {"goes-to-main-inventory"}
	end
  return result
end

function DyWorld_Fluid(DATA)
  local result =
  {
    type = "fluid",
    name = dyworld_prefix..DATA.Name,
    icon = DATA.Icon,
    default_temperature = DATA.Def_Temp,
    max_temperature = DATA.Max_Temp,
    base_color = DATA.Color_Base,
    flow_color = DATA.Color_Flow,
    order = DATA.Name,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    auto_barrel = false
  }
	if DATA.Barrel then
		result.auto_barrel = true
	end
	if DATA.Gas_Temp then
		result.gas_temperature = DATA.Gas_Temp
	end
	if DATA.Heat_Capacity then
		result.heat_capacity = DATA.Heat_Capacity
	else
		result.heat_capacity = "0.2KJ"
	end
  return result
end

function DyWorld_Projectile_1(DATA, NMB)
	local result =
  {
    type = "projectile",
    name = dyworld_prefix..DATA.Name,
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = {amount = DATA.Dmg_Mod, type = DATA.DmgType}
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      tint = DATA.Tint,
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
	}
  }
	if NMB then
		result.name = dyworld_prefix..DATA.Name..NMB
		result.action.action_delivery.target_effects.damage = {amount = (DATA.Dmg_Mod * NMB), type = DATA.DmgType}
	end
	if DATA.Piercing then
		result.name = dyworld_prefix..DATA.Name.."piercing-"..NMB
		result.piercing_damage = (DATA.Dmg_Mod * NMB)
	end
	return result
end

function DyWorld_Projectile_2(DATA, NMB)
	local result =
  {
    type = "projectile",
    name = dyworld_prefix..DATA.Name,
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0.05,
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
       target_effects =
        {
          {
            type = "create-entity",
            entity_name = "laser-bubble"
          },
          {
            type = "damage",
			damage = {amount = DATA.Dmg_Mod, type = DATA.DmgType}
          }
        }
      }
    },
    light = {intensity = 0.5, size = 5},
    animation =
    {
      filename = "__base__/graphics/entity/laser/laser-to-tint-medium.png",
      tint = DATA.Tint,
      frame_count = 1,
      width = 12,
      height = 33,
      priority = "high",
      blend_mode = "additive"
    },
  }
	if NMB then
		result.name = dyworld_prefix..DATA.Name..NMB
		result.action.action_delivery.target_effects[2].damage = {amount = (DATA.Dmg_Mod * NMB), type = DATA.DmgType}
	end
	if DATA.Piercing then
		result.name = dyworld_prefix..DATA.Name.."piercing-"..NMB
		result.piercing_damage = (DATA.Dmg_Mod * NMB)
	end
  return result
end

function DyWorld_Entity_Solar_Panels(DATA)
  local result =
  {
    type = "solar-panel",
    name = DATA.Name,
    icon = "__base__/graphics/icons/solar-panel.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = DATA.Name},
    max_health = DATA.Health,
    corpse = "big-remnants",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
	fast_replaceable_group = "solar-panel",
    energy_source =
    {
      type = "electric",
      usage_priority = "solar"
    },
    picture =
    {
      filename = "__base__/graphics/entity/solar-panel/solar-panel.png",
      priority = "high",
      width = 104,
      height = 96,
	  tint = DATA.Tint,
    },
    production = (tostring(DATA.Energy)).."kW"
  }
  return result
end