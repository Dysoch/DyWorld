


require("data.warfare.edits.entities")
require("data.warfare.edits.items")
require("data.warfare.edits.recipes")

require("data.warfare.armor.normal")

require("data.warfare.ammo.bullet")
require("data.warfare.ammo.grenades")

require("data.warfare.walls.walls")

require("data.warfare.guns.gun")
require("data.warfare.guns.recipe")

require("data.warfare.turrets.bullet")
require("data.warfare.turrets.laser")
require("data.warfare.turrets.grenade")

require("data.warfare.enemies.units")

local Remove_Table = {"gun-turret", "laser-turret", "piercing-shotgun-shell", "shotgun-shell", "uranium-rounds-magazine", "piercing-rounds-magazine", "firearm-magazine", "cannon-shell", "explosive-cannon-shell", "uranium-cannon-shell", "explosive-uranium-cannon-shell", "grenade", "cluster-grenade", "stone-wall", "light-armor", "heavy-armor"}

for k,m in pairs(Remove_Table) do
	for j,n in pairs(data.raw.technology) do
		if n.effects then
			for h,b in pairs(n.effects) do
				if b.recipe == m then
					table.remove(n.effects, h)
				end
			end
		end
	end
	if data.raw.recipe[m] then
		if data.raw.recipe[m].normal then
			data.raw.recipe[m].normal.hidden = true
			data.raw.recipe[m].expensive.hidden = true
		else
			data.raw.recipe[m].hidden = true
		end
	end
end