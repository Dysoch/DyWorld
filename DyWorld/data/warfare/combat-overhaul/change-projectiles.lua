require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if data.raw.projectile["cluster-grenade"] then
	data.raw.projectile["cluster-grenade"].action[2].action_delivery.range_deviation = 0.25
	data.raw.projectile["cluster-grenade"].action[2].action_delivery.max_range = 15
end

if data.raw.projectile["atomic-rocket"] then
	data.raw.projectile["atomic-rocket"].action.action_delivery.target_effects[5].action.repeat_count = 4000
	data.raw.projectile["atomic-rocket"].action.action_delivery.target_effects[5].action.radius = 70
	data.raw.projectile["atomic-rocket"].action.action_delivery.target_effects[3].damage.amount = 2500
end

if data.raw.projectile["atomic-bomb-wave"] then
	data.raw.projectile["atomic-bomb-wave"].action[2].radius = 9
	data.raw.projectile["atomic-bomb-wave"].action[2].action_delivery.target_effects.damage.amount = 2500
	data.raw.projectile["atomic-bomb-wave"].action[1].action_delivery.target_effects[1].entity_name = "big-explosion"
end