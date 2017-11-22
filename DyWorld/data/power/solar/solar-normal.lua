require "data/prefix"
	
for k,v in pairs(Material_Table) do
	if Materials[v.Table].Conductivity >= 0.01 then
		DyWorld_Solar(v)
	end
end

table.remove(data.raw.recipe[dy.."wood-solar-normal"].ingredients,1)
data.raw["solar-panel"]["solar-panel"].fast_replaceable_group = "solar-panel"

local result_1 = {dy.."makeshift-solar-cell", 2}
table.insert(data.raw.recipe[dy.."wood-solar-normal"].ingredients, result_1)