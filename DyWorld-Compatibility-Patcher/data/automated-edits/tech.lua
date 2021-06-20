
local function tech_remove_prerequisites (prototype_name, prerequisites)
	local prototype = data.raw.technology[prototype_name]
	if not prototype then return end
	for _, new_prerequisite in pairs(prerequisites) do
		if prototype.prerequisites then
			for i = #prototype.prerequisites, 1, -1 do
				if prototype.prerequisites[i] == new_prerequisite then
					table.remove(prototype.prerequisites, i)
				end
			end
		end
	end
end

local function CheckIngre(Tech, Check)
	local AMOUNT = 0
	if data.raw.technology[Tech] and data.raw.technology[Tech].unit and data.raw.technology[Tech].unit.ingredients then
		for k,v in pairs(data.raw.technology[Tech].unit.ingredients) do
			if v[1] == Check then
				AMOUNT = AMOUNT + 1
			end
		end
	end
	return AMOUNT
end

local function CheckPreReq(Tech, Check)
	local AMOUNT = 0
	if data.raw.technology[Tech] and data.raw.technology[Tech].prerequisites then
		for k,v in pairs(data.raw.technology[Tech].prerequisites) do
			if v == Check then
				AMOUNT = AMOUNT + 1
			end
		end
	end
	return AMOUNT
end


local Tech_Act_2 = {
	["automation-science-pack"] = {Replace = "iron-plate", Ratio = 2.5},
	["logistic-science-pack"] = {Replace = "iron-plate", Ratio = 2.5},
	["chemical-science-pack"] = {Replace = "iron-plate", Ratio = 2.5},
	["military-science-pack"] = {Replace = "iron-plate", Ratio = 2.5},
	["production-science-pack"] = {Replace = "iron-plate", Ratio = 2.5},
	["utility-science-pack"] = {Replace = "iron-plate", Ratio = 2.5},
	["space-science-pack"] = {Replace = "iron-plate", Ratio = 2.5}, 
}

local Tech_Act_3 = {
	["automation-science-pack"] = {Replace = "canister-empty", Ratio = 2.5},
	["logistic-science-pack"] = {Replace = "canister-empty", Ratio = 2.5},
	["chemical-science-pack"] = {Replace = "canister-empty", Ratio = 2.5},
	["military-science-pack"] = {Replace = "canister-empty", Ratio = 2.5},
	["production-science-pack"] = {Replace = "canister-empty", Ratio = 2.5},
	["utility-science-pack"] = {Replace = "canister-empty", Ratio = 2.5},
	["space-science-pack"] = {Replace = "canister-empty", Ratio = 2.5},
}

local Tech_Main = {
	["automation-science-pack"] = {Replace = "dysci-01"},
	["logistic-science-pack"] = {Replace = "dysci-02"},
	["chemical-science-pack"] = {Replace = "dysci-03"},
	["military-science-pack"] = {Replace = "dysci-04"},
	["production-science-pack"] = {Replace = "dysci-05"},
	["utility-science-pack"] = {Replace = "dysci-06"},
	["space-science-pack"] = {Replace = "dysci-07"},
	
	["se-rocket-science-pack"] = {Replace = "dysci-07"},
	
	["se-astronomic-science-pack-1"] = {Replace = "dysci-09"},
	["se-astronomic-science-pack-2"] = {Replace = "dysci-13"},
	["se-astronomic-science-pack-3"] = {Replace = "dysci-17"},
	["se-astronomic-science-pack-4"] = {Replace = "dysci-17"},
	
	["se-biological-science-pack-1"] = {Replace = "dysci-08"},
	["se-biological-science-pack-2"] = {Replace = "dysci-08"},
	["se-biological-science-pack-3"] = {Replace = "dysci-08"},
	["se-biological-science-pack-4"] = {Replace = "dysci-08"},
	
	["se-energy-science-pack-1"] = {Replace = "dysci-10"},
	["se-energy-science-pack-2"] = {Replace = "dysci-14"},
	["se-energy-science-pack-3"] = {Replace = "dysci-18"},
	["se-energy-science-pack-4"] = {Replace = "dysci-18"},
	
	["se-material-science-pack-1"] = {Replace = "dysci-11"},
	["se-material-science-pack-2"] = {Replace = "dysci-15"},
	["se-material-science-pack-3"] = {Replace = "dysci-19"},
	["se-material-science-pack-4"] = {Replace = "dysci-19"},
	
	["se-deep-space-science-pack-1"] = {Replace = "dysci-12"},
	["se-deep-space-science-pack-2"] = {Replace = "dysci-16"},
	["se-deep-space-science-pack-3"] = {Replace = "dysci-20"},
	["se-deep-space-science-pack-4"] = {Replace = "dysci-20"},
}

