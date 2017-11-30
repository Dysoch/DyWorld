


data.raw.recipe["gun-turret"].hidden = true
data.raw.recipe["laser-turret"].hidden = true

data.raw.recipe["piercing-shotgun-shell"].hidden = true
data.raw.recipe["shotgun-shell"].hidden = true
data.raw.recipe["uranium-rounds-magazine"].hidden = true
data.raw.recipe["piercing-rounds-magazine"].hidden = true
data.raw.recipe["firearm-magazine"].hidden = true

data.raw.recipe["cannon-shell"].normal.hidden = true
data.raw.recipe["cannon-shell"].expensive.hidden = true
data.raw.recipe["explosive-cannon-shell"].normal.hidden = true
data.raw.recipe["explosive-cannon-shell"].expensive.hidden = true
data.raw.recipe["uranium-cannon-shell"].hidden = true
data.raw.recipe["explosive-uranium-cannon-shell"].hidden = true

if settings.startup["DyWorld_Logistics"].value then
table.remove(data.raw.recipe["flamethrower-turret"].ingredients,3)
local result = {dy.."stone-pipe", 10}
table.insert(data.raw.recipe["flamethrower-turret"].ingredients,result)
end

table.remove(data.raw.recipe["defender-capsule"].ingredients,1)
local result = {dy.."steel-basic-ammo", 1}
table.insert(data.raw.recipe["defender-capsule"].ingredients,result)

table.remove(data.raw.recipe["personal-laser-defense-equipment"].ingredients,3)
local result = {dy.."lead-laser-turret", 1}
table.insert(data.raw.recipe["personal-laser-defense-equipment"].ingredients,result)

table.remove(data.raw.recipe["discharge-defense-equipment"].ingredients,3)
local result = {dy.."tin-laser-turret", 5}
table.insert(data.raw.recipe["discharge-defense-equipment"].ingredients,result)

table.remove(data.raw.recipe["gate"].ingredients,1)
local result = {dy.."stone-wall", 1}
table.insert(data.raw.recipe["gate"].ingredients,result)