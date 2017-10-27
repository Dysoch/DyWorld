require "data/prefix"

--[[for k, v in pairs(data.raw.resource) do
	v.minable.hardness = v.minable.hardness*2
end

data.raw.resource["crude-oil"].minable.hardness = 1]]--

data.raw.resource["iron-ore"].localised_name = {"edits-name.iron-ore"}
data.raw.resource["copper-ore"].localised_name = {"edits-name.copper-ore"}