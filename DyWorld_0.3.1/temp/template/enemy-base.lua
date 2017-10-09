require "data/prefix"

Data_Table_Enemy_Base = {
	-- Sanguisugea
	{
		Name = dyworld_prefix.."enemy-base-001",
		Health = 17500,
		Tint = {r=0.56, g=0.46, b=0.42, a=0.65},
		Healing = 0.25,
		Units = 10,
		Friends = 5,
		Absortion_Absolute = 20,
		Absorbtion_Proportional = 0.01,
		Zero_Evolution_Spawning = (60*5),
		Max_Evolution_Spawning = (60*1),
		Spawn_Range = 10,
		Spawn_Spacing = 3,
		Help = 50,
		Units_Spawn_Rate = {{dyworld_prefix.."enemy-001", {{0.0, 0.3}, {0.4, 0.0}}},{dyworld_prefix.."enemy-002", {{0.2, 0.3}, {0.6, 0.0}}},{dyworld_prefix.."enemy-003", {{0.4, 0.3}, {0.8, 0.0}}},{dyworld_prefix.."enemy-004", {{0.6, 0.0}, {1.0, 0.3}}},{dyworld_prefix.."enemy-005", {{0.8, 0.0}, {1.0, 0.5}}},{dyworld_prefix.."enemy-006", {{0.9, 0.0}, {1.0, 0.2}}}},
	},
	-- Zeptipods
	{
		Name = dyworld_prefix.."enemy-base-101",
		Health = 150000,
		Tint = {r=0.56, g=0.46, b=0.42, a=0.65},
		Healing = 5,
		Units = 15,
		Friends = 5,
		Absortion_Absolute = 20,
		Absorbtion_Proportional = 0.01,
		Zero_Evolution_Spawning = (60*5),
		Max_Evolution_Spawning = (60*1),
		Spawn_Range = 10,
		Spawn_Spacing = 3,
		Help = 50,
		Units_Spawn_Rate = {{dyworld_prefix.."enemy-101", {{0.0, 0.3}, {0.4, 0.0}}},{dyworld_prefix.."enemy-102", {{0.2, 0.3}, {0.6, 0.0}}},{dyworld_prefix.."enemy-103", {{0.4, 0.3}, {0.8, 0.0}}},{dyworld_prefix.."enemy-104", {{0.6, 0.0}, {1.0, 0.3}}},{dyworld_prefix.."enemy-105", {{0.8, 0.0}, {1.0, 0.5}}},{dyworld_prefix.."enemy-106", {{0.9, 0.0}, {1.0, 0.2}}}},
	},
}

function DyWorld_Enemy_Base(DATA)
  local result =
  {
    type = "unit-spawner",
    name = DATA.Name,
    icon = "__base__/graphics/icons/biter-spawner.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    max_health = DATA.Health,
    order = DATA.Name,
    subgroup = "enemies",
    resistances =
    {
    },
    working_sound = {
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
    healing_per_tick = DATA.Healing,
    collision_box = {{-3.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-3.5, -2.5}, {2.5, 2.5}},
    -- in ticks per 1 pu
    pollution_absorbtion_absolute = DATA.Absortion_Absolute,
    pollution_absorbtion_proportional = DATA.Absorbtion_Proportional,
    corpse = DATA.Name.."-corpse",
    dying_explosion = "blood-explosion-huge",
    max_count_of_owned_units = DATA.Units,
    max_friends_around_to_spawn = DATA.Friends,
    animations =
    {
      spawner_idle_animation(0, DATA.Tint),
      spawner_idle_animation(1, DATA.Tint),
      spawner_idle_animation(2, DATA.Tint),
      spawner_idle_animation(3, DATA.Tint)
    },
    result_units = (function()
                     local res = {}
                     res[1] = {"small-biter", {{0.0, 0.3}, {0.6, 0.0}}}
                     res[2] = {"medium-biter", {{0.2, 0.0}, {0.6, 0.3}, {0.7, 0.1}}}
                     res[3] = {"big-biter", {{0.5, 0.0}, {1.0, 0.4}}}
                     res[4] = {"behemoth-biter", {{0.9, 0.0}, {1.0, 0.3}}}
                     return res
                   end)(),
    spawning_cooldown = {DATA.Zero_Evolution_Spawning, DATA.Max_Evolution_Spawning},
    spawning_radius = DATA.Spawn_Range,
    spawning_spacing = DATA.Spawn_Spacing,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    autoplace = nil,
    call_for_help_radius = DATA.Help
  }
  return result
end

function DyWorld_Enemy_Base_Corpse(DATA)
  local result =
  {
    type = "corpse",
    name = DATA.Name.."-corpse",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__base__/graphics/icons/biter-spawner-corpse.png",
    collision_box = {{-2, -2}, {2, 2}},
    selection_box = {{-2, -2}, {2, 2}},
    selectable_in_game = false,
    dying_speed = 0.04,
    time_before_removed = 15 * 60 * 60,
    subgroup = "corpses",
    order = DATA.Name,
    final_render_layer = "remnants",
    animation =
    {
      spawner_die_animation(0, DATA.Tint),
      spawner_die_animation(1, DATA.Tint),
      spawner_die_animation(2, DATA.Tint),
      spawner_die_animation(3, DATA.Tint)
    }
  }
  return result
end

for k,v in pairs(Data_Table_Enemy_Base) do
data:extend(
	{
		DyWorld_Enemy_Base(v),
		DyWorld_Enemy_Base_Corpse(v)
	})
	data.raw["unit-spawner"][v.Name].result_units = v.Units_Spawn_Rate
end