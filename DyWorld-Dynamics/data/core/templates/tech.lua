



function DyWorld_Add_To_Tech(TECH, RECIPE)
	if data.raw.technology[TECH] and data.raw.recipe[RECIPE] then
		local result = {type = "unlock-recipe", recipe = RECIPE}
		table.insert(data.raw.technology[TECH].effects, result)
	end
	if data.raw.recipe[RECIPE] then
		if data.raw.recipe[RECIPE].enabled then
			data.raw.recipe[RECIPE].enabled = false
		end
		if data.raw.recipe[RECIPE].normal then
			data.raw.recipe[RECIPE].normal.enabled = false
		end
		if data.raw.recipe[RECIPE].expensive then
			data.raw.recipe[RECIPE].expensive.enabled = false
		end
	end	
end

function DyWorld_ATTA(RECIPE, TECHS)
	DyWorld_Automated_Tech_Add[RECIPE] = TECHS
end

function DyWorld_Tech_Add(params)
data:extend(
{
  {
    type = "technology",
   	name = params.name,
    icon = params.icon or DyDs_tech_temp,
    icon_size = 256,
	flag = params.flags or {},
	localised_name = params.localised_name or nil,
	localised_description = params.localised_description or nil,
    effects = params.effects or {},
    prerequisites = params.prerequisites or {},
    unit =
    {
      count = params.count or 1,
      ingredients = params.ingredients,
      time = params.time,
    },
    order = params.order,
	upgrade = settings.startup["DyWorld_Tech_Upgrade"].value,
	DyWorld_Hider = false,
  },
})
	if params.icons then
		data.raw.technology[params.name].icons = params.icons
		data.raw.technology[params.name].icon = nil
	end
end