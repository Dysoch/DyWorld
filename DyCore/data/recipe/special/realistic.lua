DyW.Recipe.RL = {}



function DyW.Recipe.RL.Clear(RECIPE, RETURN, INGREDIENT)
	if data.raw.recipe[RECIPE] then
		local REC = data.raw.recipe[RECIPE]
		if REC.expensive then
			if REC.normal then
				REC.expensive = REC.normal
				REC.expensive.ingredients = {}
				if RETURN and INGREDIENT then
					DyW.Recipe.RL.Add(RECIPE, INGREDIENT)
				end
			end
		else
			if REC.normal then
				REC.expensive = REC.normal
				REC.expensive.ingredients = {}
				if RETURN and INGREDIENT then
					DyW.Recipe.RL.Add(RECIPE, INGREDIENT)
				end
			end
		end
	end
end

function DyW.Recipe.RL.Add(RECIPE, INGREDIENT)
	if data.raw.recipe[RECIPE] then
		local REC = data.raw.recipe[RECIPE]
		if REC.expensive then 
			if REC.expensive.ingredients then
				table.insert(REC.expensive.ingredients, INGREDIENT)
			else
				DyW.Recipe.RL.Clear(RECIPE, true, INGREDIENT)
			end
		else
			DyW.Recipe.RL.Clear(RECIPE, true, INGREDIENT)
		end
	end
end