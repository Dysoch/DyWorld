require "data/prefix"

if settings.startup["DyWorld_Warfare"].value then

end

if settings.startup["DyWorld_Modules"].value then

end

if settings.startup["DyWorld_Processing"].value then

end

if settings.startup["DyWorld_Power"].value then
	table.remove(data.raw.recipe["trader-accu-sel"].ingredients,1)
	local result = {dy.."wood-accumulator-normal", 4}
	table.insert(data.raw.recipe["trader-accu-sel"].ingredients,result)
	table.remove(data.raw.recipe["trader-accu-buy"].ingredients,1)
	local result = {dy.."wood-accumulator-normal", 4}
	table.insert(data.raw.recipe["trader-accu-buy"].ingredients,result)
	
	table.remove(data.raw.recipe["trader-accu-sel-mk2"].ingredients,1)
	local result = {dy.."iron-accumulator-normal", 6}
	table.insert(data.raw.recipe["trader-accu-sel-mk2"].ingredients,result)
	table.remove(data.raw.recipe["trader-accu-buy-mk2"].ingredients,1)
	local result = {dy.."iron-accumulator-normal", 6}
	table.insert(data.raw.recipe["trader-accu-buy-mk2"].ingredients,result)
	
	table.remove(data.raw.recipe["trader-accu-sel-mk3"].ingredients,1)
	local result = {dy.."tungsten-accumulator-normal", 8}
	table.insert(data.raw.recipe["trader-accu-sel-mk3"].ingredients,result)
	table.remove(data.raw.recipe["trader-accu-buy-mk3"].ingredients,1)
	local result = {dy.."tungsten-accumulator-normal", 8}
	table.insert(data.raw.recipe["trader-accu-buy-mk3"].ingredients,result)
	
	table.remove(data.raw.recipe["trader-accu-sel-mk4"].ingredients,1)
	local result = {dy.."steel-accumulator-normal", 10}
	table.insert(data.raw.recipe["trader-accu-sel-mk4"].ingredients,result)
	table.remove(data.raw.recipe["trader-accu-buy-mk4"].ingredients,1)
	local result = {dy.."steel-accumulator-normal", 10}
	table.insert(data.raw.recipe["trader-accu-buy-mk4"].ingredients,result)
end

if settings.startup["DyWorld_Logistics"].value then
	table.remove(data.raw.recipe["trader-chst-sel"].ingredients,1)
	local result = {dy.."stone-chest", 1}
	table.insert(data.raw.recipe["trader-chst-sel"].ingredients,result)
	table.remove(data.raw.recipe["trader-chst-buy"].ingredients,1)
	local result = {dy.."stone-chest", 1}
	table.insert(data.raw.recipe["trader-chst-buy"].ingredients,result)
	
	table.remove(data.raw.recipe["trader-chst-sel-mk2"].ingredients,1)
	local result = {dy.."iron-chest", 2}
	table.insert(data.raw.recipe["trader-chst-sel-mk2"].ingredients,result)
	table.remove(data.raw.recipe["trader-chst-buy-mk2"].ingredients,1)
	local result = {dy.."iron-chest", 2}
	table.insert(data.raw.recipe["trader-chst-buy-mk2"].ingredients,result)
	
	table.remove(data.raw.recipe["trader-chst-sel-mk3"].ingredients,1)
	local result = {dy.."tungsten-chest", 3}
	table.insert(data.raw.recipe["trader-chst-sel-mk3"].ingredients,result)
	table.remove(data.raw.recipe["trader-chst-buy-mk3"].ingredients,1)
	local result = {dy.."tungsten-chest", 3}
	table.insert(data.raw.recipe["trader-chst-buy-mk3"].ingredients,result)
	
	table.remove(data.raw.recipe["trader-chst-sel-mk4"].ingredients,1)
	local result = {dy.."steel-chest", 4}
	table.insert(data.raw.recipe["trader-chst-sel-mk4"].ingredients,result)
	table.remove(data.raw.recipe["trader-chst-buy-mk4"].ingredients,1)
	local result = {dy.."steel-chest", 4}
	table.insert(data.raw.recipe["trader-chst-buy-mk4"].ingredients,result)
	
	table.remove(data.raw.recipe["trader-tank-sel"].ingredients,1)
	local result = {dy.."stone-storage-tank", 1}
	table.insert(data.raw.recipe["trader-tank-sel"].ingredients,result)
	table.remove(data.raw.recipe["trader-tank-buy"].ingredients,1)
	local result = {dy.."stone-storage-tank", 1}
	table.insert(data.raw.recipe["trader-tank-buy"].ingredients,result)
	
	table.remove(data.raw.recipe["trader-tank-sel-mk2"].ingredients,1)
	local result = {dy.."iron-storage-tank", 2}
	table.insert(data.raw.recipe["trader-tank-sel-mk2"].ingredients,result)
	table.remove(data.raw.recipe["trader-tank-buy-mk2"].ingredients,1)
	local result = {dy.."iron-storage-tank", 2}
	table.insert(data.raw.recipe["trader-tank-buy-mk2"].ingredients,result)
	
	table.remove(data.raw.recipe["trader-tank-sel-mk3"].ingredients,1)
	local result = {dy.."tungsten-storage-tank", 3}
	table.insert(data.raw.recipe["trader-tank-sel-mk3"].ingredients,result)
	table.remove(data.raw.recipe["trader-tank-buy-mk3"].ingredients,1)
	local result = {dy.."tungsten-storage-tank", 3}
	table.insert(data.raw.recipe["trader-tank-buy-mk3"].ingredients,result)
	
	table.remove(data.raw.recipe["trader-tank-sel-mk4"].ingredients,1)
	local result = {dy.."steel-storage-tank", 4}
	table.insert(data.raw.recipe["trader-tank-sel-mk4"].ingredients,result)
	table.remove(data.raw.recipe["trader-tank-buy-mk4"].ingredients,1)
	local result = {dy.."steel-storage-tank", 4}
	table.insert(data.raw.recipe["trader-tank-buy-mk4"].ingredients,result)
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