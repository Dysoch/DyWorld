require "data/core/functions/prefix"
require "data/core/functions/colors"

data.raw["unit-spawner"]["biter-spawner"].autoplace = nil
data.raw["unit-spawner"]["spitter-spawner"].autoplace = nil

data.raw.turret["small-worm-turret"].autoplace = nil
data.raw.turret["medium-worm-turret"].autoplace = nil
data.raw.turret["big-worm-turret"].autoplace = nil
data.raw.turret["behemoth-worm-turret"].autoplace = nil

data.raw["map-gen-presets"]["default"]["death-world"].basic_settings.autoplace_controls = nil
data.raw["map-gen-presets"]["default"]["death-world-marathon"].basic_settings.autoplace_controls = nil
data.raw["map-gen-presets"]["default"]["rail-world"].basic_settings.autoplace_controls["enemy-base"] = nil

data.raw["autoplace-control"]["enemy-base"] = nil
