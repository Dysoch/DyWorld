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
			v.percent = Round((v.percent * Tier) , 2)
		end
		if v.decrease ~= 0 then
			v.decrease = Round((v.decrease * Tier) , 2)
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
	if v.Spawner and v.Unit_Amount == 10 and v.Spawn_Method == "base" then
data:extend(
{
  {
    type = "unit-spawner",
    name = dy..k.."-spawner",
	localised_name = {"enemies-name.spawner", {"enemies-name."..k}},
    icon = "__base__/graphics/icons/biter-spawner.png",
    icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    max_health = Round((v.Base_HP * v.Spawner_Strength), 0),
    order = dy..k.."-spawner",
    subgroup = "enemies",
    resistances = Increase_Resistances(v.Resistances, v.Spawner_Strength),
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
    healing_per_tick = Round((0.02 * v.Spawner_Strength), 2),
    collision_box = {{-3.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-3.5, -2.5}, {2.5, 2.5}},
    -- in ticks per 1 pu
    pollution_absorbtion_absolute = Round((20 * v.Spawner_Strength), 2),
    pollution_absorbtion_proportional = Round((0.01 * v.Spawner_Strength), 2),
    corpse = dy..k.."-spawner-corpse",
    dying_explosion = "blood-explosion-huge",
    max_count_of_owned_units = Round((10 * (v.Spawner_Strength / 2)), 0),
    max_friends_around_to_spawn = Round((5 * v.Spawner_Strength), 0),
    animations =
    {
      spawner_idle_animation(0, v.Tint_1),
      spawner_idle_animation(1, v.Tint_1),
      spawner_idle_animation(2, v.Tint_1),
      spawner_idle_animation(3, v.Tint_1)
    },
    result_units = (function()
                     local res = {}
                     res[1] = {dy..k.."-1", {{0.0, 0.0}, {0.3, 0.33}, {0.5, 0.0}}}
                     res[2] = {dy..k.."-2", {{0.1, 0.0}, {0.4, 0.33}, {0.6, 0.0}}}
                     res[3] = {dy..k.."-3", {{0.2, 0.0}, {0.5, 0.33}, {0.7, 0.0}}}
                     res[4] = {dy..k.."-4", {{0.3, 0.0}, {0.6, 0.33}, {0.8, 0.0}}}
                     res[5] = {dy..k.."-5", {{0.4, 0.0}, {0.7, 0.33}, {0.9, 0.0}}}
                     res[6] = {dy..k.."-6", {{0.5, 0.0}, {0.8, 0.33}, {1.0, 0.0}}}
                     res[7] = {dy..k.."-7", {{0.6, 0.0}, {0.9, 0.33}, {1.0, 0.1}}}
                     res[8] = {dy..k.."-8", {{0.7, 0.0}, {1.0, 0.2}}}
                     res[9] = {dy..k.."-9", {{0.8, 0.0}, {1.0, 0.3}}}
                     res[10] = {dy..k.."-10", {{0.9, 0.0}, {1.0, 0.4}}}
                     return res
                   end)(),
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {Round((360 / v.Spawner_Strength), 0), Round((150 / v.Spawner_Strength), 0)},
    spawning_radius = Round((10 * v.Spawner_Strength), 0),
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    autoplace = enemy_spawner_autoplace(0),
    call_for_help_radius = 50
  },
  {
    type = "corpse",
    name = dy..k.."-spawner-corpse",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__base__/graphics/icons/biter-spawner-corpse.png",
    icon_size = 32,
    collision_box = {{-2, -2}, {2, 2}},
    selection_box = {{-2, -2}, {2, 2}},
    selectable_in_game = false,
    dying_speed = 0.04,
    time_before_removed = 15 * 60 * 60,
    subgroup = "corpses",
    order = dy..k.."-spawner-corpse",
    final_render_layer = "remnants",
    animation =
    {
      spawner_die_animation(0, v.Tint_1),
      spawner_die_animation(1, v.Tint_1),
      spawner_die_animation(2, v.Tint_1),
      spawner_die_animation(3, v.Tint_1)
    }
  },
})
	end
end

