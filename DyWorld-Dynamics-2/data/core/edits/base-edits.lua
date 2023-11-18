
if data.raw["mining-drill"]["burner-mining-drill"] then
    data.raw["mining-drill"]["burner-mining-drill"].energy_source.fuel_inventory_size = 2
end

if data.raw["assembling-machine"]["stone-furnace"] then
    data.raw["assembling-machine"]["stone-furnace"].energy_source.fuel_inventory_size = 2
end

if data.raw.recipe["gun-turret"] then
    data.raw.recipe["gun-turret"].enabled = true
end

if data.raw.recipe["iron-plate"] then
    data.raw.recipe["iron-plate"].hidden = true
    data.raw.recipe["iron-plate"].category = DyDs.."hidden"
end

if data.raw.recipe["copper-plate"] then
    data.raw.recipe["copper-plate"].hidden = true
    data.raw.recipe["copper-plate"].category = DyDs.."hidden"
end

if data.raw.boiler.boiler then
    data.raw.boiler.boiler.fluid_box.filter = nil
    data.raw.boiler.boiler.target_temperature = 250
end

if data.raw.generator["steam-engine"] then
    data.raw.generator["steam-engine"].fluid_box.filter = nil
    data.raw.generator["steam-engine"].maximum_temperature = 250
    data.raw.generator["steam-engine"].max_power_output = "1.5MJ"
end