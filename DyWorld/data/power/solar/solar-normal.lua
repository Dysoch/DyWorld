require "data/prefix"
	
for k,v in pairs(Material_Table) do
	if Materials[v.Table].Conductivity >= 0.01 then
		DyWorld_Solar(v)
	end
end

table.remove(data.raw.recipe[dy.."iron-solar-normal"].ingredients,1)
table.remove(data.raw.recipe[dy.."copper-solar-normal"].ingredients,1)
data.raw["solar-panel"]["solar-panel"].fast_replaceable_group = "solar-panel"

local result_1 = {dy.."makeshift-solar-cell", 2}
local result_2 = {dy.."makeshift-solar-cell", 12}
table.insert(data.raw.recipe[dy.."iron-solar-normal"].ingredients, result_1)
table.insert(data.raw.recipe[dy.."copper-solar-normal"].ingredients, result_2)