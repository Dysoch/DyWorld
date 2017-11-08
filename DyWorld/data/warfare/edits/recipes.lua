


data.raw.recipe["gun-turret"].hidden = true
data.raw.recipe["laser-turret"].hidden = true

data.raw.recipe["piercing-shotgun-shell"].hidden = true
data.raw.recipe["shotgun-shell"].hidden = true
data.raw.recipe["uranium-rounds-magazine"].hidden = true
data.raw.recipe["piercing-rounds-magazine"].hidden = true
data.raw.recipe["firearm-magazine"].hidden = true

table.remove(data.raw.recipe["flamethrower-turret"].ingredients,3)
local result = {dy.."stone-pipe", 10}
table.insert(data.raw.recipe["flamethrower-turret"].ingredients,result)

table.remove(data.raw.recipe["military-science-pack"].ingredients,3)
table.remove(data.raw.recipe["military-science-pack"].ingredients,1)
local result = {dy.."iron-basic-piercing-ammo", 1}
table.insert(data.raw.recipe["military-science-pack"].ingredients,result)
local result = {dy.."lead-shotgun-turret", 1}
table.insert(data.raw.recipe["military-science-pack"].ingredients,result)