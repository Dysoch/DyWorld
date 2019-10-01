require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for Dmg, Color in pairs(Damage_Color) do
	for Size, Scale in pairs(Enemy_Names_Scales) do
data:extend(
{
  {
    type = "unit",
    name = Dmg.."-"..Size.."-biter",
	localised_name = {"looped-name.enemy-unit", {"looped-name."..Size}, {"damage-type-name."..Dmg}},
	icons = {
	  {
	    icon = "__base__/graphics/icons/medium-biter.png",
		tint = Color,
	  },
	},
    icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Round(((100 * Scale) * Damage_Tiers[Dmg]) * Damage_Tiers[Dmg]),
	Tier = Damage_Tiers[Dmg],
    order = Dmg.."-biter-"..Damage_Tiers[Dmg].."-"..Size,
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
    healing_per_tick = 0.01 * Damage_Tiers[Dmg],
    collision_box = DyWorld_scale_bounding_box({{-0.4, -0.4}, {0.4, 0.4}}, Scale),
    selection_box = DyWorld_scale_bounding_box({{-0.7, -1.5}, {0.7, 0.3}}, Scale),
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 10 * Damage_Tiers[Dmg],
    attack_parameters =
    {
      type = "projectile",
      ammo_type = DyWorld_make_unit_melee_ammo_type(((10*Damage_Tiers[Dmg])*Damage_Mod[Dmg]), Dmg),
      range = 1 * Scale,
      cooldown = 40 / Damage_Tiers[Dmg],
      sound = make_biter_roars(0.5),
      animation = biterattackanimation(Scale, Color, Color)
    },
    vision_distance = 5 * Damage_Tiers[Dmg],
    movement_speed = 0.2 + (Damage_Tiers[Dmg] / 100),
    distance_per_frame = 0.188,
    -- in pu
    pollution_to_join_attack = 20 * Damage_Tiers[Dmg],
    corpse = Dmg.."-"..Size.."-biter-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = make_biter_calls(0.4),
    dying_sound = make_biter_dying_sounds(0.5),
    run_animation = biterrunanimation(Scale, Color, Color),
    ai_settings = DyWorld_ai_settings(true, true, true),
  },
  add_biter_die_animation(Scale, Color, Color,
  {
    type = "corpse",
    name = Dmg.."-"..Size.."-biter-corpse",
    icon = "__base__/graphics/icons/medium-biter-corpse.png",
    icon_size = 32,
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    subgroup = "corpses",
    order = "c[corpse]-a[biter]-b[medium]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"}
  }),
})
	end
end
