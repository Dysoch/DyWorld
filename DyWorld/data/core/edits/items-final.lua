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
	["nickel-ore"] = "NiFe9S8",
	["nickel-plate"] = "Ni",
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
	["electrum-plate"] = "AgAu",
	["invar-plate"] = "FeNi",
	["bronze-plate"] = "SnCu",
	["stainless-steel-plate"] = "FeCrNi",
	["electranium-plate"] = "AgAuArd",
	["arditium-tungstenate-plate"] = "ArdFe2O3",
	["tungstvar-plate"] = "2Fe2O3Ni",
	--["gold-ore"] = "Cu3Au",
	--["gold-plate"] = "Au",
	--["coal"] = "5C2Hg",
}

for k,v in pairs(Data_Locale_Chemical_Formula) do
	if data.raw.item[k] and data.raw.item[k].DyWorld then
		data.raw.item[k].DyWorld.Locale_Chemical = v
	end
end