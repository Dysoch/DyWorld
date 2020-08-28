require "data/core/functions/prefix"

-- Add only items to this list
local Data_Locale_Chemical_Formula = {
	["coal"] = "5C-2Hg",
	["iron-ore"] = "2Fe-O3",
	["iron-plate"] = "Fe",
	["copper-ore"] = "Cu-Fe-S2",
	["copper-plate"] = "Cu",
	["gold-ore"] = "Cu-3Au",
	["gold-plate"] = "Au",
	["lead-ore"] = "3Pb-S-Ag",
	["lead-plate"] = "Pb",
	["silver-ore"] = "Pb-S-3Ag",
	["silver-plate"] = "Ag",
	["tin-ore"] = "Sn-2O",
	["tin-plate"] = "Sn",
	["nickel-ore"] = "Ni-9Fe-8S",
	["nickel-plate"] = "Ni",
	["tungsten-ore"] = "2Fe-O3",
	["tungsten-plate"] = "2Fe-O3",
	["titanium-ore"] = "W-O3",
	["titanium-plate"] = "W",
	["neutronium-ore"] = "5Neu-2H-3Fe-Cu",
	["neutronium-plate"] = "Neu",
	["cobalt-ore"] = "Co-As-S",
	["cobalt-plate"] = "Co",
	["arditium-ore"] = "Ard-Co-Fe-Cu",
	["arditium-plate"] = "Ard",
	["uranium-ore"] = "U-O2",
	["electrum-plate"] = "10Au-4Ag",
	["invar-plate"] = "9Fe-4Ni",
	["bronze-plate"] = "2Sn-12Cu",
	["stainless-steel-plate"] = "9Fe-6C-4Ni",
	["steel-plate"] = "9Fe-C",
	["electranium-plate"] = "6Ard-4Ag-10Au",
	["arditium-tungstenate-plate"] = "10Ard-8Fe-12O",
	["tungstvar-plate"] = "7Fe-9O-4Ni",
	["hydrogen"] = "H",
	["oxygen"] = "O",
	["carbon-monoxide"] = "C-O",
	["carbon-dioxide"] = "C-O2",
	["hydrogen-peroxide"] = "H2-O2",
	["nitrogen"] = "N",
	["methane"] = "CH4",
	["argon"] = "Ar",
	["boron"] = "Bo",
	--["coal"] = "5C2Hg",
}

for k,v in pairs(Data_Locale_Chemical_Formula) do
	if data.raw.item[k] then
		if data.raw.item[k].DyWorld then
			data.raw.item[k].DyWorld.Locale_Chemical = v
		else
			data.raw.item[k].DyWorld = {Locale_Chemical = v}
		end
	end
	if data.raw.fluid[k] then
		if data.raw.fluid[k].DyWorld then
			data.raw.fluid[k].DyWorld.Locale_Chemical = v
		else
			data.raw.fluid[k].DyWorld = {Locale_Chemical = v}
		end
	end
end