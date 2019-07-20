
for k,v in pairs(data.raw.item) do
	if v.Locale_Chemical then
		v.localised_description = {"looped-name.chemical-formula", v.Locale_Chemical}
	end
end

