

for k,v in pairs(data.raw.recipe) do
	if v.normal then
		v.expensive = v.normal
		v.expensive.energy_required = v.normal.energy_required * ER_Mod
		for index,ingredient in pairs(v.expensive.ingredients) do
			if ingredient.amount then 
				ingredient.amount = ingredient.amount * ER_Mod
			end
		end
	end
end