require "data/prefix"
	
for k,v in pairs(Material_Table) do
	if Materials[v.Table].Conductivity >= 0.01 then
		DyWorld_Accumulator(v)
	end
end

table.remove(data.raw.recipe[dy.."iron-accumulator-normal"].ingredients,1)
table.remove(data.raw.recipe[dy.."copper-accumulator-normal"].ingredients,1)
data.raw["accumulator"]["accumulator"].fast_replaceable_group = "accumulator"

local result_1 = {dy.."makeshift-battery", 2}
local result_2 = {dy.."makeshift-battery", 12}
table.insert(data.raw.recipe[dy.."iron-accumulator-normal"].ingredients, result_1)
table.insert(data.raw.recipe[dy.."copper-accumulator-normal"].ingredients, result_2)