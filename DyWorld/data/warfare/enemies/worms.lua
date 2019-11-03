require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Warfare"].value and settings.startup["DyWorld_Warfare_Enemies"].value then

for Dmg, Data in pairs(Damages) do
	for Size, Scale in pairs(Enemy_Names_Scales) do
DyWorld_control_name = "dyworld-enemies-tier-"..Data.Tier
data:extend(
{
  {
    type = "turret",
    name = Dmg.."-"..Size.."-worm",
	localised_name = {"looped-name.enemy-worm", {"looped-name."..Size}, {"damage-type-name."..Dmg}},
	icons = {
	  {
	    icon = "__base__/graphics/icons/medium-worm.png",
		tint = Data.Color,
	  },
	},
    icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    max_health = Round(((Data.Health * Scale) * Data.Tier) * Data.Tier),
	Tier = Data.Tier,
	Loot_Tier = ((Data.Tier * 14) * Scale),
    order = Dmg.."-worm"..Data.Tier.."-"..Size,
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
    healing_per_tick = 0.015 * Data.Tier,
    collision_box = DyWorld_scale_bounding_box({{-1.1, -1.0}, {1.1, 1.0}}, Scale),
    selection_box = DyWorld_scale_bounding_box({{-1.1, -1.0}, {1.1, 1.0}}, Scale),
    map_generator_bounding_box = {{-2.1, -2.0}, {2.1, 2.0}},
    shooting_cursor_size = 3.5,
    rotation_speed = 1,
    corpse = Dmg.."-"..Size.."-worm-corpse",
    dying_explosion = "blood-explosion-big",
    dying_sound = make_worm_dying_sounds(1),

    folded_speed = 0.01,
    folded_speed_secondary = 0.024,
    folded_animation = worm_folded_animation(Scale, Data.Color),
    preparing_speed = 0.024,
    prepared_speed = 0.024,
    prepared_speed_secondary = 0.012,
    preparing_animation = worm_preparing_animation(Scale, Data.Color, "forward"),
    preparing_sound = make_worm_standup_sounds(1),
    prepared_sound = make_worm_breath(0.8),
    prepared_alternative_speed = 0.014,
    prepared_alternative_speed_secondary = 0.010,
    prepared_alternative_chance = 0.2,
    prepared_alternative_animation = worm_prepared_alternative_animation(Scale, Data.Color),
    prepared_alternative_sound = make_worm_roar_alternative(0.7),
    prepared_animation = worm_prepared_animation(Scale, Data.Color),
    starting_attack_speed = 0.034,
    starting_attack_animation = worm_start_attack_animation(Scale, Data.Color),
    starting_attack_sound = make_worm_roars(0.7),
    ending_attack_speed = 0.016,
    ending_attack_animation = worm_end_attack_animation(Scale, Data.Color),
    folding_speed = 0.015,
    folding_animation =  worm_preparing_animation(Scale, Data.Color, "backward"),
    folding_sound = make_worm_fold_sounds(1),
    secondary_animation = true,
    random_animation_offset = true,
    attack_from_start_frame = true,
    integration = worm_integration(Scale),
    prepare_range = Data.Range + 10,
    allow_turning_when_starting_attack = true,
    attack_parameters =
    {
      type = "stream",
      cooldown = Round((100 / Range_Mod[Dmg]) * Enemy_Names_Scales[Size]),
      range = Data.Range,
      damage_modifier = 1,
      min_range = 0,
      projectile_creation_parameters = worm_shoot_shiftings(Scale, Scale * Scale),
      use_shooter_direction = true,
      lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5,
      ammo_type =
      {
        category = "biological",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = Dmg.."-stream-spitter-"..Size,
            source_offset = {0.15, -0.5}
          }
        }
      },
    },
    build_base_evolution_requirement = 0.3,
    autoplace = DyWorld_enemy_worm_autoplace(((Data.Spawn_Distance) * Scale), DyWorld_control_name),
    call_for_help_radius = 25 + Data.Range,
  },
  {
    type = "corpse",
    name = Dmg.."-"..Size.."-worm-corpse",
    icon = "__base__/graphics/icons/small-worm-corpse.png",
    icon_size = 32,
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    dying_speed = 0.01,
    time_before_removed = 15 * 60 * 60,
    subgroup = "corpses",
    order = Dmg.."-worm"..Data.Tier.."-"..Size,
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
    final_render_layer = "lower-object-above-shadow",
    animation = worm_die_animation(Scale, Data.Color),
    ground_patch =
    {
      sheet = worm_integration(Scale)
    }
  },
})
		if Data.Enemy_Resistances then
			for k,v in pairs(Data.Enemy_Resistances) do
				local RESIST = {type = k, percent = Round(v.Percent * Scale), decrease = Round(v.Decrease * Scale)}
				table.insert(data.raw.turret[Dmg.."-"..Size.."-worm"].resistances, RESIST)
			end
		end
		if settings.startup["DyWorld_Warfare_Enemies_Effects"].value then
		if Data.Dying_Explosion then
		if not data.raw.turret[Dmg.."-"..Size.."-worm"].dying_trigger_effect then data.raw.turret[Dmg.."-"..Size.."-worm"].dying_trigger_effect = {} end
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
			table.insert(data.raw.turret[Dmg.."-"..Size.."-worm"].dying_trigger_effect, INSERT_1)
			table.insert(data.raw.turret[Dmg.."-"..Size.."-worm"].dying_trigger_effect, INSERT_2)
		end
		if Data.Dying_Splash then
		if not data.raw.turret[Dmg.."-"..Size.."-worm"].dying_trigger_effect then data.raw.turret[Dmg.."-"..Size.."-worm"].dying_trigger_effect = {} end
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
			table.insert(data.raw.turret[Dmg.."-"..Size.."-worm"].dying_trigger_effect, INSERT_1)
		end
		end
	end
end

end