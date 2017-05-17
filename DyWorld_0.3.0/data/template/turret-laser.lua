require "data/prefix"

Data_Table_Laser_Turret = {
	{
		Name = dyworld_prefix.."turret-laser-1-basic-1",
		Health = 1000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Attack_Speed = (60/7.5),
		Ammo_Cat = "laser",
		Dmg_Mod = 1.5,
		Min_Range = 0,
		Max_Range = 30,
		Turn_Min_Range = 170,
		Turn_Max_Range = 360,
		Energy = 24,
		Projectile = dyworld_prefix.."projectile-laser-basic-01",
		Projectile_Speed = 0.5,
		Stack = 100,
		Recipe_Craft_Time = 20,
		Result_Count = 1,
		Recipe_Without_Tech = false,
		Recipe_Ingredients = {{"iron-plate",20},{"copper-plate",15},{"electronic-circuit",20},{"battery",5}},
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 10, percent = 15 },{type = "acid", decrease = 10, percent = 15},{type = "explosion", decrease = 50, percent = 50},{type = "fire", decrease = 10, percent = 50},{type = "laser", decrease = 100, percent = 99}},
	},
	{
		Name = dyworld_prefix.."turret-laser-1-basic-2",
		Health = 1000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Attack_Speed = (60/10),
		Ammo_Cat = "laser",
		Dmg_Mod = 2,
		Min_Range = 5,
		Max_Range = 40,
		Turn_Min_Range = 90,
		Turn_Max_Range = 360,
		Energy = 25,
		Projectile = dyworld_prefix.."projectile-laser-basic-02",
		Projectile_Speed = 0.5,
		Stack = 100,
		Recipe_Craft_Time = 20,
		Result_Count = 1,
		Recipe_Without_Tech = false,
		Recipe_Ingredients = {{"iron-plate",15},{"copper-plate",10},{"electronic-circuit",15},{"battery",5}},
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 10, percent = 15 },{type = "acid", decrease = 10, percent = 15},{type = "explosion", decrease = 50, percent = 50},{type = "fire", decrease = 10, percent = 50},{type = "laser", decrease = 100, percent = 99}},
	},
	{
		Name = dyworld_prefix.."turret-laser-1-sniper-1",
		Health = 1000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Attack_Speed = (60/1.5),
		Ammo_Cat = "laser",
		Dmg_Mod = 2,
		Min_Range = 10,
		Max_Range = 100,
		Turn_Min_Range = 45,
		Turn_Max_Range = 360,
		Energy = 100,
		Projectile = dyworld_prefix.."projectile-laser-sniper-01",
		Projectile_Speed = 5,
		Stack = 100,
		Recipe_Craft_Time = 25,
		Result_Count = 1,
		Recipe_Without_Tech = false,
		Recipe_Ingredients = {{"iron-plate",20},{"copper-plate",15},{"electronic-circuit",25},{"battery",5}},
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 10, percent = 15 },{type = "acid", decrease = 10, percent = 15},{type = "explosion", decrease = 50, percent = 50},{type = "fire", decrease = 10, percent = 50},{type = "laser", decrease = 100, percent = 99}},
	},
	{
		Name = dyworld_prefix.."turret-laser-2-basic-1",
		Health = 5000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Attack_Speed = (60/5),
		Ammo_Cat = "laser",
		Dmg_Mod = 2,
		Min_Range = 0,
		Max_Range = 40,
		Turn_Min_Range = 170,
		Turn_Max_Range = 360,
		Energy = 32,
		Projectile = dyworld_prefix.."projectile-laser-basic-03",
		Projectile_Speed = 0.5,
		Stack = 100,
		Recipe_Craft_Time = 20,
		Result_Count = 1,
		Recipe_Without_Tech = false,
		Recipe_Ingredients = {{dyworld_prefix.."turret-laser-1-basic-1",1},{dyworld_prefix_intermediate.."steel-stick", 25},{"advanced-circuit",20},{"battery",5}},
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 10, percent = 15 },{type = "acid", decrease = 10, percent = 15},{type = "explosion", decrease = 50, percent = 50},{type = "fire", decrease = 10, percent = 50},{type = "laser", decrease = 100, percent = 99}},
	},
	{
		Name = dyworld_prefix.."turret-laser-2-basic-2",
		Health = 5000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Attack_Speed = (60/6),
		Ammo_Cat = "laser",
		Dmg_Mod = 3,
		Min_Range = 2.5,
		Max_Range = 50,
		Turn_Min_Range = 75,
		Turn_Max_Range = 360,
		Energy = 35,
		Projectile = dyworld_prefix.."projectile-laser-basic-04",
		Projectile_Speed = 0.5,
		Stack = 100,
		Recipe_Craft_Time = 20,
		Result_Count = 1,
		Recipe_Without_Tech = false,
		Recipe_Ingredients = {{dyworld_prefix.."turret-laser-1-basic-2",1},{dyworld_prefix_intermediate.."steel-stick", 15},{"advanced-circuit",15},{"battery",4}},
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 10, percent = 15 },{type = "acid", decrease = 10, percent = 15},{type = "explosion", decrease = 50, percent = 50},{type = "fire", decrease = 10, percent = 50},{type = "laser", decrease = 100, percent = 99}},
	},
	{
		Name = dyworld_prefix.."turret-laser-2-sniper-1",
		Health = 5000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Attack_Speed = (60/2),
		Ammo_Cat = "laser",
		Dmg_Mod = 4,
		Min_Range = 5,
		Max_Range = 150,
		Turn_Min_Range = 22.5,
		Turn_Max_Range = 360,
		Energy = 250,
		Projectile = dyworld_prefix.."projectile-laser-sniper-02",
		Projectile_Speed = 5,
		Stack = 100,
		Recipe_Craft_Time = 25,
		Result_Count = 1,
		Recipe_Without_Tech = false,
		Recipe_Ingredients = {{dyworld_prefix.."turret-laser-1-sniper-1",1},{dyworld_prefix_intermediate.."steel-stick", 25},{"advanced-circuit",35},{"battery",25}},
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 10, percent = 15 },{type = "acid", decrease = 10, percent = 15},{type = "explosion", decrease = 50, percent = 50},{type = "fire", decrease = 10, percent = 50},{type = "laser", decrease = 100, percent = 99}},
	},
	{
		Name = dyworld_prefix.."turret-laser-3-basic-1",
		Health = 25000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Attack_Speed = (60/5),
		Ammo_Cat = "laser",
		Dmg_Mod = 3.5,
		Min_Range = 0,
		Max_Range = 40,
		Turn_Min_Range = 170,
		Turn_Max_Range = 360,
		Energy = 60,
		Projectile = dyworld_prefix.."projectile-laser-basic-05",
		Projectile_Speed = 0.5,
		Stack = 100,
		Recipe_Craft_Time = 20,
		Result_Count = 1,
		Recipe_Without_Tech = false,
		Recipe_Ingredients = {{dyworld_prefix.."turret-laser-2-basic-1",1},{dyworld_prefix_intermediate.."steel-gear", 25},{"processing-unit",20},{"battery",5}},
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 10, percent = 15 },{type = "acid", decrease = 10, percent = 15},{type = "explosion", decrease = 50, percent = 50},{type = "fire", decrease = 10, percent = 50},{type = "laser", decrease = 100, percent = 99}},
	},
	{
		Name = dyworld_prefix.."turret-laser-3-basic-2",
		Health = 25000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Attack_Speed = (60/6),
		Ammo_Cat = "laser",
		Dmg_Mod = 4,
		Min_Range = 2.5,
		Max_Range = 50,
		Turn_Min_Range = 75,
		Turn_Max_Range = 360,
		Energy = 75,
		Projectile = dyworld_prefix.."projectile-laser-basic-06",
		Projectile_Speed = 0.5,
		Stack = 100,
		Recipe_Craft_Time = 20,
		Result_Count = 1,
		Recipe_Without_Tech = false,
		Recipe_Ingredients = {{dyworld_prefix.."turret-laser-2-basic-2",1},{dyworld_prefix_intermediate.."steel-gear", 15},{"processing-unit",15},{"battery",4}},
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 10, percent = 15 },{type = "acid", decrease = 10, percent = 15},{type = "explosion", decrease = 50, percent = 50},{type = "fire", decrease = 10, percent = 50},{type = "laser", decrease = 100, percent = 99}},
	},
	{
		Name = dyworld_prefix.."turret-laser-3-sniper-1",
		Health = 25000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Attack_Speed = (60/2),
		Ammo_Cat = "laser",
		Dmg_Mod = 7,
		Min_Range = 5,
		Max_Range = 150,
		Turn_Min_Range = 22.5,
		Turn_Max_Range = 360,
		Energy = 400,
		Projectile = dyworld_prefix.."projectile-laser-sniper-03",
		Projectile_Speed = 5,
		Stack = 100,
		Recipe_Craft_Time = 25,
		Result_Count = 1,
		Recipe_Without_Tech = false,
		Recipe_Ingredients = {{dyworld_prefix.."turret-laser-2-sniper-1",1},{dyworld_prefix_intermediate.."steel-gear", 25},{"processing-unit",35},{"battery",25}},
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 10, percent = 15 },{type = "acid", decrease = 10, percent = 15},{type = "explosion", decrease = 50, percent = 50},{type = "fire", decrease = 10, percent = 50},{type = "laser", decrease = 100, percent = 99}},
	},
	{
		Name = dyworld_prefix.."turret-laser-4-basic-1",
		Health = 100000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Attack_Speed = (60/5),
		Ammo_Cat = "laser",
		Dmg_Mod = 5,
		Min_Range = 0,
		Max_Range = 40,
		Turn_Min_Range = 170,
		Turn_Max_Range = 360,
		Energy = 90,
		Projectile = dyworld_prefix.."projectile-laser-basic-07",
		Projectile_Speed = 0.5,
		Stack = 100,
		Recipe_Craft_Time = 20,
		Result_Count = 1,
		Recipe_Without_Tech = false,
		Recipe_Ingredients = {{dyworld_prefix.."turret-laser-3-basic-1",1},{dyworld_prefix_intermediate.."binding-steel", 25},{dyworld_prefix_intermediate.."processing-advanced", 20},{"battery",5}},
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 10, percent = 15 },{type = "acid", decrease = 10, percent = 15},{type = "explosion", decrease = 50, percent = 50},{type = "fire", decrease = 10, percent = 50},{type = "laser", decrease = 100, percent = 99}},
	},
	{
		Name = dyworld_prefix.."turret-laser-4-basic-2",
		Health = 100000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Attack_Speed = (60/6),
		Ammo_Cat = "laser",
		Dmg_Mod = 6,
		Min_Range = 2.5,
		Max_Range = 50,
		Turn_Min_Range = 75,
		Turn_Max_Range = 360,
		Energy = 100,
		Projectile = dyworld_prefix.."projectile-laser-basic-08",
		Projectile_Speed = 0.5,
		Stack = 100,
		Recipe_Craft_Time = 20,
		Result_Count = 1,
		Recipe_Without_Tech = false,
		Recipe_Ingredients = {{dyworld_prefix.."turret-laser-3-basic-2",1},{dyworld_prefix_intermediate.."binding-steel", 15},{dyworld_prefix_intermediate.."processing-advanced", 15},{"battery",4}},
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 10, percent = 15 },{type = "acid", decrease = 10, percent = 15},{type = "explosion", decrease = 50, percent = 50},{type = "fire", decrease = 10, percent = 50},{type = "laser", decrease = 100, percent = 99}},
	},
	{
		Name = dyworld_prefix.."turret-laser-4-sniper-1",
		Health = 100000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Attack_Speed = (60/2),
		Ammo_Cat = "laser",
		Dmg_Mod = 10,
		Min_Range = 5,
		Max_Range = 200,
		Turn_Min_Range = 22.5,
		Turn_Max_Range = 360,
		Energy = 750,
		Projectile = dyworld_prefix.."projectile-laser-sniper-04",
		Projectile_Speed = 5,
		Stack = 100,
		Recipe_Craft_Time = 25,
		Result_Count = 1,
		Recipe_Without_Tech = false,
		Recipe_Ingredients = {{dyworld_prefix.."turret-laser-3-sniper-1",1},{dyworld_prefix_intermediate.."binding-steel", 25},{dyworld_prefix_intermediate.."processing-advanced", 35},{"battery",25}},
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 10, percent = 15 },{type = "acid", decrease = 10, percent = 15},{type = "explosion", decrease = 50, percent = 50},{type = "fire", decrease = 10, percent = 50},{type = "laser", decrease = 100, percent = 99}},
	},
	{
		Name = dyworld_prefix.."turret-laser-5-basic-1",
		Health = 250000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Attack_Speed = (60/5),
		Ammo_Cat = "laser",
		Dmg_Mod = 8,
		Min_Range = 0,
		Max_Range = 40,
		Turn_Min_Range = 170,
		Turn_Max_Range = 360,
		Energy = 150,
		Projectile = dyworld_prefix.."projectile-laser-basic-09",
		Projectile_Speed = 0.5,
		Stack = 100,
		Recipe_Craft_Time = 20,
		Result_Count = 1,
		Recipe_Without_Tech = false,
		Recipe_Ingredients = {{dyworld_prefix.."turret-laser-4-basic-1",1},{dyworld_prefix_intermediate.."crystal", 25},{dyworld_prefix_intermediate.."processing-logic", 20},{"battery",5}},
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 10, percent = 15 },{type = "acid", decrease = 10, percent = 15},{type = "explosion", decrease = 50, percent = 50},{type = "fire", decrease = 10, percent = 50},{type = "laser", decrease = 100, percent = 99}},
	},
	{
		Name = dyworld_prefix.."turret-laser-5-basic-2",
		Health = 250000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Attack_Speed = (60/6),
		Ammo_Cat = "laser",
		Dmg_Mod = 10,
		Min_Range = 2.5,
		Max_Range = 50,
		Turn_Min_Range = 75,
		Turn_Max_Range = 360,
		Energy = 175,
		Projectile = dyworld_prefix.."projectile-laser-basic-10",
		Projectile_Speed = 0.5,
		Stack = 100,
		Recipe_Craft_Time = 20,
		Result_Count = 1,
		Recipe_Without_Tech = false,
		Recipe_Ingredients = {{dyworld_prefix.."turret-laser-4-basic-2",1},{dyworld_prefix_intermediate.."crystal", 15},{dyworld_prefix_intermediate.."processing-logic", 15},{"battery",4}},
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 10, percent = 15 },{type = "acid", decrease = 10, percent = 15},{type = "explosion", decrease = 50, percent = 50},{type = "fire", decrease = 10, percent = 50},{type = "laser", decrease = 100, percent = 99}},
	},
	{
		Name = dyworld_prefix.."turret-laser-5-sniper-1",
		Health = 250000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Attack_Speed = (60/2),
		Ammo_Cat = "laser",
		Dmg_Mod = 20,
		Min_Range = 5,
		Max_Range = 250,
		Turn_Min_Range = 22.5,
		Turn_Max_Range = 360,
		Energy = 1100,
		Projectile = dyworld_prefix.."projectile-laser-sniper-05",
		Projectile_Speed = 5,
		Stack = 100,
		Recipe_Craft_Time = 25,
		Result_Count = 1,
		Recipe_Without_Tech = false,
		Recipe_Ingredients = {{dyworld_prefix.."turret-laser-4-sniper-1",1},{dyworld_prefix_intermediate.."crystal", 25},{dyworld_prefix_intermediate.."processing-logic", 35},{"battery",25}},
		Resistance = true,
		Resistance_Ingredients = {{type = "physical", decrease = 10, percent = 15 },{type = "acid", decrease = 10, percent = 15},{type = "explosion", decrease = 50, percent = 50},{type = "fire", decrease = 10, percent = 50},{type = "laser", decrease = 100, percent = 99}},
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
    icon = "__base__/graphics/icons/laser-turret.png",
    flags = {"goes-to-quickbar"},
    subgroup = dyworld_prefix.."turret-laser",
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
    resistances =
    {
    },
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
                starting_speed = PROJECTILE_SPEED,
                range_deviation = 0.1,
				max_range = MAXRANGE,
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
		DyWorld_Laser_Turret_Recipe(v.Name, v.Recipe_Craft_Time, v.Result_Count, v.Recipe_Without_Tech),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
	if v.Resistance then
		for _,z in pairs(v.Resistance_Ingredients) do
			table.insert(data.raw["electric-turret"][v.Name].resistances,z)
		end
	end
end