require "data/prefix"

Data_Table_Enemy_Melee = {
	{
		Name = dyworld_prefix.."enemy-001",
		Health = 1000,
		Tint1 = {r=0.56, g=0.46, b=0.42, a=0.65},
		Tint2 = {r=1, g=0.63, b=0, a=0.4},
		Scale = 0.5,
		Damage = 15,
		Range = 1,
		Attack_Speed = (60/2),
		Move_Speed = 0.25,
		Vision = 35,
		Pollution = 250,
	},
}

function DyWorld_Enemy_Melee_Entity(NAME, HEALTH, TINT1, TINT2, SCALE, DMG, BITERANGE, ATTACKSPEED, SPEED, VISION, POLLUTION)
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
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.4, -0.7}, {0.7, 0.4}},
    attack_parameters =
    {
      type = "projectile",
      range = BITERANGE,
      cooldown = ATTACKSPEED,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(DMG),
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
		DyWorld_Enemy_Melee_Entity(v.Name, v.Health, v.Tint1, v.Tint2, v.Scale, v.Damage, v.Range, v.Attack_Speed, v.Move_Speed, v.Vision, v.Pollution),
		DyWorld_Enemy_Melee_Entity_Corpse(v.Name, v.Health, v.Tint1, v.Tint2, v.Scale)
	})
end