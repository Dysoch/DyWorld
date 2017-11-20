


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

table.remove(data.raw.recipe["flamethrower-turret"].ingredients,3)
local result = {dy.."stone-pipe", 10}
table.insert(data.raw.recipe["flamethrower-turret"].ingredients,result)