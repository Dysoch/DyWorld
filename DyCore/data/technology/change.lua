

	----- Prerequisites changes -----
DyW.Tech.Prereq = {}

function DyW.Tech.Prereq.Override(TECH, PREREQ)
	if data.raw.technology[TECH] then
		local T = data.raw.technology[TECH]
		if T.prerequisites then
			T.prerequisites = PREREQ
		else
			T.prerequisites = PREREQ
		end
		if T.hidden then
			T.hidden = false
		end
        DyW.Fx.Edited("technology", TECH, "Tech_PreReq_Override")
	end
end

function DyW.Tech.Prereq.Add_1(TECH, PREREQ)
	if data.raw.technology[TECH] then
		local T = data.raw.technology[TECH]
		if T.prerequisites then
			if not T.prerequisites[PREREQ] then
				table.insert(T.prerequisites, PREREQ)
			end
		else
			T.prerequisites = {PREREQ}
		end	
		if T.hidden then
			T.hidden = false
		end	
        DyW.Fx.Edited("technology", TECH, "Tech_PreReq_Add_1")
	end
end

function DyW.Tech.Prereq.Add_2(TECH, PREREQS)
	if data.raw.technology[TECH] then
		local T = data.raw.technology[TECH]
		if T.prerequisites then
			for k,v in pairs(PREREQS) do
				if not T.prerequisites[k] then
					table.insert(T.prerequisites, k)
				end
			end
		else
			T.prerequisites = PREREQS
		end	
		if T.hidden then
			T.hidden = false
		end
        DyW.Fx.Edited("technology", TECH, "Tech_PreReq_Add_2")
	end
end

function DyW.Tech.Prereq.Remove(TECH, PREREQ)
	if data.raw.technology[TECH] then
		local T = data.raw.technology[TECH]
		if T.prerequisites then
			if T.prerequisites[PREREQ] then
				T.prerequisites[PREREQ] = nil
			end
		end	
		if T.hidden then
			T.hidden = false
		end
        DyW.Fx.Edited("technology", TECH, "Tech_PreReq_Remove")
	end
end

	----- Recipe changes -----
DyW.Tech.Recipe = {}

function DyW.Tech.Recipe.Add(TECH, RECIPE)
	if data.raw.technology[TECH] and data.raw.recipe[RECIPE] then
		local result = {type = "unlock-recipe", recipe = RECIPE}
		table.insert(data.raw.technology[TECH].effects, result)
        DyW.Fx.Edited("recipe", RECIPE, "Tech_Recipe_Add")
        DyW.Fx.Edited("technology", TECH, "Tech_Recipe_Add")
	end
	if data.raw.recipe[RECIPE] then
		if data.raw.recipe[RECIPE].DyWorld_Hider then
			data.raw.recipe[RECIPE].DyWorld_Hider = false
		end
		if data.raw.recipe[RECIPE].enabled then
			data.raw.recipe[RECIPE].enabled = false
			data.raw.recipe[RECIPE].hidden = false
		end
		if data.raw.recipe[RECIPE].normal then
			data.raw.recipe[RECIPE].normal.enabled = false
			data.raw.recipe[RECIPE].normal.hidden = false
		end
		if data.raw.recipe[RECIPE].expensive then
			data.raw.recipe[RECIPE].expensive.enabled = false
			data.raw.recipe[RECIPE].expensive.hidden = false
		end
        DyW.Fx.Edited("recipe", RECIPE, "Tech_Recipe_Add")
	end
end

----- Icon changes -----
DyW.Tech.Icon = {}

function DyW.Tech.Icon.Change(TECH, ICONS, SIZE)
	if data.raw.technology[TECH] and data.raw.technology[TECH].icon then
        if data.raw.technology[TECH].icon == "__DyCore__/graphics/questionmark.png" then
            data.raw.technology[TECH].icon = nil
            data.raw.technology[TECH].icons = ICONS
            data.raw.technology[TECH].icon_size = SIZE or 64
        else
        end
        DyW.Fx.Edited("technology", TECH, "Tech_Icon_Change_Icon")
    elseif data.raw.technology[TECH] and data.raw.technology[TECH].icons then
        data.raw.technology[TECH].icon = nil
        data.raw.technology[TECH].icons = ICONS
        data.raw.technology[TECH].icon_size = SIZE or 64
        DyW.Fx.Edited("technology", TECH, "Tech_Icon_Change_Icons")
	end
    
end


--[[function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end]]

	----- Ingredient changes -----
DyW.Tech.Ingr = {}

function DyW.Tech.Ingr.Change(TECH, TABLE, AMOUNT, TIME)
    if data.raw.technology[TECH] then
        if data.raw.technology[TECH].unit and data.raw.technology[TECH].unit.ingredients and TABLE then
            data.raw.technology[TECH].unit.ingredients = TABLE
        end
        if data.raw.technology[TECH].unit and data.raw.technology[TECH].unit.count and AMOUNT then
            data.raw.technology[TECH].unit.count = AMOUNT
        end
        if data.raw.technology[TECH].unit and data.raw.technology[TECH].unit.time and TIME then
            data.raw.technology[TECH].unit.time = TIME
        end
        DyW.Fx.Edited("technology", TECH, "Tech_Ingr_Change")
    end
end
