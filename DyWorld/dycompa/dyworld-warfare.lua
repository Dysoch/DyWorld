require "data/prefix"

local Change = {
	{Old = "radar", New = dy.."iron-radar"},
	{Old = "gun-turret", New = dy.."stone-gun-turret"},
	{Old = "laser-turret", New = dy.."iron-laser-turret"},
	{Old = "piercing-shotgun-shell", New = dy.."iron-shotgun-piercing-ammo"},
	{Old = "shotgun-shell", New = dy.."stone-shotgun-ammo"},
	{Old = "uranium-rounds-magazine", New = dy.."uranium-basic-ammo"},
	{Old = "piercing-rounds-magazine", New = dy.."iron-basic-piercing-ammo"},
	{Old = "firearm-magazine", New = dy.."stone-basic-ammo"},
	{Old = "cannon-shell", New = dy.."iron-cannon-shell"},
	{Old = "explosive-cannon-shell", New = dy.."steel-cannon-explosive-shell"},
	{Old = "uranium-cannon-shell", New = dy.."uranium-cannon-shell"},
	{Old = "explosive-uranium-cannon-shell", New = dy.."uranium-cannon-explosive-shell"},
	{Old = "grenade", New = dy.."iron-grenade"},
	{Old = "cluster-grenade", New = dy.."iron-cluster-grenade"},
	{Old = "stone-wall", New = dy.."stone-wall"},
	{Old = "light-armor", New = dy.."stone-armor"},
	{Old = "heavy-armor", New = dy.."iron-armor"},
	{Old = "land-mine", New = dy.."stone-mine"},
}

for k,v in pairs(Change) do
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
	if data.raw.recipe[m.Old] then
		if data.raw.recipe[m.Old].normal then
			data.raw.recipe[m.Old].normal.hidden = true
			data.raw.recipe[m.Old].expensive.hidden = true
		else
			data.raw.recipe[m.Old].hidden = true
		end
	end
end