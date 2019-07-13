require "data/prefix"
	
for k,v in pairs(Material_Table) do
	if v.Tier == 1 then
		DyWorld_Warehouse_Chests_1(v)
	elseif Materials[v.Table].Conductivity >= 0.01 then
		DyWorld_Warehouse_Chests_2(v)
	end
end