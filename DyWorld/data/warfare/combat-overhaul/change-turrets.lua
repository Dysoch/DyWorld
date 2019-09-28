require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if data.raw["artillery-turret"]["artillery-turret"] then
	data.raw["artillery-turret"]["artillery-turret"].minable.mining_time = 5
	data.raw["artillery-turret"]["artillery-turret"].manual_range_modifier = 3.5
	data.raw["artillery-turret"]["artillery-turret"].max_health = 15000
end
