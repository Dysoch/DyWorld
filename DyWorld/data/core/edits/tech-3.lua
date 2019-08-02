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