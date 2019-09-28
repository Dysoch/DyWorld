require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if data.raw.gun["rocket-launcher"] then
	data.raw.gun["rocket-launcher"].attack_parameters.range = 75
end

if data.raw.gun["artillery-wagon-cannon"] then
	data.raw.gun["artillery-wagon-cannon"].attack_parameters.range = 10 * 32
end
