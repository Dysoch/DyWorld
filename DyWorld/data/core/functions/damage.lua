require "data/core/functions/prefix"
require "data/core/functions/colors"


local Data_Table = {
	"nuclear", "electric", "poison", "acid", "gas", 
	"fire", "water", "lightning", "fungal", "plasma", 
	"laser", "lava", "earth", "fission", "chemical", 
	"physical", "explosion", "impact", "sonic", "ice", 
	"fusion", 
}

for k,v in pairs(Data_Table) do
	data:extend(
	{
		{
			type = "damage-type",
			name = v,
			order = v,
		}
	})
end