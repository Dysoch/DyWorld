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

function Increase_Resistances(Table, Tier)
	local Resist_Table = util.table.deepcopy(Table)
	for k,v in pairs(Resist_Table) do
		if v.percent ~= 0 then
			v.percent = (v.percent * Tier)
		end
		if v.decrease ~= 0 then
			v.decrease = (v.decrease * Tier)
		end
		if v.maxed then
			v.percent = 100
			v.decrease = 5000
		end
		if v.negative then
			if v.percent ~= 0 then
				v.percent = v.percent * -1
			end
			if v.decrease ~= 0 then
				v.decrease = v.decrease * -1
			end
		end
	end
	return Resist_Table
end

for k,v in pairs(Enemies) do
	if v.Type == "biter" then
		for index = 1,v.Unit_Amount do
data:extend(
{
  {
    type = "unit",
    name = dy..k.."-"..index,
	localised_name = {"enemies-name.unit", {"enemies-name."..index}, {"enemies-name."..k}},
    icon = "__base__/graphics/icons/medium-biter.png",
    icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = ((v.Base_HP*index)*index),
    order = dy..k.."-"..index,
    subgroup = "enemies",
	DyWorld_Tier = index,
    resistances = Increase_Resistances(v.Resistances, index),
    healing_per_tick = ((0.01 * index) * index),
    collision_box = scale_bounding_box({{-0.4, -0.4}, {0.4, 0.4}}, (0.25 * index)),
	--collision_mask = {"item-layer", "object-layer", "player-layer", "water-tile", "layer-14"},
    selection_box = scale_bounding_box({{-0.7, -1.5}, {0.7, 0.3}}, (0.25 * index)),
    sticker_box = scale_bounding_box({{-0.6, -0.8}, {0.6, 0}}, (0.25 * index)),
    distraction_cooldown = (330 - (30 * index)),
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "melee",
      ammo_type = DyWorld_make_unit_melee_ammo_type((v.Attack_DMG_Base * index), v.Attack_DMG_Type),
      range = (v.Attack_Range_Base * index),
      cooldown = v.Attack_Speed_Base,
      sound = make_biter_roars(0.5),
      animation = DyWorld_biterattackanimation((0.25 * index), v.Tint_1, v.Tint_2)
    },
    vision_distance = 30,
    movement_speed = v.Speed,
    distance_per_frame = 0.15,
    -- in pu
    pollution_to_join_attack = ((v.Pollution_to_Join_Attack_Base * index) * index),
    corpse = dy..k.."-"..index.."-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = make_biter_calls(0.4),
    dying_sound = make_biter_dying_sounds(0.5),
    run_animation = DyWorld_biterrunanimation((0.25 * index), v.Tint_1, v.Tint_2)
  },
  {
    type = "corpse",
    name = dy..k.."-"..index.."-corpse",
	localised_name = {"enemies-name.unit-corpse", {"enemies-name."..index}, {"enemies-name."..k}},
    icon = "__base__/graphics/icons/medium-biter-corpse.png",
    icon_size = 32,
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"},
    subgroup = "corpses",
    order = dy..k.."-"..index.."-corpse",
    dying_speed = 0.04,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "corpse",
    animation = DyWorld_biterdieanimation((0.25 * index), v.Tint_1, v.Tint_2)
  },
})
		end
	elseif v.Type == "spitter" then
		for index = 1,v.Unit_Amount do
data:extend(
{
  {
    type = "unit",
    name = dy..k.."-"..index,
	localised_name = {"enemies-name.unit", {"enemies-name."..index}, {"enemies-name."..k}},
    icon = "__base__/graphics/icons/medium-biter.png",
    icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = ((v.Base_HP*index)*index),
    order = dy..k.."-"..index,
    subgroup = "enemies",
	DyWorld_Tier = index,
    resistances = Increase_Resistances(v.Resistances, index),
    healing_per_tick = ((0.01 * index) * index),
    collision_box = scale_bounding_box({{-0.4, -0.4}, {0.4, 0.4}}, (0.25 * index)),
	--collision_mask = {"item-layer", "object-layer", "player-layer", "water-tile", "layer-14"},
    selection_box = scale_bounding_box({{-0.7, -1.5}, {0.7, 0.3}}, (0.25 * index)),
    sticker_box = scale_bounding_box({{-0.6, -0.8}, {0.6, 0}}, (0.25 * index)),
    distraction_cooldown = (330 - (30 * index)),
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    attack_parameters = DyWorld_spitter_attack_parameters(
    {
      range = (v.Attack_Range_Base * index ),
      min_attack_distance = (v.Attack_Range_Base / 2 ),
      cooldown = (v.Attack_Speed_Base * index),
      damage_modifier = (1 + (index / 10)), 
      scale = (0.25 * index),
      tint = v.Tint_1,
      roarvolume = 0.6,
	  projectile = dy..k.."-"..index.."-projectile"
    }),
    vision_distance = 30,
    movement_speed = v.Speed,
    distance_per_frame = 0.15,
    -- in pu
    pollution_to_join_attack = ((v.Pollution_to_Join_Attack_Base * index) * index),
    corpse = dy..k.."-"..index.."-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = make_biter_calls(0.4),
    dying_sound = make_biter_dying_sounds(0.5),
    run_animation = DyWorld_spitterrunanimation((0.25 * index), v.Tint_1)
  },
  {
    type = "corpse",
    name = dy..k.."-"..index.."-corpse",
	localised_name = {"enemies-name.unit-corpse", {"enemies-name."..index}, {"enemies-name."..k}},
    icon = "__base__/graphics/icons/medium-biter-corpse.png",
    icon_size = 32,
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"},
    subgroup = "corpses",
    order = dy..k.."-"..index.."-corpse",
    dying_speed = 0.04,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "corpse",
    animation = DyWorld_spitterdyinganimation((0.25 * index), v.Tint_1)
  },
  {
    type = "projectile",
    name = dy..k.."-"..index.."-projectile",
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
            damage = {amount = (v.Attack_DMG_Base * index), type = v.Attack_DMG_Type}
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

