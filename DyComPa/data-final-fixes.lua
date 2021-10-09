



require("data.data")

for k,v in pairs(data.raw.recipe) do
	if settings.startup["DyWorld_Realistic_Recipes"].value then
		if v.normal and not v.expensive then
			v.expensive = {}
			EXPEN = table.deepcopy(v.normal)
			if v.normal.energy_required then
				EXPEN.energy_required = v.normal.energy_required * 2.5
			elseif v.energy_required then
				EXPEN.energy_required = v.energy_required * 2.5
				v.normal.energy_required = v.energy_required 
			end
			for index,ingredient in pairs(EXPEN.ingredients) do
				if ingredient.amount then 
					if math.floor(ingredient.amount * ER_Mod) > 65535 then
						ingredient.amount = 65535
					else
						ingredient.amount = math.floor(ingredient.amount * ER_Mod)
					end
				end
			end
			v.expensive = EXPEN
		end
	else
		if v.normal then
			v.expensive = {}
			EXPEN = table.deepcopy(v.normal)
			if v.normal.energy_required then
				EXPEN.energy_required = v.normal.energy_required * 2.5
			elseif v.energy_required then
				EXPEN.energy_required = v.energy_required * 2.5
				v.normal.energy_required = v.energy_required 
			end
			for index,ingredient in pairs(EXPEN.ingredients) do
				if ingredient.amount then 
					if math.floor(ingredient.amount * ER_Mod) > 65535 then
						ingredient.amount = 65535
					else
						ingredient.amount = math.floor(ingredient.amount * ER_Mod)
					end
				end
			end
			v.expensive = EXPEN
		end
	end
end

for _,type in pairs({"item", "fluid", "recipe", "module", "ammo", "capsule", "tool", "gun", "armor", "rail-planner", "repair-tool"}) do
	for _,v in pairs(data.raw[type]) do
		if v.DyWorld_Hider then
			v.hidden = true
			if v.normal then
				v.normal.hidden = true
			end
			if v.expensive then
				v.expensive.hidden = true
			end
			if v.prerequisites then
				v.prerequisites = {}
			end
		end
	end
end

local Stats_Table = {}
local Stats_Table_Total = 0
for Type,Table in pairs(data.raw) do
	Stats_Table[Type] = 0
	for k,v in pairs(data.raw[Type]) do
		Stats_Table[Type] = Stats_Table[Type] + 1
		Stats_Table_Total = Stats_Table_Total + 1
	end
end

log("DyComPa: checksum complete, no errors. Statistics following:")
log("DyComPa: data.raw. holds a total of "..Stats_Table_Total.." entries")
for k,v in pairs(Stats_Table) do
	log("DyComPa: data.raw."..k.." holds "..v.." entries")
end