require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if data.raw.ammo["rocket"] then
	data.raw.ammo["rocket"].ammo_type.action.action_delivery.direction_deviation = 0.25
	data.raw.ammo["rocket"].ammo_type.action.action_delivery.range_deviation = 0.25
	data.raw.ammo["rocket"].ammo_type.action.action_delivery.max_range = 35
end

if data.raw.ammo["explosive-rocket"] then
	data.raw.ammo["explosive-rocket"].ammo_type.action.action_delivery.direction_deviation = 0.25
	data.raw.ammo["explosive-rocket"].ammo_type.action.action_delivery.range_deviation = 0.25
	data.raw.ammo["explosive-rocket"].ammo_type.action.action_delivery.max_range = 50
end

if data.raw.ammo["atomic-bomb"] then
	data.raw.ammo["atomic-bomb"].ammo_type.action.action_delivery.direction_deviation = 0.25
	data.raw.ammo["atomic-bomb"].ammo_type.action.action_delivery.range_deviation = 0.25
	data.raw.ammo["atomic-bomb"].ammo_type.action.action_delivery.max_range = 125
end