require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Warfare"].value and settings.startup["DyWorld_Warfare_Enemies"].value then

data.raw.unit["small-spitter"].attack_parameters.damage_modifier = 1
data.raw.unit["medium-spitter"].attack_parameters.damage_modifier = 1
data.raw.unit["big-spitter"].attack_parameters.damage_modifier = 1
data.raw.unit["behemoth-spitter"].attack_parameters.damage_modifier = 1

for Dmg, Data in pairs(Damages) do
	for Size, Scale in pairs(Enemy_Names_Scales) do
data:extend(
{
  {
    type = "unit",
    name = Dmg.."-"..Size.."-spitter",
	localised_name = {"looped-name.enemy-unit", {"looped-name."..Size}, {"damage-type-name."..Dmg}},
	icons = {
	  {
	    icon = "__base__/graphics/icons/medium-spitter.png",
		tint = Data.Color,
	  },
	},
    icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Round(((Data.Health * Scale) * Data.Tier) * Data.Tier),
	Tier = Data.Tier,
	Loot_Tier = ((Data.Tier * 12) * Scale),
    order = Dmg.."-spitter"..Data.Tier.."-"..Size,
    subgroup = "enemies",
    resistances =
    {
      {
        type = Dmg,
        percent = 100
      },
      {
        type = Data.Opposite,
        percent = -100
      },
    },
    spawning_time_modifier = 3,
    healing_per_tick = 0.01 * Data.Tier,
    collision_box = DyWorld_scale_bounding_box({{-0.4, -0.4}, {0.4, 0.4}}, Scale),
    selection_box = DyWorld_scale_bounding_box({{-0.7, -1.0}, {0.7, 1.0}}, Scale),
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 10 * Data.Tier,
    alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
    attack_parameters = DyWorld_spitter_attack_parameters(
    {
      acid_stream_name = Dmg.."-stream-spitter-"..Size,
      range = math.floor(Data.Range * Enemy_Names_Scales[Size]),
      min_attack_distance = math.floor(Data.Range * 0.3),
      cooldown = Round((100 / Range_Mod[Dmg]) * Enemy_Names_Scales[Size]),
      damage_modifier = 1, 
      scale = Scale,
      tint1 = Data.Color,
      tint2 = Data.Color,
      roarvolume = 0.6,
    }),
    vision_distance = 5 + Data.Range,
    movement_speed = (0.2 + (Data.Tier / 100)) * Data.Enemy_Speed,
    distance_per_frame = 0.188,
    -- in pu
    pollution_to_join_attack = Round(((25 * Data.Tier) * Scale) * Data.Enemy_Pollution),
    corpse = Dmg.."-"..Size.."-spitter-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = Dy_sounds_biter_calls(0.4),
    dying_sound = Dy_sounds_biter_dying(0.5),
    run_animation = spitterrunanimation(Scale, Data.Color, Data.Color),
    ai_settings = DyWorld_ai_settings(true, true, true),
  },
  add_spitter_die_animation(Scale, Data.Color, Data.Color,
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
	damage = ((Data.Tier * Damage_Mod[Dmg]) * Scale),
	damage_type = Dmg,
  }),
  DyWorld_spitter_splash_fire({
    name =  Dmg.."-splash-fire-spitter-"..Size,
    scale = Scale,
    tint = Damage_Color[Dmg],
    ground_patch_scale = Scale * 0.65,
    patch_tint_multiplier = 0.7,
    splash_damage_per_tick = (Data.Tier * Damage_Mod[Dmg]),
    splash_damage_type = Dmg,
    sticker_name = Dmg.."-sticker-"..Size,
  }),
  DyWorld_spitter_sticker({
    name = Dmg.."-sticker-"..Size,
    tint = Damage_Color[Dmg],
    slow_player_movement = 0.6,
    slow_vehicle_speed = 0.6,
    slow_vehicle_friction = 1.5,
    slow_seconds = (Data.Tier),
  }),
})
		if Data.Enemy_Resistances then
			for k,v in pairs(Data.Enemy_Resistances) do
				local RESIST = {type = k, percent = Round(v.Percent * Scale), decrease = Round(v.Decrease * Scale)}
				table.insert(data.raw.unit[Dmg.."-"..Size.."-spitter"].resistances, RESIST)
			end
		end
		if settings.startup["DyWorld_Warfare_Enemies_Effects"].value then
		if Data.Dying_Explosion then
		if not data.raw.unit[Dmg.."-"..Size.."-spitter"].dying_trigger_effect then data.raw.unit[Dmg.."-"..Size.."-spitter"].dying_trigger_effect = {} end
			local INSERT_1 = {
                type = "nested-result",
                action =
				{
                  type = "area",
                  radius = 5 * Scale,
                  action_delivery =
                  {
					type = "instant",
					target_effects =
					{
					  {
                        type = "damage",
                        damage = {amount = ((10*Data.Tier)*Damage_Mod[Dmg]), type = Dmg}
                      },
                    }
                  }
                }
              }
            local INSERT_2 = {
                type = "create-entity",
                entity_name = Dmg.."-enemy-explosion-"..Size
              }
			table.insert(data.raw.unit[Dmg.."-"..Size.."-spitter"].dying_trigger_effect, INSERT_1)
			table.insert(data.raw.unit[Dmg.."-"..Size.."-spitter"].dying_trigger_effect, INSERT_2)
		end
		if Data.Dying_Splash then
		if not data.raw.unit[Dmg.."-"..Size.."-spitter"].dying_trigger_effect then data.raw.unit[Dmg.."-"..Size.."-spitter"].dying_trigger_effect = {} end
            local INSERT_1 = {
                type = "nested-result",
                action =
				{
                  type = "area",
                  radius = 5 * Scale,
                  action_delivery =
                  {
					type = "instant",
					target_effects =
					{
					  {
                        type = "create-fire",
                        entity_name = Dmg.."-enemy-splash-"..Size
                    }
                    }
                  }
                }
              }
			table.insert(data.raw.unit[Dmg.."-"..Size.."-spitter"].dying_trigger_effect, INSERT_1)
		end
		end
	end
end

end