local Unit_Table = {
  [1] = 0.7,
  [2] = 1,
  [3] = 1.2,
  [4] = 1.5,
  [5] = 2,
}

local Tier_Tint = {
  [1] = {{r=0.10, g=1, b=0, a=1}, {r=0.05, g=0.76, b=0.25, a=1}},
  [2] = {{r=0.20, g=0.90, b=0, a=1}, {r=0.55, g=0.76, b=0.25, a=1}},
  [3] = {{r=0.30, g=0.80, b=0, a=1}, {r=0.25, g=0.76, b=0.25, a=1}},
  [4] = {{r=0.40, g=0.70, b=0, a=1}, {r=0.75, g=0.76, b=0.25, a=1}},
  [5] = {{r=0.50, g=0.60, b=0, a=1}, {r=0.45, g=0.76, b=0.25, a=1}},
  [6] = {{r=0.60, g=0.50, b=0, a=1}, {r=0.05, g=0.76, b=0.25, a=1}},
  [7] = {{r=0.70, g=0.40, b=0, a=1}, {r=0.55, g=0.76, b=0.25, a=1}},
  [8] = {{r=0.80, g=0.30, b=0, a=1}, {r=0.24, g=0.76, b=0.25, a=1}},
  [9] = {{r=0.90, g=0.20, b=0, a=1}, {r=0.75, g=0.76, b=0.25, a=1}},
  [10] = {{r=1, g=0.10, b=0, a=1}, {r=0.45, g=0.76, b=0.25, a=1}},
}

-- TODO Water Enemies

-- TODO Flying Enemies

for i = 1, 10 do
  for Unit = 1, 5 do
    local DyWorld_Prototype_Unit = DyDs_CopyPrototype("unit", "big-biter", "dyworld-unit-"..i.."-"..Unit, true)

    DyWorld_Prototype_Unit.max_health = math.floor((500 * (i * i)) * Unit)
    DyWorld_Prototype_Unit.healing_per_tick = math.floor((0.02 * (i * i)) * Unit)
    DyWorld_Prototype_Unit.collision_box = {{(-0.4 * Unit_Table[Unit]), (-0.4 * Unit_Table[Unit])}, {(0.4 * Unit_Table[Unit]), (0.4 * Unit_Table[Unit])}}
    DyWorld_Prototype_Unit.selection_box = {{(-0.7 * Unit_Table[Unit]), (-1.5 * Unit_Table[Unit])}, {(0.7 * Unit_Table[Unit]), (0.3 * Unit_Table[Unit])}}
    DyWorld_Prototype_Unit.sticker_box = {{(-0.6 * Unit_Table[Unit]), (-0.8 * Unit_Table[Unit])}, {(0.6 * Unit_Table[Unit]), 0}}
    DyWorld_Prototype_Unit.attack_parameters = {
      type = "projectile",
      range = 1.5 * Unit_Table[Unit],
      cooldown = (10 + (i * Unit)),
      cooldown_deviation = 0.15,
      ammo_type = make_unit_melee_ammo_type(math.floor((25 * (i * i)) * Unit)),
      animation = biterattackanimation(Unit_Table[Unit], Tier_Tint[i][1], Tier_Tint[i][2]),
      range_mode = "bounding-box-to-bounding-box"
   }
    DyWorld_Prototype_Unit.vision_distance = 30 + (i * Unit)
    DyWorld_Prototype_Unit.movement_speed = 0.15 + ((i * Unit) / 100)
    DyWorld_Prototype_Unit.run_animation = biterrunanimation(Unit_Table[Unit], Tier_Tint[i][1], Tier_Tint[i][2])
    DyWorld_Prototype_Unit.corpse = "dyworld-unit-corpse-"..i.."-"..Unit
    DyWorld_Prototype_Unit.localised_name = {"enemies-name.dyworld-unit-"..i.."-"..Unit}

