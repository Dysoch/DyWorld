require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for Dmg, Color in pairs(Damage_Color) do
	for Size, Scale in pairs(Enemy_Names_Scales) do
data:extend(
{
  {
    type = "unit",
    name = Dmg.."-"..Size.."-spitter",
	localised_name = {"looped-name.biter", {"looped-name."..Size}},
    icon = "__base__/graphics/icons/medium-spitter.png",
    icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Round(((100 * Scale) * Damage_Tiers[Dmg]) * Damage_Tiers[Dmg]),
	Tier = Damage_Tiers[Dmg],
    order = Damage_Tiers[Dmg].."-"..Dmg.."-"..Size,
    subgroup = "enemies",
    resistances =
    {
      {
        type = Dmg,
        percent = 100
      },
      {
        type = Damage_Opposite[Dmg],
        percent = -100
      },
    },
    spawning_time_modifier = 3,
    healing_per_tick = 0.01 * Damage_Tiers[Dmg],
    collision_box = DyWorld_scale_bounding_box({{-0.4, -0.4}, {0.4, 0.4}}, Scale),
    selection_box = DyWorld_scale_bounding_box({{-0.7, -1.0}, {0.7, 1.0}}, Scale),
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 10 * Damage_Tiers[Dmg],
    alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
    attack_parameters = DyWorld_spitter_attack_parameters(
    {
      acid_stream_name = Dmg.."-stream-spitter-"..Size,
      range = math.floor((15 * Range_Mod[Dmg]) * Enemy_Names_Scales[Size]),
      min_attack_distance = math.floor(5 * Range_Mod[Dmg]),
      cooldown = Round((100 / Range_Mod[Dmg]) * Enemy_Names_Scales[Size]),
      damage_modifier = 1, --Range_Mod[Dmg],
      scale = Scale,
      tint1 = Color,
      tint2 = Color,
      roarvolume = 0.6,
    }),
    vision_distance = 5 * Damage_Tiers[Dmg],
    movement_speed = 0.2 + (Damage_Tiers[Dmg] / 100),
    distance_per_frame = 0.188,
    -- in pu
    pollution_to_join_attack = 20 * Damage_Tiers[Dmg],
    corpse = Dmg.."-"..Size.."-spitter-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = make_biter_calls(0.4),
    dying_sound = make_spitter_dying_sounds(0.5),
    run_animation = spitterrunanimation(Scale, Color, Color),
    ai_settings = DyWorld_ai_settings(true, true, true),
  },
  add_spitter_die_animation(Scale, Color, Color,
  {
    type = "corpse",
    name = Dmg.."-"..Size.."-spitter-corpse",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    icon_size = 32,
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup = "corpses",
    order = "c[corpse]-a[biter]-b[medium]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"}
  }),
  DyWorld_spitter_stream({
    name = Dmg.."-stream-spitter-"..Size,
    scale = Scale,
    tint = Damage_Color[Dmg],
    corpse_name = "acid-splash-spitter-small",
    spit_radius = (0.5 + Scale),
    particle_spawn_interval = 1,
    particle_spawn_timeout = 6,
    splash_fire_name = Dmg.."-splash-fire-spitter-"..Size,
    sticker_name = Dmg.."-sticker-"..Size,
	damage = (Damage_Tiers[Dmg] * Damage_Mod[Dmg]),
	damage_type = Dmg,
  }),
  DyWorld_spitter_splash_fire({
    name =  Dmg.."-splash-fire-spitter-"..Size,
    scale = Scale,
    tint = Damage_Color[Dmg],
    ground_patch_scale = Scale * 0.65,
    patch_tint_multiplier = 0.7,
    splash_damage_per_tick = (Damage_Tiers[Dmg] * Damage_Mod[Dmg]),
    splash_damage_type = Dmg,
    sticker_name = Dmg.."-sticker-"..Size,
  }),
  DyWorld_spitter_sticker({
    name = Dmg.."-sticker-"..Size,
    tint = Damage_Color[Dmg],
    slow_player_movement = 0.6,
    slow_vehicle_speed = 0.6,
    slow_vehicle_friction = 1.5,
    slow_seconds = (Damage_Tiers[Dmg]),
  }),
})
	end
end
