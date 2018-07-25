require "data/prefix"

for k,v in pairs(Material_Table) do
	if v.Tile then
		DyWorld_Tiles(v)
	end
end
