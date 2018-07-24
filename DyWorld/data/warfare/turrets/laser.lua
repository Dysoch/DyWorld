require "data/prefix"
	
for k,v in pairs(Material_Table) do
	if Materials[v.Table].Conductivity >= 0.01 then
		DyWorld_Laser_Turrets(v)
	end
end

