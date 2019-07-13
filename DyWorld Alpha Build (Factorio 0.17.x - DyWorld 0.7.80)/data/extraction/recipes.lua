require "data/prefix"

local Recipe_Table = {
	[dy.."iron-electric-drill"] = {{"iron-gear-wheel", 2}, {dy.."binding-iron", 1}},
	[dy.."steel-electric-drill"] = {{"steel-gear-wheel", 2}, {dy.."binding-steel", 1}},
}

for k,v in pairs(Recipe_Table) do
	for _,z in pairs(v) do
		if data.raw.recipe[k] then
			table.insert(data.raw.recipe[k].ingredients,z)	
		end
	end
end