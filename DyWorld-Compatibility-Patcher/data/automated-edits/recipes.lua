



for k,v in pairs(data.raw.recipe) do
	if v.category then
		if v.category == "crafting-with-fluid" then
			v.category = "assembling-tier-2"
		end
		if v.category == "crafting" then
			v.category = "assembling-tier-1"
		end
	else
		v.category = "assembling-tier-1"
	end
end