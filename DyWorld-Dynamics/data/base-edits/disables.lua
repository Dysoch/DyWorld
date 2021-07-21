




-- Remove Recipes --
for k,v in pairs(data.raw.recipe) do
	if Dy_Exclude_Recipes[v.name] then
		--Dy_Log("Excluded Recipe from Hider ("..v.name..")")
		if (v.category and v.category == "crafting") then
			v.category = "assembling-tier-1"
		end
	elseif string.find(v.name, "se-", 1, true) then
		-- Nada
	else
		data.raw.recipe[v.name].DyWorld_Hider = true
		--Dy_Log("Recipe Hidden ("..v.name..")")
	end
end
data.raw.recipe["iron-plate"].hidden = true
data.raw.recipe["copper-plate"].hidden = true
data.raw.recipe["stone-brick"].hidden = true

-- Tech --
for k,v in pairs(data.raw.technology) do
	if Dy_Exclude_Tech[v.name] then
		--Dy_Log("Excluded Technology from Hider ("..v.name..")")
	else
		data.raw.technology[v.name].DyWorld_Hider = true
	end
end

-- Change Shortcuts --
data.raw.shortcut["undo"].technology_to_unlock = nil
data.raw.shortcut["copy"].technology_to_unlock = nil
data.raw.shortcut["cut"].technology_to_unlock = nil
data.raw.shortcut["paste"].technology_to_unlock = nil
data.raw.shortcut["import-string"].technology_to_unlock = nil
data.raw.shortcut["give-blueprint"].technology_to_unlock = nil
data.raw.shortcut["give-blueprint-book"].technology_to_unlock = nil
data.raw.shortcut["give-upgrade-planner"].technology_to_unlock = nil
data.raw.shortcut["give-deconstruction-planner"].technology_to_unlock = nil
data.raw.shortcut["toggle-personal-roboport"].technology_to_unlock = nil
data.raw.shortcut["toggle-equipment-movement-bonus"].technology_to_unlock = nil

-- Remove Tutorial --
for NAME in pairs(data.raw.tutorial) do
	data.raw.tutorial[NAME] = nil
end

-- Remove Achievements --
Remove_Achievements = {"build-entity-achievement", "research-achievement", "finish-the-game-achievement", "group-attack-achievement", "construct-with-robots-achievement", "deconstruct-with-robots-achievement", "deliver-by-robots-achievement", "train-path-achievement", "player-damaged-achievement", "build-entity-achievement", "produce-achievement", "produce-per-hour-achievement", "dont-use-entity-in-energy-production-achievement", "kill-achievement", "combat-robot-count", "dont-craft-manually-achievement", "dont-use-entity-in-energy-production-achievement", "dont-build-entity-achievement", "achievement"}

for k,v in pairs(Remove_Achievements) do
	for NAME in pairs(data.raw[v]) do
		data.raw[v][NAME] = nil
	end
end


-- Removed Recipes from Prod Modules --
for k,v in pairs(data.raw.module) do
	if v.limitation then
		v.limitation = {}
	end
end

-- Remove Tips and Tricks
for NAME in pairs(data.raw["tips-and-tricks-item"]) do
	data.raw["tips-and-tricks-item"][NAME] = nil
end

-- Remove ambient-sound
for NAME in pairs(data.raw["ambient-sound"]) do
	data.raw["ambient-sound"][NAME] = nil
end

-- Remove resources and autoplace--
for NAME in pairs(data.raw.resource) do
	if NAME == "stone" then
		data.raw.resource[NAME].autoplace = nil
	else
		data.raw.resource[NAME] = nil
	end
end

for NAME in pairs(data.raw["autoplace-control"]) do
	if data.raw["autoplace-control"][NAME].category == "resource" then
		data.raw["autoplace-control"][NAME] = nil
	end
end

data.raw["map-gen-presets"]["default"]["rich-resources"].basic_settings.autoplace_controls = nil
data.raw["map-gen-presets"]["default"]["rail-world"].basic_settings.autoplace_controls = nil
data.raw["map-gen-presets"]["default"]["ribbon-world"].basic_settings.autoplace_controls = nil