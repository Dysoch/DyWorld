require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if data.raw.projectile["cluster-grenade"] then
	data.raw.projectile["cluster-grenade"].action[2].action_delivery.range_deviation = 0.25
	data.raw.projectile["cluster-grenade"].action[2].action_delivery.max_range = 15
end
