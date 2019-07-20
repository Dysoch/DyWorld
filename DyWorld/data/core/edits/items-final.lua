require "data/core/functions/prefix"

-- Add only items to this list
local Data_Locale_Chemical_Formula = {
	["coal"] = "5C2Hg",
	["iron-ore"] = "Fe2O3",
	["iron-plate"] = "Fe",
	["copper-ore"] = "CuFeS2",
	["copper-plate"] = "Cu",
	["gold-ore"] = "Cu3Au",
	["gold-plate"] = "Au",
	["lead-ore"] = "3PbSAg",
	["lead-plate"] = "Pb",
	["silver-ore"] = "PbS3Ag",
	["silver-plate"] = "Ag",
	["tin-ore"] = "SnO2",
	["tin-plate"] = "Sn",
	["tungsten-ore"] = "Fe2O3",
	["tungsten-plate"] = "Fe2O3",
	["titanium-ore"] = "WO3",
	["titanium-plate"] = "W",
	["neutronium-ore"] = "5Neu2H3FeCu",
	["neutronium-plate"] = "Neu",
	["cobalt-ore"] = "CoAsS",
	["cobalt-plate"] = "Co",
	["arditium-ore"] = "ArdCoFeCu",
	["arditium-plate"] = "Ard",
	["uranium-ore"] = "UO2",
	--["gold-ore"] = "Cu3Au",
	--["gold-plate"] = "Au",
	--["coal"] = "5C2Hg",
}

for k,v in pairs(Data_Locale_Chemical_Formula) do
	if data.raw.item[k] then
		data.raw.item[k].Locale_Chemical = v
	end
end