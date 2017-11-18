require "data/prefix"
	
for k,v in pairs(Material_Table) do
	if Materials[v.Table].Conductivity >= 0.01 then
		DyWorld_Solar(v)
	end
end

data.raw["solar-panel"]["solar-panel"].fast_replaceable_group = "solar-panel"