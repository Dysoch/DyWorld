

for k,v in pairs(data.raw.recipe) do
	if v.normal then
		v.expensive = {}
		EXPEN = table.deepcopy(v.normal)
		EXPEN.energy_required = v.normal.energy_required * 2.5
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