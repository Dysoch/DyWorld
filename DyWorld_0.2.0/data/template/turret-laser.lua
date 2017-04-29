require "data/prefix"

Data_Table_Laser_Turret = {
	{
		Name = dyworld_prefix.."turret-laser-basic-01",
		Health = 750,
		Tint = {r=0.500, g=0.500, b=0.500},
		Attack_Speed = (60/7.5),
		Ammo_Cat = "laser",
		Dmg_Mod = 1.5,
		Min_Range = 0,
		Max_Range = 30,
		Turn_Min_Range = 170,
		Turn_Max_Range = 360,
		Energy = 24,
		Projectile = dyworld_prefix.."projectile-laser-01",
		Projectile_Speed = 0.5,
		Stack = 100,
		Craft_Time = 20,
		Result_Count = 1,
		Recipe_Without_Tech = true,
		Recipe_Ingredients = {{"stone",15},{"iron-plate",5},{"copper-plate",2}},
	},
	{
		Name = dyworld_prefix.."turret-laser-basic-02",
		Health = 1500,
		Tint = {r=0.500, g=0.500, b=0.500},
		Attack_Speed = (60/10),
		Ammo_Cat = "laser",
		Dmg_Mod = 2,
		Min_Range = 5,
		Max_Range = 30,
		Turn_Min_Range = 90,
		Turn_Max_Range = 360,
		Energy = 25,
		Projectile = dyworld_prefix.."projectile-laser-02",
		Projectile_Speed = 0.5,
		Stack = 100,
		Craft_Time = 20,
		Result_Count = 1,
		Recipe_Without_Tech = true,
		Recipe_Ingredients = {{"stone",15},{"iron-plate",5},{"copper-plate",2}},
	},
	{
		Name = dyworld_prefix.."turret-laser-sniper-01",
		Health = 1500,
		Tint = {r=0.500, g=0.500, b=0.500},
		Attack_Speed = (60/1.5),
		Ammo_Cat = "laser",
		Dmg_Mod = 2,
		Min_Range = 10,
		Max_Range = 100,
		Turn_Min_Range = 45,
		Turn_Max_Range = 360,
		Energy = 50,
		Projectile = dyworld_prefix.."projectile-laser-03",
		Projectile_Speed = 5,
		Stack = 100,
		Craft_Time = 25,
		Result_Count = 1,
		Recipe_Without_Tech = true,
		Recipe_Ingredients = {{"stone",15},{"iron-plate",5},{"copper-plate",2}},
	},
}

function DyWorld_Laser_Turret_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
  local result =
  {
    type = "recipe",
    name = NAME,
    energy_required = CRAFTTIME,
	enabled = ENABLED,
    ingredients = {},
    result = NAME,
    result_count = RESULTCOUNT,
  }
  return result
end

function DyWorld_Laser_Turret_Item(NAME, STACK)
  local result =
  {
    type = "item",
    name = NAME,
    icon = "__base__/graphics/icons/gun-turret.png",
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = NAME,
    place_result = NAME,
    stack_size = STACK,
  }
  return result
end

function DyWorld_Laser_Turret_Entity(NAME, HEALTH, TINT, AMMO, SPEED, DMGMOD, MINRANGE, MAXRANGE, TURNRANGEMIN, TURNRANGEMAX, ENERGY, PROJECTILE, PROJECTILE_SPEED)
  local result =
  {
    type = "electric-turret",
    name = NAME,
    icon = "__base__/graphics/icons/laser-turret.png",
    flags = { "placeable-player", "placeable-enemy", "player-creation"},
    minable = { mining_time = 0.5, result = NAME },
    max_health = HEALTH,
    corpse = "medium-remnants",
    collision_box = {{ -0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{ -1, -1}, {1, 1}},
    rotation_speed = 0.01,
    preparing_speed = 0.05,
    dying_explosion = "medium-explosion",
    folding_speed = 0.05,
    energy_source =
    {
      type = "electric",
      buffer_capacity = (tostring(ENERGY*10)+1).."kJ",
      input_flow_limit = (tostring(ENERGY*400)).."kW",
      drain = (tostring(ENERGY)).."kW",
      usage_priority = "primary-input"
    },
    folded_animation =
    {
      layers =
      {
        laser_turret_extension{frame_count=1, line_length = 1},
        laser_turret_extension_shadow{frame_count=1, line_length=1},
        laser_turret_extension_mask{frame_count=1, line_length=1}
      }
    },
    preparing_animation =
    {
      layers =
      {
        laser_turret_extension{},
        laser_turret_extension_shadow{},
        laser_turret_extension_mask{}
      }
    },
    prepared_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun.png",
          line_length = 8,
          width = 68,
          height = 68,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 64,
          shift = {-0.03125, -1}
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-mask.png",
          flags = { "mask" },
          line_length = 8,
          width = 54,
          height = 44,
          frame_count = 1,
          axially_symmetrical = false,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = {-0.03125, -1.3125},
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-shadow.png",
          line_length = 8,
          width = 88,
          height = 52,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 64,
          draw_as_shadow = true,
          shift = {1.5, 0}
        }
      }
    },
    folding_animation = 
    {
      layers =
      {
        laser_turret_extension{run_mode = "backward"},
        laser_turret_extension_shadow{run_mode = "backward"},
        laser_turret_extension_mask{run_mode = "backward"}
      }
    },
    base_picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base.png",
          priority = "high",
          width = 98,
          height = 82,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = {0.015625, 0.03125}
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base-mask.png",
          flags = { "mask" },
          line_length = 1,
          width = 54,
          height = 46,
          axially_symmetrical = false,
          apply_runtime_tint = true,
          direction_count = 1,
          frame_count = 1,
          shift = {-0.046875, -0.109375},
        },
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    turret_base_has_direction = true,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = AMMO,
      cooldown = SPEED,
      projectile_center = {-0.09375, -0.2},
      projectile_creation_distance = 1.4,
      range = MAXRANGE,
      min_range = MINRANGE,
      turn_range = TURNRANGEMIN/TURNRANGEMAX,
      damage_modifier = DMGMOD,
      ammo_type =
      {
        type = "projectile",
        category = "laser-turret",
        energy_consumption = (tostring((ENERGY*10))).."kJ",
        action =
        {
          {
            type = "direct",
            action_delivery =
            {
              {
                type = "projectile",
                projectile = PROJECTILE,
                starting_speed = PROJECTILE_SPEED
              }
            }
          }
        }
      },
      sound = make_laser_sounds()
    },
    call_for_help_radius = (MAXRANGE+10),
  }
  return result
end

for k,v in pairs(Data_Table_Laser_Turret) do
data:extend(
	{
		DyWorld_Laser_Turret_Entity(v.Name, v.Health, v.Tint, v.Ammo_Cat, v.Attack_Speed, v.Dmg_Mod, v.Min_Range, v.Max_Range, v.Turn_Min_Range, v.Turn_Max_Range, v.Energy, v.Projectile, v.Projectile_Speed),
		DyWorld_Laser_Turret_Item(v.Name, v.Stack),
		DyWorld_Laser_Turret_Recipe(v.Name, v.Craft_Time, v.Result_Count, v.Recipe_Without_Tech),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end