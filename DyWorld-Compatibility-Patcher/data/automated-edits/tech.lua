



local Tech_Act_2 = {
	["automation-science-pack"] = {Replace = "iron-plate", Ratio = 2.5},
	["logistic-science-pack"] = {Replace = "iron-plate", Ratio = 2.5},
	["chemical-science-pack"] = {Replace = "iron-plate", Ratio = 2.5},
	["military-science-pack"] = {Replace = "iron-plate", Ratio = 2.5},
	["production-science-pack"] = {Replace = "iron-plate", Ratio = 2.5},
	["utility-science-pack"] = {Replace = "iron-plate", Ratio = 2.5},
	["space-science-pack"] = {Replace = "iron-plate", Ratio = 2.5},
}

for _, tech in pairs (data.raw.technology) do
	if tech.flag and tech.flag.Act_2 then
		if tech.unit and tech.unit.ingredients then
			for k,v in pairs(tech.unit.ingredients) do
				for Old,New in pairs(Tech_Act_2) do
					if v[1] == Old then
						Dy_Log("Found old science-pack ("..Old..") in act-2 technology: "..tech.name..". Removing it from technology")
						data.raw.technology[tech.name].unit.ingredients[k] = nil
					end
				end
			end
		end
	end
end

local Tech_Act_3 = {
	["automation-science-pack"] = {Replace = "canister-empty", Ratio = 2.5},
	["logistic-science-pack"] = {Replace = "canister-empty", Ratio = 2.5},
	["chemical-science-pack"] = {Replace = "canister-empty", Ratio = 2.5},
	["military-science-pack"] = {Replace = "canister-empty", Ratio = 2.5},
	["production-science-pack"] = {Replace = "canister-empty", Ratio = 2.5},
	["utility-science-pack"] = {Replace = "canister-empty", Ratio = 2.5},
	["space-science-pack"] = {Replace = "canister-empty", Ratio = 2.5},
}

for _, tech in pairs (data.raw.technology) do
	if tech.flag and tech.flag.Act_3 then
		if tech.unit and tech.unit.ingredients then
			for k,v in pairs(tech.unit.ingredients) do
				for Old,New in pairs(Tech_Act_3) do
					if v[1] == Old then
						Dy_Log("Found old science-pack ("..Old..") in act-3 technology: "..tech.name..". Removing it from technology")
						data.raw.technology[tech.name].unit.ingredients[k] = nil
					end
				end
			end
		end
	end
end