local Tech_Base_Game = {
	["physical-projectile-damage-1"] = {Replace = nil},
	["physical-projectile-damage-2"] = {Replace = nil},
	["physical-projectile-damage-3"] = {Replace = nil},
	["physical-projectile-damage-4"] = {Replace = nil},
	["physical-projectile-damage-5"] = {Replace = nil},
	["physical-projectile-damage-6"] = {Replace = nil},
	["physical-projectile-damage-7"] = {Replace = nil},
	["weapon-shooting-speed-1"] = {Replace = nil},
	["weapon-shooting-speed-2"] = {Replace = nil},
	["weapon-shooting-speed-3"] = {Replace = nil},
	["weapon-shooting-speed-4"] = {Replace = nil},
	["weapon-shooting-speed-5"] = {Replace = nil},
	["weapon-shooting-speed-6"] = {Replace = nil},
	["stronger-explosives-1"] = {Replace = nil},
	["stronger-explosives-2"] = {Replace = nil},
	["stronger-explosives-3"] = {Replace = nil},
	["stronger-explosives-4"] = {Replace = nil},
	["stronger-explosives-5"] = {Replace = nil},
	["stronger-explosives-6"] = {Replace = nil},
	["stronger-explosives-7"] = {Replace = nil},
	["refined-flammables-1"] = {Replace = nil},
	["refined-flammables-2"] = {Replace = nil},
	["refined-flammables-3"] = {Replace = nil},
	["refined-flammables-4"] = {Replace = nil},
	["refined-flammables-5"] = {Replace = nil},
	["refined-flammables-6"] = {Replace = nil},
	["refined-flammables-7"] = {Replace = nil},
	["energy-weapons-damage-1"] = {Replace = nil},
	["energy-weapons-damage-2"] = {Replace = nil},
	["energy-weapons-damage-3"] = {Replace = nil},
	["energy-weapons-damage-4"] = {Replace = nil},
	["energy-weapons-damage-5"] = {Replace = nil},
	["energy-weapons-damage-6"] = {Replace = nil},
	["energy-weapons-damage-7"] = {Replace = nil},
	["laser-shooting-speed-1"] = {Replace = nil},
	["laser-shooting-speed-2"] = {Replace = nil},
	["laser-shooting-speed-3"] = {Replace = nil},
	["laser-shooting-speed-4"] = {Replace = nil},
	["laser-shooting-speed-5"] = {Replace = nil},
	["laser-shooting-speed-6"] = {Replace = nil},
	["laser-shooting-speed-7"] = {Replace = nil},
	["artillery-shell-range-1"] = {Replace = nil},
	["artillery-shell-speed-1"] = {Replace = nil},
	["follower-robot-count-1"] = {Replace = nil},
	["follower-robot-count-2"] = {Replace = nil},
	["follower-robot-count-3"] = {Replace = nil},
	["follower-robot-count-4"] = {Replace = nil},
	["follower-robot-count-5"] = {Replace = nil},
	["follower-robot-count-6"] = {Replace = nil},
	["follower-robot-count-7"] = {Replace = nil},
	["stack-inserter"] = {Replace = nil},
	["inserter-capacity-bonus-1"] = {Replace = nil},
	["inserter-capacity-bonus-2"] = {Replace = nil},
	["inserter-capacity-bonus-3"] = {Replace = nil},
	["inserter-capacity-bonus-4"] = {Replace = nil},
	["inserter-capacity-bonus-5"] = {Replace = nil},
	["inserter-capacity-bonus-6"] = {Replace = nil},
	["inserter-capacity-bonus-7"] = {Replace = nil},
	["automation"] = {Replace = "automatica-1"},
	["automation-2"] = {Replace = "automatica-3"},
	["automation-3"] = {Replace = "automatica-5"},
	["electronics"] = {Replace = nil},
	["advanced-electronics"] = {Replace = "intermediates-3"},
	["advanced-electronics-2"] = {Replace = "intermediates-6"},
	["steel-axe"] = {Replace = nil},
	["military"] = {Replace = "warfare-1"},
	["military-2"] = {Replace = "warfare-3"},
	["military-3"] = {Replace = "warfare-5"},
	["military-4"] = {Replace = "warfare-7"},
	["fast-inserter"] = {Replace = nil},
	["logistics"] = {Replace = "logistica-1"},
	["logistics-2"] = {Replace = "logistica-3"},
	["logistics-3"] = {Replace = "logistica-5"},
	["fluid-wagon"] = {Replace = nil},
	["railway"] = {Replace = "rails-1"},
	["automated-rail-transportation"] = {Replace = "rails-1"},
	["rail-signals"] = {Replace = "rails-1"},
	["automobilism"] = {Replace = nil},
	["solar-energy"] = {Replace = "power-1"},
	["electric-energy-accumulators"] = {Replace = "power-3"},
	["heavy-armor"] = {Replace = nil},
	["gun-turret"] = {Replace = nil},
	["research-speed-1"] = {Replace = nil},
	["research-speed-2"] = {Replace = nil},
	["research-speed-3"] = {Replace = nil},
	["research-speed-4"] = {Replace = nil},
	["research-speed-5"] = {Replace = nil},
	["research-speed-6"] = {Replace = nil},
	["electric-energy-distribution-1"] = {Replace = "power-1"},
	["electric-energy-distribution-2"] = {Replace = "power-3"},
	["advanced-material-processing"] = {Replace = "automatica-4"},
	["advanced-material-processing-2"] = {Replace = "automatica-6"},
	["concrete"] = {Replace = "intermediates-5"},
	["engine"] = {Replace = "intermediates-1"},
	["landfill"] = {Replace = nil},
	["toolbelt"] = {Replace = nil},
	["toolbelt-2"] = {Replace = nil},
	["toolbelt-3"] = {Replace = nil},
	["toolbelt-4"] = {Replace = nil},
	["toolbelt-6"] = {Replace = nil},
	["toolbelt-7"] = {Replace = nil},
	["stone-wall"] = {Replace = nil},
	["gate"] = {Replace = nil},
	["uranium-ammo"] = {Replace = nil},
	["atomic-bomb"] = {Replace = nil},
	["explosives"] = {Replace = nil},
	["cliff-explosives"] = {Replace = nil},
	["flammables"] = {Replace = nil},
	["land-mine"] = {Replace = nil},
	["flamethrower"] = {Replace = nil},
	["braking-force-1"] = {Replace = nil},
	["braking-force-2"] = {Replace = nil},
	["braking-force-3"] = {Replace = nil},
	["braking-force-4"] = {Replace = nil},
	["braking-force-5"] = {Replace = nil},
	["braking-force-6"] = {Replace = nil},
	["braking-force-7"] = {Replace = nil},
	["tank"] = {Replace = nil},
	["laser"] = {Replace = nil},
	["rocketry"] = {Replace = nil},
	["explosive-rocketry"] = {Replace = nil},
	["modular-armor"] = {Replace = nil},
	["power-armor"] = {Replace = nil},
	["power-armor-mk2"] = {Replace = nil},
	["laser-turret"] = {Replace = nil},
	["robotics"] = {Replace = "storage-2"},
	["rocket-fuel"] = {Replace = "gasoline"},
	["low-density-structure"] = {Replace = "intermediates-6"},
	["rocket-control-unit"] = {Replace = "intermediates-6"},
	["rocket-silo"] = {Replace = "space-mining"},
	["effect-transmission"] = {Replace = nil},
	["lubricant"] = {Replace = "intermediates-2"},
	["electric-engine"] = {Replace = "intermediates-3"},
	["battery"] = {Replace = "intermediates-5"},
	["construction-robotics"] = {Replace = "storage-3"},
	["logistic-robotics"] = {Replace = "storage-3"},
	["logistic-system"] = {Replace = "storage-5"},
	["worker-robots-speed-1"] = {Replace = nil},
	["worker-robots-speed-2"] = {Replace = nil},
	["worker-robots-speed-3"] = {Replace = nil},
	["worker-robots-speed-4"] = {Replace = nil},
	["worker-robots-speed-5"] = {Replace = nil},
	["worker-robots-speed-6"] = {Replace = nil},
	["worker-robots-storage-1"] = {Replace = nil},
	["worker-robots-storage-2"] = {Replace = nil},
	["worker-robots-storage-3"] = {Replace = nil},
	["energy-shield-equipment"] = {Replace = nil},
	["night-vision-equipment"] = {Replace = nil},
	["belt-immunity-equipment"] = {Replace = nil},
	["energy-shield-mk2-equipment"] = {Replace = nil},
	["battery-equipment"] = {Replace = nil},
	["battery-mk2-equipment"] = {Replace = nil},
	["solar-panel-equipment"] = {Replace = nil},
	["personal-laser-defense-equipment"] = {Replace = nil},
	["discharge-defense-equipment"] = {Replace = nil},
	["fusion-reactor-equipment"] = {Replace = nil},
	["exoskeleton-equipment"] = {Replace = nil},
	["personal-roboport-equipment"] = {Replace = nil},
	["personal-roboport-mk2-equipment"] = {Replace = nil},
	["fluid-handling"] = {Replace = "fluids-1"},
	["advanced-oil-processing"] = {Replace = "oil-processing"},
	["coal-liquefaction"] = {Replace = "oil-processing"},
	["sulfur-processing"] = {Replace = "intermediates-5"},
	["plastics"] = {Replace = "intermediates-3"},
	["modules"] = {Replace = nil},
	["speed-module"] = {Replace = nil},
	["speed-module-2"] = {Replace = nil},
	["speed-module-3"] = {Replace = nil},
	["productivity-module"] = {Replace = nil},
	["productivity-module-2"] = {Replace = nil},
	["productivity-module-3"] = {Replace = nil},
	["effectivity-module"] = {Replace = nil},
	["effectivity-module-2"] = {Replace = nil},
	["effectivity-module-3"] = {Replace = nil},
	["defender"] = {Replace = nil},
	["distractor"] = {Replace = nil},
	["destroyer"] = {Replace = nil},
	["uranium-processing"] = {Replace = "nuclear-1"},
	["nuclear-power"] = {Replace = "nuclear-2"},
	["kovarex-enrichment-process"] = {Replace = "nuclear-3"},
	["nuclear-fuel-reprocessing"] = {Replace = "nuclear-4"},
	["mining-productivity-1"] = {Replace = nil},
	["mining-productivity-2"] = {Replace = nil},
	["mining-productivity-3"] = {Replace = nil},
	["mining-productivity-4"] = {Replace = nil},
	["artillery"] = {Replace = nil},
	["spidertron"] = {Replace = nil},
	["circuit-network"] = {Replace = "intermediates-3"},
	["logistic-science-pack"] = {Replace = "dy-science-pack-2"},
	["chemical-science-pack"] = {Replace = "dy-science-pack-3"},
	["military-science-pack"] = {Replace = "dy-science-pack-4"},
	["production-science-pack"] = {Replace = "dy-science-pack-5"},
	["utility-science-pack"] = {Replace = "dy-science-pack-6"},
	["space-science-pack"] = {Replace = "dy-science-pack-7"},
	["aai-strongbox-base"] = {Replace = "storage-1"},
	["aai-strongbox-storage"] = {Replace = "storage-3"},
	["aai-strongbox-logistic"] = {Replace = "storage-5"},
	["aai-storehouse-base"] = {Replace = "storage-2"},
	["aai-storehouse-storage"] = {Replace = "storage-4"},
	["aai-storehouse-logistic"] = {Replace = "storage-6"},
	["aai-warehouse-base"] = {Replace = "storage-3"},
	["aai-warehouse-storage"] = {Replace = "storage-5"},
	["aai-warehouse-logistic"] = {Replace = "storage-7"},
	["basic-automation"] = {Replace = "automatica-1"},
	["basic-logistics"] = {Replace = "logistica-1"},
	["electricity"] = {Replace = "power-1"},
	["steam-power"] = {Replace = "power-1"},
	["filter-inserter"] = {Replace = "logistica-1"},
	["stack-filter-inserter"] = {Replace = "logistica-1"},
	["radar"] = {Replace = nil},
	["basic-fluid-handling"] = {Replace = "fluids-1"},
	["electric-lab"] = {Replace = nil},
	["electric-mining"] = {Replace = nil},
	["concrete-walls"] = {Replace = nil},
	["steel-walls"] = {Replace = nil},
	["sand-processing"] = {Replace = "intermediates-1"},
	["glass-processing"] = {Replace = "intermediates-1"},
	["medium-electric-pole"] = {Replace = "power-1"},
	["se-bio-upgrade-constitution-1"] = {Replace = nil},
	["se-bio-upgrade-constitution-2"] = {Replace = nil},
	["se-bio-upgrade-constitution-3"] = {Replace = nil},
	["se-bio-upgrade-constitution-4"] = {Replace = nil},
	["se-bio-upgrade-constitution-5"] = {Replace = nil},
	["se-bio-upgrade-strength-1"] = {Replace = nil},
	["se-bio-upgrade-strength-2"] = {Replace = nil},
	["se-bio-upgrade-strength-3"] = {Replace = nil},
	["se-bio-upgrade-strength-4"] = {Replace = nil},
	["se-bio-upgrade-strength-5"] = {Replace = nil},
	["se-bio-upgrade-agility-1"] = {Replace = nil},
	["se-bio-upgrade-agility-2"] = {Replace = nil},
	["se-bio-upgrade-agility-3"] = {Replace = nil},
	["se-bio-upgrade-agility-4"] = {Replace = nil},
	["se-bio-upgrade-agility-5"] = {Replace = nil},
	["se-bio-upgrade-dexterity-1"] = {Replace = nil},
	["se-bio-upgrade-dexterity-2"] = {Replace = nil},
	["se-bio-upgrade-dexterity-3"] = {Replace = nil},
	["se-bio-upgrade-dexterity-4"] = {Replace = nil},
	["se-bio-upgrade-dexterity-5"] = {Replace = nil},
	["se-bio-upgrade-intelligence-1"] = {Replace = nil},
	["se-bio-upgrade-intelligence-2"] = {Replace = nil},
	["se-bio-upgrade-intelligence-3"] = {Replace = nil},
	["se-bio-upgrade-intelligence-4"] = {Replace = nil},
	["se-bio-upgrade-intelligence-5"] = {Replace = nil},
	["energy-shield-mk3-equipment"] = {Replace = nil},
	["energy-shield-mk4-equipment"] = {Replace = nil},
	["energy-shield-mk5-equipment"] = {Replace = nil},
	["energy-shield-mk6-equipment"] = {Replace = nil},
	["se-adaptive-armour-1"] = {Replace = nil},
	["se-adaptive-armour-2"] = {Replace = nil},
	["se-adaptive-armour-3"] = {Replace = nil},
	["se-adaptive-armour-4"] = {Replace = nil},
	["se-adaptive-armour-5"] = {Replace = nil},
	
	----- TO BE CHECKED -----
	
	["se-rocket-science-pack"] = {Replace = "dy-science-pack-7"},
	
	["se-astronomic-science-pack-1"] = {Replace = "dy-science-pack-9"},
	["se-astronomic-science-pack-2"] = {Replace = "dy-science-pack-13"},
	["se-astronomic-science-pack-3"] = {Replace = "dy-science-pack-17"},
	["se-astronomic-science-pack-4"] = {Replace = "dy-science-pack-17"},
	
	["se-biological-science-pack-1"] = {Replace = "dy-science-pack-8"},
	["se-biological-science-pack-2"] = {Replace = "dy-science-pack-8"},
	["se-biological-science-pack-3"] = {Replace = "dy-science-pack-8"},
	["se-biological-science-pack-4"] = {Replace = "dy-science-pack-8"},
	
	["se-energy-science-pack-1"] = {Replace = "dy-science-pack-10"},
	["se-energy-science-pack-2"] = {Replace = "dy-science-pack-14"},
	["se-energy-science-pack-3"] = {Replace = "dy-science-pack-18"},
	["se-energy-science-pack-4"] = {Replace = "dy-science-pack-18"},
	
	["se-material-science-pack-1"] = {Replace = "dy-science-pack-11"},
	["se-material-science-pack-2"] = {Replace = "dy-science-pack-15"},
	["se-material-science-pack-3"] = {Replace = "dy-science-pack-19"},
	["se-material-science-pack-4"] = {Replace = "dy-science-pack-19"},
	
	["se-deep-space-science-pack-1"] = {Replace = "dy-science-pack-12"},
	["se-deep-space-science-pack-2"] = {Replace = "dy-science-pack-16"},
	["se-deep-space-science-pack-3"] = {Replace = "dy-science-pack-20"},
	["se-deep-space-science-pack-4"] = {Replace = "dy-science-pack-20"},
	
}

