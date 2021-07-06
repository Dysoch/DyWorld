



require("data.data")

for k,v in pairs(data.raw.recipe) do
	if v.normal then
		v.expensive = {}
		EXPEN = table.deepcopy(v.normal)
		if v.normal.energy_required then
			EXPEN.energy_required = v.normal.energy_required * 2.5
		elseif v.energy_required then
			EXPEN.energy_required = v.energy_required * 2.5
			v.normal.energy_required = v.energy_required 
		end
		for index,ingredient in pairs(EXPEN.ingredients) do
			if ingredient.amount then 
				if math.floor(ingredient.amount * ER_Mod) > 65535 then
					ingredient.amount = 65535
				else
					ingredient.amount = math.floor(ingredient.amount * ER_Mod)
				end
			end
		end
		v.expensive = EXPEN
	end
end

for _,type in pairs({"item", "fluid", "recipe", "module", "ammo", "capsule", "tool", "gun", "armor", "rail-planner", "repair-tool"}) do
	for _,v in pairs(data.raw[type]) do
		if v.DyWorld_Hider then
			v.hidden = true
			if v.normal then
				v.normal.hidden = true
			end
			if v.expensive then
				v.expensive.hidden = true
			end
			if v.prerequisites then
				v.prerequisites = {}
			end
		end
	end
end
	

