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