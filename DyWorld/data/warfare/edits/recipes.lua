




if settings.startup["DyWorld_Logistics"].value then
table.remove(data.raw.recipe["flamethrower-turret"].ingredients,3)
local result = {dy.."stone-pipe", 10}
table.insert(data.raw.recipe["flamethrower-turret"].ingredients,result)
end