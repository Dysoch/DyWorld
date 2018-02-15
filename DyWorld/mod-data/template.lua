require "data/prefix"

if settings.startup["DyWorld_Warfare"].value then

end

if settings.startup["DyWorld_Modules"].value then

end

if settings.startup["DyWorld_Processing"].value then

end

if settings.startup["DyWorld_Power"].value then

end

if settings.startup["DyWorld_Logistics"].value then

end

if settings.startup["DyWorld_Extraction"].value then

end

if settings.startup["DyWorld_Story"].value then

end

if settings.startup["DyWorld_Needs"].value then

end

if settings.startup["DyWorld_Metallurgy"].value then

end

if settings.startup["DyWorld_Equipment"].value then

end

if settings.startup["DyWorld_Chemistry"].value then

end

--[[
table.remove(data.raw.recipe[""].ingredients,1)
local result = {dy.."", 1}
table.insert(data.raw.recipe[""].ingredients,result)
]]--