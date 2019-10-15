

local Change = {
	{Old = "firearm-magazine", New = "basic-ammo-earth"},
	{Old = "piercing-rounds-magazine", New = "piercing-ammo-earth"},
	{Old = "uranium-rounds-magazine", New = "piercing-ammo-poison"},
	{Old = "radar", New = "stone-radar"},
	{Old = "laser-turret", New = "gold-beam-turret"},
	{Old = "gun-turret", New = "stone-gun-turret"},
	{Old = "light-armor", New = "modular-armor-tier-1"},
	{Old = "heavy-armor", New = "modular-armor-tier-2"},
	{Old = "modular-armor", New = "modular-armor-tier-3"},
	{Old = "power-armor", New = "modular-armor-tier-4"},
	{Old = "power-armor-mk2", New = "modular-armor-tier-5"},
}

for k,v in pairs(Change) do
	if v.New then
		for _, Recipe in pairs(data.raw.recipe) do
			if Recipe.ingredients then
				for _, b in pairs(Recipe.ingredients) do
					if b.name then
						if b.name == v.Old then
							b.name = v.New
						end
					elseif b[1] == v.Old then
						b[1] = v.New
					end
				end
			end
			if Recipe.normal and Recipe.normal.ingredients then
				for _, b in pairs(Recipe.normal.ingredients) do
					if b.name then
						if b.name == v.Old then
							b.name = v.New
						end
					elseif b[1] == v.Old then
						b[1] = v.New
					end
				end
			end
			if Recipe.expensive and Recipe.expensive.ingredients then
				for _, b in pairs(Recipe.expensive.ingredients) do
					if b.name then
						if b.name == v.Old then
							b.name = v.New
						end
					elseif b[1] == v.Old then
						b[1] = v.New
					end
				end
			end
		end
	end
end

for k,m in pairs(Change) do
	for j,n in pairs(data.raw.technology) do
		if n.effects then
			for h,b in pairs(n.effects) do
				if b.recipe == m.Old then
					table.remove(n.effects, h)
				end
			end
		end
	end
	if m.New then
		if data.raw.item[m.Old] then
			data.raw.item[m.Old].DyWorld_Hidden = true
			data.raw.item[m.Old].subgroup = "dyworld-hidden-items"
		end
		if data.raw.ammo[m.Old] then
			data.raw.ammo[m.Old].DyWorld_Hidden = true
			data.raw.ammo[m.Old].subgroup = "dyworld-hidden-items"
		end
		if data.raw.armor[m.Old] then
			data.raw.armor[m.Old].DyWorld_Hidden = true
			data.raw.armor[m.Old].subgroup = "dyworld-hidden-items"
		end
		if data.raw.capsule[m.Old] then
			data.raw.capsule[m.Old].DyWorld_Hidden = true
			data.raw.capsule[m.Old].subgroup = "dyworld-hidden-items"
		end
		if data.raw["transport-belt"][m.Old] then
			if data.raw["transport-belt"][m.Old].next_upgrade then
				data.raw["transport-belt"][m.Old].next_upgrade = nil
			end
		end
		if data.raw["splitter"][m.Old] then
			if data.raw["splitter"][m.Old].next_upgrade then
				data.raw["splitter"][m.Old].next_upgrade = nil
			end
		end
		if data.raw["underground-belt"][m.Old] then
			if data.raw["underground-belt"][m.Old].next_upgrade then
				data.raw["underground-belt"][m.Old].next_upgrade = nil
			end
		end
		if data.raw["inserter"][m.Old] then
			if data.raw["inserter"][m.Old].next_upgrade then
				data.raw["inserter"][m.Old].next_upgrade = nil
			end
		end
		if data.raw.recipe[m.Old] then
			if data.raw.recipe[m.Old].normal then
				data.raw.recipe[m.Old].normal.hidden = true
				data.raw.recipe[m.Old].expensive.hidden = true
			else
				data.raw.recipe[m.Old].hidden = true
			end
		end
	end
end