data:extend({
  DyWorld_Prototype_Unit,
  add_biter_die_animation(Unit_Table[Unit], Tier_Tint[i][1], Tier_Tint[i][2],
  {
    type = "corpse",
    name = "dyworld-unit-corpse-"..i.."-"..Unit,
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    icon_size = 64, icon_mipmaps = 4,
    selectable_in_game = false,
    selection_box = {{(-1 * Unit_Table[Unit]), (-1 * Unit_Table[Unit])}, {(1 * Unit_Table[Unit]), (1 * Unit_Table[Unit])}},
    subgroup="corpses",
    order = "c[corpse]-a[biter]-c[big]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"}
  })
}) 
  end

  local DyWorld_Prototype_Spawner = DyDs_CopyPrototype("unit-spawner", "biter-spawner", "dyworld-base-"..i, true)
  local DyWorld_Prototype_Spawner_Corpse = DyDs_CopyPrototype("corpse", "biter-spawner-corpse", "dyworld-base-corpse-"..i, true)

  DyWorld_Prototype_Spawner.corpse = "dyworld-base-corpse-"..i
  DyWorld_Prototype_Spawner.max_health = math.floor(5000 * (i * i))
  DyWorld_Prototype_Spawner.max_count_of_owned_units = Dy_Sett.Difficulty == "Easy" and (5 * i) or Dy_Sett.Difficulty == "Normal" and (10 * i) or Dy_Sett.Difficulty == "Hard" and (15 * i) or 5
  DyWorld_Prototype_Spawner.max_friends_around_to_spawn = Dy_Sett.Difficulty == "Easy" and (4 * i) or Dy_Sett.Difficulty == "Normal" and (9 * i) or Dy_Sett.Difficulty == "Hard" and (14 * i) or 5
  DyWorld_Prototype_Spawner.spawning_cooldown = {(360 - (10 * i)), (150 - (10 * i))}
  DyWorld_Prototype_Spawner.spawning_radius = (10 + (i + i))
  DyWorld_Prototype_Spawner.autoplace = nil
  DyWorld_Prototype_Spawner.result_units = {
    [1] = {"dyworld-unit-"..i.."-1", {{0.0, 1.0}, {0.15, 0.5}, {0.3, 0.4}, {0.45, 0.3}, {0.6, 0.2}, {1.0, 0.05}}},
    [2] = {"dyworld-unit-"..i.."-2", {{0.15, 0.5}, {0.3, 0.4}, {0.45, 0.3}, {0.6, 0.2}, {1.0, 0.1}}},
    [3] = {"dyworld-unit-"..i.."-3", {{0.3, 0.2}, {0.45, 0.3}, {0.6, 0.3}, {1.0, 0.15}}},
    [4] = {"dyworld-unit-"..i.."-4", {{0.45, 0.1}, {0.6, 0.2}, {1.0, 0.3}}},
    [5] = {"dyworld-unit-"..i.."-5", {{0.6, 0.1}, {1.0, 0.4}}},
  }
  DyWorld_Prototype_Spawner.localised_name = {"enemies-name.dyworld-base-"..i}

  DyWorld_Prototype_Spawner_Corpse.time_before_removed = 60 * 60 * 60
  
data:extend({
  DyWorld_Prototype_Spawner,
  DyWorld_Prototype_Spawner_Corpse,
})
end


require(DyDs_data_warfare.. "enemies.base-01.edits-units")
require(DyDs_data_warfare.. "enemies.base-01.edits-spawner")
require(DyDs_data_warfare.. "enemies.base-01.edits-worms")

require(DyDs_data_warfare.. "enemies.base-02.edits-units")
require(DyDs_data_warfare.. "enemies.base-02.edits-spawner")
require(DyDs_data_warfare.. "enemies.base-02.edits-worms")

require(DyDs_data_warfare.. "enemies.base-03.edits-units")
require(DyDs_data_warfare.. "enemies.base-03.edits-spawner")
require(DyDs_data_warfare.. "enemies.base-03.edits-worms")

require(DyDs_data_warfare.. "enemies.base-04.edits-units")
require(DyDs_data_warfare.. "enemies.base-04.edits-spawner")
require(DyDs_data_warfare.. "enemies.base-04.edits-worms")

require(DyDs_data_warfare.. "enemies.base-05.edits-units")
require(DyDs_data_warfare.. "enemies.base-05.edits-spawner")
require(DyDs_data_warfare.. "enemies.base-05.edits-worms")

require(DyDs_data_warfare.. "enemies.base-06.edits-units")
require(DyDs_data_warfare.. "enemies.base-06.edits-spawner")
require(DyDs_data_warfare.. "enemies.base-06.edits-worms")

require(DyDs_data_warfare.. "enemies.base-07.edits-units")
require(DyDs_data_warfare.. "enemies.base-07.edits-spawner")
require(DyDs_data_warfare.. "enemies.base-07.edits-worms")

require(DyDs_data_warfare.. "enemies.base-08.edits-units")
require(DyDs_data_warfare.. "enemies.base-08.edits-spawner")
require(DyDs_data_warfare.. "enemies.base-08.edits-worms")

require(DyDs_data_warfare.. "enemies.base-09.edits-units")
require(DyDs_data_warfare.. "enemies.base-09.edits-spawner")
require(DyDs_data_warfare.. "enemies.base-09.edits-worms")

require(DyDs_data_warfare.. "enemies.base-10.edits-units")
require(DyDs_data_warfare.. "enemies.base-10.edits-spawner")
require(DyDs_data_warfare.. "enemies.base-10.edits-worms")

require(DyDs_data_warfare.. "enemies.vanilla-base-01.edits-units")
require(DyDs_data_warfare.. "enemies.vanilla-base-01.edits-spawner")
require(DyDs_data_warfare.. "enemies.vanilla-base-01.edits-worms")

require(DyDs_data_warfare.. "enemies.vanilla-base-02.edits-units")
require(DyDs_data_warfare.. "enemies.vanilla-base-02.edits-spawner")
require(DyDs_data_warfare.. "enemies.vanilla-base-02.edits-worms")