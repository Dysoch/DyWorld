require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for Dmg, Data in pairs(Damages) do
DyWorld_control_name = "dyworld-enemies-tier-"..Data.Tier
data:extend(
{
  {
    type = "unit-spawner",
    name = Dmg.."-spawner",
	localised_name = {"looped-name.enemy-base", {"damage-type-name."..Dmg}},
	icons = {
	  {
	    icon = "__base__/graphics/icons/biter-spawner.png",
		tint = Data.Color,
	  },
	},
    icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = Round(((Data.Health * 5) * Data.Tier) * Data.Tier),
	Tier = Data.Tier,
    order = Dmg.."-base"..Data.Tier,
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
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/creatures/spawner.ogg",
          volume = 1.0
        }
      },
      apparent_volume = 2
    },
    dying_sound =
    {
      {
        filename = "__base__/sound/creatures/spawner-death-1.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/creatures/spawner-death-2.ogg",
        volume = 1.0
      }
    },
    healing_per_tick = 0.02 * Data.Tier,
    collision_box = {{-3.2, -2.2}, {2.2, 2.2}},
    map_generator_bounding_box = {{-4.2, -3.2}, {3.2, 3.2}},
    selection_box = {{-3.5, -2.5}, {2.5, 2.5}},
    -- in ticks per 1 pu
    pollution_absorption_absolute = 20,
    pollution_absorption_proportional = 0.01,
    corpse = Dmg.."-spawner-corpse",
    dying_explosion = "blood-explosion-huge",
    max_count_of_owned_units = math.floor(7 * Data.Tier),
    max_friends_around_to_spawn = math.floor(5 * Data.Tier),
    animations =
    {
      spawner_idle_animation(0, Data.Color),
      spawner_idle_animation(1, Data.Color),
      spawner_idle_animation(2, Data.Color),
      spawner_idle_animation(3, Data.Color)
    },
    integration =
    {
      sheet = spawner_integration()
    },
    result_units = (function()
                     local res = {}
                     res[1] = {Dmg.."-small-biter", {{0.0, 0.3}, {0.6, 0.0}}}
                     res[2] = {Dmg.."-small-spitter", {{0.1, 0.0}, {0.3, 0.3}, {0.5, 0.0}}}
                     res[3] = {Dmg.."-medium-biter", {{0.2, 0.0}, {0.4, 0.3}, {0.6, 0.0}}}
                     res[4] = {Dmg.."-medium-spitter", {{0.3, 0.0}, {0.5, 0.3}, {0.7, 0.0}}}
                     res[5] = {Dmg.."-big-biter", {{0.4, 0.0}, {0.6, 0.3}, {0.8, 0.0}}}
                     res[6] = {Dmg.."-big-spitter", {{0.5, 0.0}, {0.7, 0.3}, {0.9, 0.0}}}
                     res[7] = {Dmg.."-huge-biter", {{0.6, 0.0}, {1.0, 0.2}}}
                     res[8] = {Dmg.."-huge-spitter", {{0.7, 0.0}, {1.0, 0.2}}}
                     res[9] = {Dmg.."-behemoth-biter", {{0.8, 0.0}, {1.0, 0.3}}}
                     res[10] = {Dmg.."-behemoth-spitter", {{0.9, 0.0}, {1.0, 0.3}}}
                     return res
                   end)(),
    spawning_cooldown = {360, 150},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    autoplace = DyWorld_enemy_spawner_autoplace(Data.Spawn_Distance, DyWorld_control_name),
    call_for_help_radius = 25 + Data.Range,
  },
  {
    type = "corpse",
    name = Dmg.."-spawner-corpse",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__base__/graphics/icons/biter-spawner-corpse.png",
    icon_size = 32,
    collision_box = {{-2, -2}, {2, 2}},
    selection_box = {{-2, -2}, {2, 2}},
    selectable_in_game = false,
    dying_speed = 0.04,
    time_before_removed = 15 * 60 * 60,
    subgroup = "corpses",
    order = "c[corpse]-b[biter-spawner]",
    final_render_layer = "remnants",
    animation =
    {
      spawner_die_animation(0, Data.Color),
      spawner_die_animation(1, Data.Color),
      spawner_die_animation(2, Data.Color),
      spawner_die_animation(3, Data.Color)
    },
    ground_patch =
    {
      sheet = spawner_integration()
    }
  }
})
		if Data.Enemy_Resistances then
			for k,v in pairs(Data.Enemy_Resistances) do
				local RESIST = {type = k, percent = Round(v.Percent), decrease = Round(v.Decrease)}
				table.insert(data.raw["unit-spawner"][Dmg.."-spawner"].resistances, RESIST)
			end
		end
		if settings.startup["DyWorld_Warfare_Enemies_Effects"].value then
		if Data.Dying_Explosion then
		if not data.raw["unit-spawner"][Dmg.."-spawner"].dying_trigger_effect then data.raw["unit-spawner"][Dmg.."-spawner"].dying_trigger_effect = {} end
			local INSERT_1 = {
                type = "nested-result",
                action =
				{
                  type = "area",
                  radius = 12,
                  action_delivery =
                  {
					type = "instant",
					target_effects =
					{
					  {
                        type = "damage",
                        damage = {amount = ((25*Data.Tier)*Damage_Mod[Dmg]), type = Dmg}
                      },
                    }
                  }
                }
              }
            local INSERT_2 = {
                type = "create-entity",
                entity_name = Dmg.."-enemy-base-explosion-behemoth"
              }
			table.insert(data.raw["unit-spawner"][Dmg.."-spawner"].dying_trigger_effect, INSERT_1)
			table.insert(data.raw["unit-spawner"][Dmg.."-spawner"].dying_trigger_effect, INSERT_2)
		end
		if Data.Dying_Splash then
		if not data.raw["unit-spawner"][Dmg.."-spawner"].dying_trigger_effect then data.raw["unit-spawner"][Dmg.."-spawner"].dying_trigger_effect = {} end
            local INSERT_1 = {
                type = "nested-result",
                action =
				{
                  type = "area",
                  radius = 25,
                  action_delivery =
                  {
					type = "instant",
					target_effects =
					{
					  {
                        type = "create-fire",
                        entity_name = Dmg.."-enemy-splash-behemoth"
                    }
                    }
                  }
                }
              }
			table.insert(data.raw["unit-spawner"][Dmg.."-spawner"].dying_trigger_effect, INSERT_1)
		end
		end
end