for _, tech in pairs (data.raw.technology) do
	if not tech.DyWorld_Hider then
		if tech.flag and tech.flag.Act_2 then
			if tech.unit and tech.unit.ingredients then
				for k,v in pairs(tech.unit.ingredients) do
					for Old,New in pairs(Tech_Act_2) do
						if v[1] == Old then
							--Dy_Log("DyComPa: Found old science-pack ("..Old..") in act-2 technology: "..tech.name..". Removing it from technology")
							data.raw.technology[tech.name].unit.ingredients[k] = nil
						end
					end
				end
			end
		end
		if tech.flag and tech.flag.Act_3 then
			if tech.unit and tech.unit.ingredients then
				for k,v in pairs(tech.unit.ingredients) do
					for Old,New in pairs(Tech_Act_3) do
						if v[1] == Old then
							--Dy_Log("DyComPa: Found old science-pack ("..Old..") in act-3 technology: "..tech.name..". Removing it from technology")
							data.raw.technology[tech.name].unit.ingredients[k] = nil
						end
					end
				end
			end
		end
		if tech.unit and tech.unit.ingredients then
			for k,v in pairs(tech.unit.ingredients) do
				for Old,New in pairs(Tech_Main) do
					if v and v[1] and v[1] == Old then
						if CheckIngre(tech.name, New.Replace) == 0 then
							v[1] = New.Replace
						else
							v = nil
						end
					end
				end
			end
		end
		if tech.prerequisites then
			for k,v in pairs(tech.prerequisites) do
				for Old,New in pairs(Tech_Base_Game) do
					if v == Old then
						if New.Replace ~= nil then
							if data.raw.technology[New.Replace] then
								if CheckPreReq(tech.name, New.Replace) == 0 then
									Dy_Log("DyComPa: Found Factorio technology prerequisite ("..Old..") in technology: "..tech.name..". Changing it to: "..New.Replace)
									tech_remove_prerequisites(tech.name, {Old})
									table.insert(tech.prerequisites, New.Replace)
								else
									Dy_Log("DyComPa: Found Factorio technology prerequisite ("..Old..") in technology: "..tech.name..". Replacing not needed, since "..New.Replace.." already exists. Removing old prerequisite")
									tech_remove_prerequisites(tech.name, {Old})
								end
							else
								Dy_Log("DyComPa: Found Factorio technology prerequisite ("..Old..") in technology: "..tech.name..". Replacing tech ("..New.Replace..") not found, removing it completely")
								tech_remove_prerequisites(tech.name, {Old})
							end
						else
							Dy_Log("DyComPa: Found Factorio technology prerequisite ("..Old..") in technology: "..tech.name..". No substitute found, removing it completely")
							tech_remove_prerequisites(tech.name, {Old})
						end
					end
					if data.raw.technology[Old] and not data.raw.technology[Old].hidden then
						data.raw.technology[Old].hidden = true
					end
				end
			end
		end
		if (tech.unit and tech.unit.count and tonumber(tech.unit.count) > 1) then
			local AMOUNT = tech.unit.count
			if tech.unit.ingredients then
				for k,v in pairs(tech.unit.ingredients) do
					if math.ceil(v[2] * AMOUNT) >= 65000 then
						v[2] = 65000
					elseif math.ceil(v[2] * AMOUNT) <= 1 then
						v[2] = 1
					else
						v[2] = (math.ceil(v[2] * AMOUNT))
					end
				end
			end
			if tech.unit.time then
				tech.unit.time = math.ceil(tech.unit.time * AMOUNT)
			end
			tech.unit.count = 1
		end
	end
