
for k,v in pairs(data.raw.item) do
	if v.DyWorld and v.DyWorld.Locale_Chemical then
		v.localised_description = {"looped-name.chemical-formula", v.DyWorld.Locale_Chemical}
	end
end

for k,v in pairs(data.raw.fluid) do
	if v.DyWorld and v.DyWorld.Locale_Chemical then
		v.localised_description = {"looped-name.chemical-formula", v.DyWorld.Locale_Chemical}
	end
end

