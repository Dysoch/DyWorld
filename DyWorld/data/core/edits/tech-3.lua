require "data/core/functions/prefix"

local Tech_PreReq = {
	["automation-2"] = {"silver-processing", "nickel-processing", "tin-processing"},
	["automation-3"] = {"lead-processing", "steel-processing", "gold-processing"},
	["automation-4"] = {"cobalt-processing"},
	["automation-5"] = {"arditium-processing"},
	["automation-6"] = {"tungsten-processing", "titanium-processing"},
	["automation-9"] = {"neutronium-processing"},
	["metallurgy-1"] = {"steel-processing"},
	["metallurgy-2"] = {"silver-processing", "nickel-processing", "tin-processing"},
	["metallurgy-3"] = {"lead-processing", "gold-processing"},
	["metallurgy-4"] = {"cobalt-processing"},
	["metallurgy-5"] = {"arditium-processing"},
	["metallurgy-6"] = {"tungsten-processing", "titanium-processing"},
	["metallurgy-9"] = {"neutronium-processing"},
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