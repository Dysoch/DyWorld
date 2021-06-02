




-- Tech --
for NAME in pairs(data.raw.technology) do
	--data.raw.technology[NAME] = nil
	data.raw.technology[NAME].DyWorld_Hider = true
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

-- Remove Recipes --
for NAME in pairs(data.raw.recipe) do
	--data.raw.recipe[NAME] = nil
	data.raw.recipe[NAME].DyWorld_Hider = true
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

-- Change silo --
data.raw["rocket-silo"]["rocket-silo"].fixed_recipe = nil

-- Remove resources and autoplace--
for NAME in pairs(data.raw.resource) do
	data.raw.resource[NAME] = nil
end

for NAME in pairs(data.raw["autoplace-control"]) do
	if data.raw["autoplace-control"][NAME].category == "resource" then
		data.raw["autoplace-control"][NAME] = nil
	end
end

data.raw["map-gen-presets"]["default"]["rich-resources"].basic_settings.autoplace_controls = nil
data.raw["map-gen-presets"]["default"]["rail-world"].basic_settings.autoplace_controls = nil
data.raw["map-gen-presets"]["default"]["ribbon-world"].basic_settings.autoplace_controls = nil