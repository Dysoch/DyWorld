require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

data.raw["fluid-wagon"]["fluid-wagon"].capacity = 500000

data.raw["heat-pipe"]["heat-pipe"].heat_buffer.max_temperature = 5500
data.raw["heat-pipe"]["heat-pipe"].render_layer = "ground-tile"
data.raw["heat-pipe"]["heat-pipe"].collision_mask = {"doodad-layer", "object-layer", "water-tile"}

data.raw.unit["small-biter"].Tier = 1
data.raw.unit["medium-biter"].Tier = 2
data.raw.unit["big-biter"].Tier = 3
data.raw.unit["behemoth-biter"].Tier = 4

data.raw.unit["small-spitter"].Tier = 2
data.raw.unit["medium-spitter"].Tier = 3
data.raw.unit["big-spitter"].Tier = 4
data.raw.unit["behemoth-spitter"].Tier = 5

data.raw["unit-spawner"]["biter-spawner"].Tier = 1
data.raw["unit-spawner"]["spitter-spawner"].Tier = 2

data.raw.turret["small-worm-turret"].Tier = 1
data.raw.turret["medium-worm-turret"].Tier = 2
data.raw.turret["big-worm-turret"].Tier = 3
data.raw.turret["behemoth-worm-turret"].Tier = 4

data.raw.unit["small-biter"].Loot_Tier = 11
data.raw.unit["medium-biter"].Loot_Tier = 22
data.raw.unit["big-biter"].Loot_Tier = 33
data.raw.unit["behemoth-biter"].Loot_Tier = 44

data.raw.unit["small-spitter"].Loot_Tier = 22
data.raw.unit["medium-spitter"].Loot_Tier = 33
data.raw.unit["big-spitter"].Loot_Tier = 44
data.raw.unit["behemoth-spitter"].Loot_Tier = 55

data.raw["unit-spawner"]["biter-spawner"].Loot_Tier = 15
data.raw["unit-spawner"]["spitter-spawner"].Loot_Tier = 29

data.raw.turret["small-worm-turret"].Loot_Tier = 13
data.raw.turret["medium-worm-turret"].Loot_Tier = 24
data.raw.turret["big-worm-turret"].Loot_Tier = 35
data.raw.turret["behemoth-worm-turret"].Loot_Tier = 46

data.raw.character.character.loot_pickup_distance = Character_Loot_Range