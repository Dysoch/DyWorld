require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if data.raw.capsule["cluster-grenade"] then
	data.raw.capsule["cluster-grenade"].capsule_action.attack_parameters.ammo_type.action.action_delivery.direction_deviation = 0.25
	data.raw.capsule["cluster-grenade"].capsule_action.attack_parameters.ammo_type.action.action_delivery.range_deviation = 0.25
	data.raw.capsule["cluster-grenade"].capsule_action.attack_parameters.ammo_type.action.action_delivery.max_range = 25
end

if data.raw.capsule["grenade"] then
	data.raw.capsule["grenade"].capsule_action.attack_parameters.ammo_type.action.action_delivery.direction_deviation = 0.25
	data.raw.capsule["grenade"].capsule_action.attack_parameters.ammo_type.action.action_delivery.range_deviation = 0.25
	data.raw.capsule["grenade"].capsule_action.attack_parameters.ammo_type.action.action_delivery.max_range = 20
end
