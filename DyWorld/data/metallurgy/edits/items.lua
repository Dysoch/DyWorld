require "data/prefix"

for k,v in pairs(Material_Table) do
	if v.Type == "Basic" then
		data.raw.item[v.Name.."-ore"].localised_name = {"looped-name.dirty-ore", {"looped-name."..v.Name}} 
	end
end