require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Warfare"].value and settings.startup["DyWorld_Warfare_Enemies"].value then

for Dmg, Data in pairs(Damages) do
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
		tint = Data.Color,
	  },
	},
    icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Round(((Data.Health * Scale) * Data.Tier) * Data.Tier),
	Tier = Data.Tier,
	Loot_Tier = ((Data.Tier * 10) * Scale),
    order = Dmg.."-biter-"..Data.Tier.."-"..Size,
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
    healing_per_tick = 0.01 * Data.Tier,
    collision_box = DyWorld_scale_bounding_box({{-0.4, -0.4}, {0.4, 0.4}}, Scale),
    selection_box = DyWorld_scale_bounding_box({{-0.7, -1.5}, {0.7, 0.3}}, Scale),
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 10 * Data.Tier,
    attack_parameters =
    {
      type = "projectile",
      ammo_type = DyWorld_make_unit_melee_ammo_type(((Data.Tier * Damage_Mod[Dmg]) * Scale), Dmg),
      range = 1 * Scale,
      cooldown = 40 / Data.Tier,
      sound = Dy_sounds_biter_roars(0.5),
      animation = biterattackanimation(Scale, Data.Color, Data.Color)
    },
    vision_distance = 5 + Data.Range,
    movement_speed = (0.2 + (Data.Tier / 100)) * Data.Enemy_Speed,
    distance_per_frame = 0.188,
    -- in pu
    pollution_to_join_attack = Round(((15 * Data.Tier) * Scale) * Data.Enemy_Pollution),
    corpse = Dmg.."-"..Size.."-biter-corpse",
    dying_explosion = "blood-explosion-small",
    working_sound = Dy_sounds_biter_calls(0.4),
    dying_sound = Dy_sounds_biter_dying(0.5),
    run_animation = biterrunanimation(Scale, Data.Color, Data.Color),
    ai_settings = DyWorld_ai_settings(true, true, true),
  },
  add_biter_die_animation(Scale, Data.Color, Data.Color,
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
		if Data.Enemy_Resistances then
			for k,v in pairs(Data.Enemy_Resistances) do
				local RESIST = {type = k, percent = Round(v.Percent * Scale), decrease = Round(v.Decrease * Scale)}
				table.insert(data.raw.unit[Dmg.."-"..Size.."-biter"].resistances, RESIST)
			end
		end
		if settings.startup["DyWorld_Warfare_Enemies_Effects"].value then
		if Data.Dying_Explosion then
		if not data.raw.unit[Dmg.."-"..Size.."-biter"].dying_trigger_effect then data.raw.unit[Dmg.."-"..Size.."-biter"].dying_trigger_effect = {} end
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
                        damage = {amount = ((5*Data.Tier)*Damage_Mod[Dmg]), type = Dmg}
                      },
                    }
                  }
                }
              }
            local INSERT_2 = {
                type = "create-entity",
                entity_name = Dmg.."-enemy-explosion-"..Size
              }
			table.insert(data.raw.unit[Dmg.."-"..Size.."-biter"].dying_trigger_effect, INSERT_1)
			table.insert(data.raw.unit[Dmg.."-"..Size.."-biter"].dying_trigger_effect, INSERT_2)
		end
		if Data.Dying_Splash then
		if not data.raw.unit[Dmg.."-"..Size.."-biter"].dying_trigger_effect then data.raw.unit[Dmg.."-"..Size.."-biter"].dying_trigger_effect = {} end
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
			table.insert(data.raw.unit[Dmg.."-"..Size.."-biter"].dying_trigger_effect, INSERT_1)
		end
		end
	end
end

end