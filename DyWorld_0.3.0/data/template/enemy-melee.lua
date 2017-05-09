require "data/prefix"

Data_Table_Enemy_Melee = {
	-- Sanguisugea
	{
		Name = dyworld_prefix.."enemy-001",
		Health = 500,
		Tint1 = {r=0.56, g=0.46, b=0.42, a=0.65},
		Tint2 = {r=1, g=0.63, b=0, a=0.4},
		Scale = 0.25,
		Damage = 5,
		Damage_Type = "poison",
		Range = 1,
		Attack_Speed = (60/8),
		Move_Speed = 0.5,
		Vision = 15,
		Pollution = 250,
	},
	{
		Name = dyworld_prefix.."enemy-002",
		Health = 1000,
		Tint1 = {r=0.56, g=0.46, b=0.42, a=0.65},
		Tint2 = {r=1, g=0.63, b=0, a=0.4},
		Scale = 0.5,
		Damage = 10,
		Damage_Type = "poison",
		Range = 1,
		Attack_Speed = (60/4),
		Move_Speed = 0.25,
		Vision = 40,
		Pollution = 500,
	},
	{
		Name = dyworld_prefix.."enemy-003",
		Health = 2500,
		Tint1 = {r=0.56, g=0.46, b=0.42, a=0.65},
		Tint2 = {r=1, g=0.63, b=0, a=0.4},
		Scale = 0.75,
		Damage = 15,
		Damage_Type = "poison",
		Range = 1,
		Attack_Speed = (60/2),
		Move_Speed = 0.30,
		Vision = 25,
		Pollution = 750,
	},
	{
		Name = dyworld_prefix.."enemy-004",
		Health = 5000,
		Tint1 = {r=0.56, g=0.46, b=0.42, a=0.65},
		Tint2 = {r=1, g=0.63, b=0, a=0.4},
		Scale = 1,
		Damage = 25,
		Damage_Type = "poison",
		Range = 1,
		Attack_Speed = (60/2),
		Move_Speed = 0.25,
		Vision = 35,
		Pollution = 1000,
	},
	{
		Name = dyworld_prefix.."enemy-005",
		Health = 10000,
		Tint1 = {r=0.56, g=0.46, b=0.42, a=0.65},
		Tint2 = {r=1, g=0.63, b=0, a=0.4},
		Scale = 1.5,
		Damage = 50,
		Damage_Type = "poison",
		Range = 1,
		Attack_Speed = (60/2),
		Move_Speed = 0.20,
		Vision = 50,
		Pollution = 2000,
	},
	{
		Name = dyworld_prefix.."enemy-006",
		Health = 25000,
		Tint1 = {r=0.56, g=0.46, b=0.42, a=0.65},
		Tint2 = {r=1, g=0.63, b=0, a=0.4},
		Scale = 2,
		Damage = 100,
		Damage_Type = "poison",
		Range = 1,
		Attack_Speed = (60/2),
		Move_Speed = 0.15,
		Vision = 70,
		Pollution = 4000,
	},
}

function Melee_Dmg(DMG, DMGTYPE)
  return
  {
    category = "melee",
    target_type = "entity",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = { amount = DMG , type = DMGTYPE}
        }
      }
    }
  }
end

function DyWorld_Enemy_Melee_Entity(NAME, HEALTH, TINT1, TINT2, SCALE, DMG, DMGTYPE, BITERANGE, ATTACKSPEED, SPEED, VISION, POLLUTION)
  local result =
  {
    type = "unit",
    name = NAME,
    icon = "__base__/graphics/icons/small-biter.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air"},
    max_health = HEALTH,
    order = NAME,
    subgroup="enemies",
    healing_per_tick = (50/HEALTH),
    collision_box = {{(-0.4*SCALE), (-0.4*SCALE)}, {(0.4*SCALE), (0.4*SCALE)}},
    selection_box = {{(-0.7*SCALE), (-1.5*SCALE)}, {(0.7*SCALE), (0.3*SCALE)}},
    sticker_box = {{-0.6, -0.8}, {0.6, 0}},
    attack_parameters =
    {
      type = "projectile",
      range = BITERANGE,
      cooldown = ATTACKSPEED,
      ammo_category = "melee",
      ammo_type = Melee_Dmg(DMG, DMGTYPE),
      sound = make_biter_roars(0.4),
      animation = biterattackanimation(SCALE, TINT1, TINT2)
    },
    vision_distance = VISION,
    movement_speed = SPEED,
    distance_per_frame = 0.1,
    pollution_to_join_attack = POLLUTION,
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    corpse = NAME.."-corpse",
    dying_explosion = "blood-explosion-small",
    dying_sound =  make_biter_dying_sounds(0.4),
    working_sound =  make_biter_calls(0.3),
    run_animation = biterrunanimation(SCALE, TINT1, TINT2)
  }
  return result
end

function DyWorld_Enemy_Melee_Entity_Corpse(NAME, HEALTH, TINT1, TINT2, SCALE)
  local result =
  {
    type = "corpse",
    name = NAME.."-corpse",
    icon = "__base__/graphics/icons/small-biter-corpse.png",
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    subgroup="corpses",
    order = NAME,
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
    dying_speed = 0.04,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "corpse",
    animation = biterdieanimation(SCALE, TINT1, TINT2)
  }
  return result
end

for k,v in pairs(Data_Table_Enemy_Melee) do
data:extend(
	{
		DyWorld_Enemy_Melee_Entity(v.Name, v.Health, v.Tint1, v.Tint2, v.Scale, v.Damage, v.Damage_Type, v.Range, v.Attack_Speed, v.Move_Speed, v.Vision, v.Pollution),
		DyWorld_Enemy_Melee_Entity_Corpse(v.Name, v.Health, v.Tint1, v.Tint2, v.Scale)
	})
end