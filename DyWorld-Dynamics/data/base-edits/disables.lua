




-- Tech --
for NAME in pairs(data.raw.technology) do
	data.raw.technology[NAME] = nil
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
	data.raw.recipe[NAME] = nil
end

-- Removed Recipes from Prod Modules --
for k,v in pairs(data.raw.module) do
	if v.limitation then
		v.limitation = {}
	end
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

-- Remove items, fluids and others
Remove_Items = {
	"iron-plate", "copper-plate", "steel-plate", "iron-ore", "copper-ore",
}

for k,v in pairs(Remove_Items) do
	if data.raw.item[v] then
		data.raw.item[v] = nil
	end
	if data.raw.fluid[v] then
		data.raw.fluid[v] = nil
	end
	if data.raw.module[v] then
		data.raw.module[v] = nil
	end
	if data.raw.ammo[v] then
		data.raw.ammo[v] = nil
	end
	if data.raw.capsule[v] then
		data.raw.capsule[v] = nil
	end
	if data.raw.tool[v] then
		data.raw.tool[v] = nil
	end
	if data.raw.gun[v] then
		data.raw.gun[v] = nil
	end
	if data.raw.armor[v] then
		data.raw.armor[v] = nil
	end
	if data.raw["rail-planner"][v] then
		data.raw["rail-planner"][v] = nil
	end
	if data.raw["repair-tool"][v] then
		data.raw["repair-tool"][v] = nil
	end
end