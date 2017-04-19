require "data/template-data/main"
require "data/template-data/tech"
require "data/prefix"

function DyWorld_Gun_Turret_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
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

function DyWorld_Gun_Turret_Item(NAME, STACK)
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

function DyWorld_Gun_Turret_Entity(NAME, HEALTH, TINT, INV, AUTOAMMO, ATTACKSPEED, AMMO, SPEED, DMGMOD, MINRANGE, MAXRANGE, TURNRANGEMIN, TURNRANGEMAX)
  local result =
  {
    type = "ammo-turret",
    name = NAME,
    icon = "__base__/graphics/icons/gun-turret.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = NAME},
    max_health = HEALTH,
    corpse = "medium-remnants",
    collision_box = {{-0.7, -0.7 }, {0.7, 0.7}},
    selection_box = {{-1, -1 }, {1, 1}},
    rotation_speed = 0.015,
    preparing_speed = 0.08,
    folding_speed = 0.08,
    dying_explosion = "medium-explosion",
    inventory_size = INV,
    automated_ammo_count = AUTOAMMO,
    attacking_speed = ATTACKSPEED,
    folded_animation = 
    {
      layers =
      {
        gun_turret_extension{frame_count=1, line_length = 1},
        gun_turret_extension_mask{frame_count=1, line_length = 1},
        gun_turret_extension_shadow{frame_count=1, line_length = 1}
      }
    },
    preparing_animation = 
    {
      layers =
      {
        gun_turret_extension{},
        gun_turret_extension_mask{},
        gun_turret_extension_shadow{}
      }
    },
    prepared_animation = gun_turret_attack{frame_count=1},
    attacking_animation = gun_turret_attack{},
    folding_animation = 
    { 
      layers = 
      { 
        gun_turret_extension{run_mode = "backward"},
        gun_turret_extension_mask{run_mode = "backward"},
        gun_turret_extension_shadow{run_mode = "backward"}
      }
    },
    base_picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-base.png",
          priority = "high",
          width = 90,
          height = 75,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = {0.0625, -0.046875},
		  tint = TINT
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-base-mask.png",
          flags = { "mask" },
          line_length = 1,
          width = 52,
          height = 47,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = {0.0625, -0.234375},
          apply_runtime_tint = true
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    
    attack_parameters =
    {
      type = "projectile",
      ammo_category = AMMO,
      cooldown = SPEED,
      projectile_creation_distance = 1.39375,
      projectile_center = {0.0625, -0.0875}, -- same as gun_turret_attack shift
      damage_modifier = DMGMOD,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0},
        creation_distance = -1.925,
        starting_frame_speed = 0.2,
        starting_frame_speed_deviation = 0.1
      },
      range = MAXRANGE,
      min_range = MINRANGE,
      turn_range = TURNRANGEMIN/TURNRANGEMAX,
      sound = make_heavy_gunshot_sounds(),
    },

    call_for_help_radius = 40
  }
  return result
end

for k,v in pairs(Data_Table_Gun_Turret) do
data:extend(
	{
		DyWorld_Gun_Turret_Entity(v.Name, v.Health, v.Tint, v.Inventory, v.Auto_Ammo, v.Attack_Speed_1, v.Ammo_Cat, v.Attack_Speed_2, v.Dmg_Mod, v.Min_Range, v.Max_Range, v.Turn_Min_Range, v.Turn_Max_Range),
		DyWorld_Gun_Turret_Item(v.Name, v.Stack),
		DyWorld_Gun_Turret_Recipe(v.Name, v.Craft_Time, v.Result_Count, v.Recipe_Without_Tech),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end