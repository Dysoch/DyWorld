require "data/prefix"

local Remove_Table = {"space-science-pack"}

for k,v in pairs(Remove_Table) do
	for j,n in pairs(data.raw.technology) do
		if n.unit.ingredients then
			for h,b in pairs(n.unit.ingredients) do
				if b[1] == v then
					table.remove(n.unit.ingredients, h)
					--n.unit.count = n.unit.count * 2
				end
			end
		end
	end
end

for k,v in pairs(data.raw.technology) do
	if v.max_level == "infinite" then
		v.unit.ingredients = {
        {"science-pack-1", 25},
        {"science-pack-2", 25},
        {"science-pack-3", 25},
        {"military-science-pack", 25},
        {"production-science-pack", 25},
        {"high-tech-science-pack", 25},
        {dy.."extra-solar-science-pack", 10},
        {dy.."infinity-science-pack", 1},
      }
	end
end