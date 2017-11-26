require "data/prefix"
	
for k,v in pairs(Material_Table) do
	if v.Type == "Primitive" then
		DyWorld_Warehouse_Chests_1(v)
	else
		DyWorld_Warehouse_Chests_2(v)
	end
end