end

for _,tech in pairs(data.raw.technology) do
	if tech.unit and tech.unit.ingredients then
		for k,v in pairs(tech.unit.ingredients) do
			for Old,New in pairs(Tech_Main) do
				if v and v[1] and v[1] == Old then
					if CheckIngre(tech.name, New.Replace) == 0 then
						v[1] = New.Replace
					else
						v = nil
					end
				end
			end
		end
	end
	if tech.prerequisites then
			for k,v in pairs(tech.prerequisites) do
				for Old,New in pairs(Tech_Base_Game) do
					if v == Old then
						if New.Replace ~= nil then
							if data.raw.technology[New.Replace] then
								if CheckPreReq(tech.name, New.Replace) == 0 then
									Dy_Log("DyComPa: Found Factorio technology prerequisite ("..Old..") in technology: "..tech.name..". Changing it to: "..New.Replace)
									tech_remove_prerequisites(tech.name, {Old})
									table.insert(tech.prerequisites, New.Replace)
								else
									Dy_Log("DyComPa: Found Factorio technology prerequisite ("..Old..") in technology: "..tech.name..". Replacing not needed, since "..New.Replace.." already exists. Removing old prerequisite")
									tech_remove_prerequisites(tech.name, {Old})
								end
							else
								Dy_Log("DyComPa: Found Factorio technology prerequisite ("..Old..") in technology: "..tech.name..". Replacing tech ("..New.Replace..") not found, removing it completely")
								tech_remove_prerequisites(tech.name, {Old})
								--v = nil
								--data.raw.technology[tech.name].prerequisites[k] = nil
							end
						else
							Dy_Log("DyComPa: Found Factorio technology prerequisite ("..Old..") in technology: "..tech.name..". No substitute found, removing it completely")
							tech_remove_prerequisites(tech.name, {Old})
							--v = nil
							--data.raw.technology[tech.name].prerequisites[k] = nil
						end
					end
				end
			end
		end
end