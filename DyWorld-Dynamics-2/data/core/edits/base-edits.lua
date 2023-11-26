
if data.raw["mining-drill"]["burner-mining-drill"] then
    data.raw["mining-drill"]["burner-mining-drill"].energy_source.fuel_inventory_size = 2
    data.raw["mining-drill"]["burner-mining-drill"].energy_source.fuel_categories = {DyDs.."carbon"}
end

if data.raw["furnace"]["stone-furnace"] then
    data.raw["furnace"]["stone-furnace"].energy_source.fuel_inventory_size = 2
    data.raw["furnace"]["stone-furnace"].energy_source.fuel_categories = {DyDs.."carbon"}
end

if data.raw["assembling-machine"]["assembling-machine-1"] then
    data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories = {"crafting", "basic-crafting", "advanced-crafting", DyDs.."assembling-1", DyDs.."assembling-2"}
end

if data.raw["assembling-machine"]["assembling-machine-2"] then
    data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories = {"crafting", "basic-crafting", "advanced-crafting", DyDs.."assembling-1", DyDs.."assembling-2", "crafting-with-fluid"}
end

if data.raw["assembling-machine"]["assembling-machine-3"] then
    data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories = {"crafting", "basic-crafting", "advanced-crafting", DyDs.."assembling-1", DyDs.."assembling-2", "crafting-with-fluid", DyDs.."assembling-3", DyDs.."assembling-4"}
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

if data.raw.ammo["ammo-nano-constructors"] then
    data.raw.ammo["ammo-nano-constructors"].magazine_size = 100000000000000000000000000000000
    data.raw.ammo["ammo-nano-constructors"].stack_size = 1
end
