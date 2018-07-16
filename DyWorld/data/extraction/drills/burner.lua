require "data/prefix"
	
for k,v in pairs(Material_Table) do
	if v.Type == "Primitive" or v.Type == "Basic" then
		if v.Name == "rubber" then
		
		else
			DyWorld_Mining_Drills_Burner(v)
		end
	end
end