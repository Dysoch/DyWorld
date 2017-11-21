require "data/prefix"
	
for k,v in pairs(Material_Table) do
	if Materials[v.Table].Conductivity >= 0.01 then
		DyWorld_Accumulator(v)
	end
end

table.remove(data.raw.recipe[dy.."wood-accumulator-normal"].ingredients,1)
data.raw["accumulator"]["accumulator"].fast_replaceable_group = "accumulator"