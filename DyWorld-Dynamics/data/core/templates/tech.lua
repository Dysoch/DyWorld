



function DyWorld_Add_To_Tech(TECH, RECIPE)
	DyWorld_AddUnlockedRecipe_To_Tech(RECIPE, TECH)
end

function DyWorld_AddUnlockedRecipe_To_Tech(RECIPE, TECH)
	DyW.Tech.Recipe.Add(TECH, RECIPE, false)
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
				icon = DyDs_tech_temp,
				icon_size = params.icon_size or 256,
				flag = params.flags or {},
				localised_name = params.localised_name or nil,
				localised_description = params.localised_description or {"technology-description." .. params.name},
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
		}
	)
	if params.icons then
		data.raw.technology[params.name].icon = nil
		data.raw.technology[params.name].icons = params.icons
		data.raw.technology[params.name].icon_size = params.icon_size or 256
	elseif params.icon then
		data.raw.technology[params.name].icon = params.icon
		data.raw.technology[params.name].icon_size = params.icon_size or 256
	end
end
