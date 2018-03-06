require "data/warfare/prefix"
require "data/prefix"

local function scale_bounding_box(bb, scale)
  return {
    {scale*bb[1][1], scale*bb[1][2]},
    {scale*bb[2][1], scale*bb[2][2]},
  }
end

function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

for k,v in pairs(Enemies) do
	if v.Type == "biter" then
		for i = 1,10 do
data:extend(
{
  {
    type = "unit",
    name = dy..k.."-"..i,
	localised_name = {"enemies-name.unit", {"enemies-name."..i}, {"enemies-name."..k}},
    icon = "__base__/graphics/icons/medium-biter.png",
    icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = ((v.Base_HP*i)*i),
    order = dy..k.."-"..i,
    subgroup = "enemies",
    resistances = v.Resistances,
    healing_per_tick = ((0.01 * i) * i),
    collision_box = scale_bounding_box({{-0.4, -0.4}, {0.4, 0.4}}, (0.25 * i)),
    selection_box = scale_bounding_box({{-0.7, -1.5}, {0.7, 0.3}}, (0.25 * i)),
    sticker_box = scale_bounding_box({{-0.6, -0.8}, {0.6, 0}}, (0.25 * i)),
    distraction_cooldown = (330 - (30 * i)),
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "melee",
      ammo_type = DyWorld_make_unit_melee_ammo_type((v.Attack_DMG_Base * i), v.Attack_DMG_Type),
      range = (v.Attack_Range_Base * i),
      cooldown = v.Attack_Speed_Base,
      sound = make_biter_roars(0.5),
      animation = DyWorld_biterattackanimation((0.25 * i), v.Tint_1, v.Tint_2)
    },
    vision_distance = 30,
    movement_speed = v.Speed,
    distance_per_frame = 0.15,
    -- in pu
    pollution_to_join_attack = ((v.Pollution_to_Join_Attack_Base * i) * i),
    corpse = dy..k.."-"..i.."-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = make_biter_calls(0.4),
    dying_sound = make_biter_dying_sounds(0.5),
    run_animation = DyWorld_biterrunanimation((0.25 * i), v.Tint_1, v.Tint_2)
  },
  {
    type = "corpse",
    name = dy..k.."-"..i.."-corpse",
	localised_name = {"enemies-name.unit-corpse", {"enemies-name."..i}, {"enemies-name."..k}},
    icon = "__base__/graphics/icons/medium-biter-corpse.png",
    icon_size = 32,
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"},
    subgroup = "corpses",
    order = dy..k.."-"..i.."-corpse",
    dying_speed = 0.04,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "corpse",
    animation = DyWorld_biterdieanimation((0.25 * i), v.Tint_1, v.Tint_2)
  },
})
		end
	elseif v.Type == "spitter" then
		for i = 1,10 do
data:extend(
{
  {
    type = "unit",
    name = dy..k.."-"..i,
	localised_name = {"enemies-name.unit", {"enemies-name."..i}, {"enemies-name."..k}},
    icon = "__base__/graphics/icons/medium-biter.png",
    icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = ((v.Base_HP*i)*i),
    order = dy..k.."-"..i,
    subgroup = "enemies",
    resistances = v.Resistances,
    healing_per_tick = ((0.01 * i) * i),
    collision_box = scale_bounding_box({{-0.4, -0.4}, {0.4, 0.4}}, (0.25 * i)),
    selection_box = scale_bounding_box({{-0.7, -1.5}, {0.7, 0.3}}, (0.25 * i)),
    sticker_box = scale_bounding_box({{-0.6, -0.8}, {0.6, 0}}, (0.25 * i)),
    distraction_cooldown = (330 - (30 * i)),
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    attack_parameters = DyWorld_spitter_attack_parameters(
    {
      range = (v.Attack_Range_Base * i ),
      min_attack_distance = (v.Attack_Range_Base / 2 ),
      cooldown = (v.Attack_Speed_Base * i),
      damage_modifier = (1 + (i / 10)), 
      scale = (0.25 * i),
      tint = v.Tint_1,
      roarvolume = 0.6,
	  projectile = dy..k.."-"..i.."-projectile"
    }),
    vision_distance = 30,
    movement_speed = v.Speed,
    distance_per_frame = 0.15,
    -- in pu
    pollution_to_join_attack = ((v.Pollution_to_Join_Attack_Base * i) * i),
    corpse = dy..k.."-"..i.."-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = make_biter_calls(0.4),
    dying_sound = make_biter_dying_sounds(0.5),
    run_animation = DyWorld_spitterrunanimation((0.25 * i), v.Tint_1)
  },
  {
    type = "corpse",
    name = dy..k.."-"..i.."-corpse",
	localised_name = {"enemies-name.unit-corpse", {"enemies-name."..i}, {"enemies-name."..k}},
    icon = "__base__/graphics/icons/medium-biter-corpse.png",
    icon_size = 32,
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"},
    subgroup = "corpses",
    order = dy..k.."-"..i.."-corpse",
    dying_speed = 0.04,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "corpse",
    animation = DyWorld_spitterdyinganimation((0.25 * i), v.Tint_1)
  },
  {
    type = "projectile",
    name = dy..k.."-"..i.."-projectile",
    flags = {"not-on-map"},
    acceleration = 0.005,
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
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
            type = "play-sound",
            sound =
            {
              {
                filename = "__base__/sound/creatures/projectile-acid-burn-1.ogg",
                volume = 0.8
              },
              {
                filename = "__base__/sound/creatures/projectile-acid-burn-2.ogg",
                volume = 0.8
              },
              {
                filename = "__base__/sound/creatures/projectile-acid-burn-long-1.ogg",
                volume = 0.8
              },
              {
                filename = "__base__/sound/creatures/projectile-acid-burn-long-2.ogg",
                volume = 0.8
              }
            }
          },
          {
            type = "create-entity",
            entity_name = "acid-splash-purple"
          },
          {
            type = "damage",
            damage = {amount = (v.Attack_DMG_Base * i), type = v.Attack_DMG_Type}
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/acid-projectile-purple/acid-projectile-purple.png",
      line_length = 5,
      width = 16,
      height = 18,
      frame_count = 33,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/acid-projectile-purple/acid-projectile-purple-shadow.png",
      line_length = 5,
      width = 28,
      height = 16,
      frame_count = 33,
      priority = "high",
      shift = {-0.09, 0.395}
    },
    rotatable = false
  },
})
		end
	end
end

