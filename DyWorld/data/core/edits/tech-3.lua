require "data/core/functions/prefix"

local Tech_PreReq = {
	["smelting-2"] = {"silver-processing", "nickel-processing", "tin-processing"},
	["smelting-3"] = {"lead-processing", "steel-processing", "gold-processing"},
	["smelting-4"] = {"cobalt-processing"},
	["smelting-5"] = {"arditium-processing"},
	["smelting-6"] = {"tungsten-processing", "titanium-processing"},
	["smelting-9"] = {"neutronium-processing"},
	["automation-2"] = {"silver-processing", "nickel-processing", "tin-processing"},
	["automation-3"] = {"lead-processing", "steel-processing", "gold-processing"},
	["automation-4"] = {"cobalt-processing"},
	["automation-5"] = {"arditium-processing"},
	["automation-6"] = {"tungsten-processing", "titanium-processing"},
	["automation-9"] = {"neutronium-processing"},
	["metallurgy-1"] = {"steel-processing", "smelting-1"},
	["metallurgy-2"] = {"silver-processing", "nickel-processing", "tin-processing", "smelting-2"},
	["metallurgy-3"] = {"lead-processing", "gold-processing", "smelting-3"},
	["metallurgy-4"] = {"cobalt-processing", "smelting-4"},
	["metallurgy-5"] = {"arditium-processing", "smelting-5"},
	["metallurgy-6"] = {"tungsten-processing", "titanium-processing", "smelting-6"},
	["metallurgy-7"] = {"smelting-7"},
	["metallurgy-8"] = {"smelting-8"},
	["metallurgy-9"] = {"neutronium-processing", "smelting-9"},
	["metallurgy-10"] = {"smelting-10"},
	["pollution-module-1"] = {"modules"},
	["oil-processing-2"] = {"oil-processing"},
	["oil-processing-3"] = {"advanced-oil-processing"},
	["super-module-1"] = {"productivity-module", "speed-module", "effectivity-module", "pollution-module-1"},
	["super-module-2"] = {"productivity-module-2", "speed-module-2", "effectivity-module-2", "pollution-module-2"},
	["super-module-3"] = {"productivity-module-3", "speed-module-3", "effectivity-module-3", "pollution-module-3"},
	["super-module-4"] = {"productivity-module-4", "speed-module-4", "effectivity-module-4", "pollution-module-4"},
	["super-module-5"] = {"productivity-module-5", "speed-module-5", "effectivity-module-5", "pollution-module-5"},
	["super-module-6"] = {"productivity-module-6", "speed-module-6", "effectivity-module-6", "pollution-module-6"},
	["super-module-7"] = {"productivity-module-7", "speed-module-7", "effectivity-module-7", "pollution-module-7"},
	["super-module-8"] = {"productivity-module-8", "speed-module-8", "effectivity-module-8", "pollution-module-8"},
	["super-module-9"] = {"productivity-module-9", "speed-module-9", "effectivity-module-9", "pollution-module-9"},
	["super-module-10"] = {"productivity-module-10", "speed-module-10", "effectivity-module-10", "pollution-module-10"},
} 

for k,v in pairs(Tech_PreReq) do
	if data.raw.technology[k] then
		if not data.raw.technology[k].prerequisites then
			data.raw.technology[k].prerequisites = {}
		end
		for _,z in pairs(v) do
			if data.raw.technology[z] then
				table.insert(data.raw.technology[k].prerequisites,z)
			end
		end
	end
end

local Tech_Recipe_Add = {
	["intermediates-1"] = {"glass", "rotor", "wheat", "carrot", "obsidian", "filter-empty", "blade", "resin", "sand-filter", "resin-filter", "coal-filter", "stone-filter"},
	["intermediates-2"] = {"gunpowder", "frame", "heater", "gearbox", "coil", "solar-cell", "battery-pack", "rubber", "obsidian-filter"},
	["intermediates-3"] = {"housing", "intake"},
	["intermediates-4"] = {"logistic-unit", "diamond"},
	["intermediates-5"] = {"controller"},
	["nickel-processing"] = {"nickel-plate"},
	["steel-processing"] = {"steel-plate"},
	["silver-processing"] = {"silver-plate"},
	["tin-processing"] = {"tin-plate"},
	["gold-processing"] = {"gold-plate"},
	["lead-processing"] = {"lead-plate"},
	["cobalt-processing"] = {"cobalt-plate"},
	["arditium-processing"] = {"arditium-plate"},
	["titanium-processing"] = {"titanium-plate"},
	["tungsten-processing"] = {"tungsten-plate"},
	["neutronium-processing"] = {"neutronium-plate"},
} 

for k,v in pairs(Tech_Recipe_Add) do
	if data.raw.technology[k] then
		if not data.raw.technology[k].effects then
			data.raw.technology[k].effects = {}
		end
		for _,z in pairs(v) do
			if data.raw.recipe[z] then
				local INSERT = {type = "unlock-recipe", recipe = z}
				table.insert(data.raw.technology[k].effects,INSERT)
				if data.raw.recipe[z].enabled then
					data.raw.recipe[z].enabled = false
					if data.raw.recipe[z].normal then
						data.raw.recipe[z].normal.enabled = false
						data.raw.recipe[z].expensive.enabled = false
					end
				end
			end
		end
	end
end

for k,v in pairs(data.raw.technology) do
	if not v.upgrade then
		v.upgrade = true
	end
end