
if data.raw.boiler.boiler then
    data.raw.boiler.boiler.fluid_box.filter = nil
    data.raw.boiler.boiler.target_temperature = 250
    data.raw.boiler.boiler.next_upgrade = "boiler-2"
    data.raw.boiler.boiler.energy_consumption = "1MW"
    data.raw.boiler.boiler.fast_replaceable_group = "energy"
    data.raw.boiler.boiler.energy_source.effectivity = 1
    data.raw.boiler.boiler.energy_source.fuel_categories = {DyDs.."carbon"}
end

local DyWorld_Prototype_1a = DyW.Fx.DC("boiler", "boiler", "boiler-2")
local DyWorld_Prototype_1b = DyW.Fx.DC("item", "boiler", "boiler-2")
local DyWorld_Prototype_2a = DyW.Fx.DC("boiler", "boiler", "boiler-3")
local DyWorld_Prototype_2b = DyW.Fx.DC("item", "boiler", "boiler-3")


DyWorld_Prototype_1a.target_temperature = 500
DyWorld_Prototype_1a.energy_source.effectivity = 1
DyWorld_Prototype_1a.energy_source.fuel_categories = {DyDs.."carbon", DyDs.."chemical"}
DyWorld_Prototype_1a.next_upgrade = "boiler-3"
DyWorld_Prototype_1a.fast_replaceable_group = "energy"
DyWorld_Prototype_1a.energy_consumption = "2MW"

DyWorld_Prototype_2a.target_temperature = 1000
DyWorld_Prototype_2a.energy_source.effectivity = 1
DyWorld_Prototype_2a.energy_source.fuel_categories = {DyDs.."carbon", DyDs.."chemical", DyDs.."oil"}
DyWorld_Prototype_2a.next_upgrade = nil
DyWorld_Prototype_2a.fast_replaceable_group = "energy"
DyWorld_Prototype_2a.energy_consumption = "4MW"

data:extend({
    DyWorld_Prototype_1a,
    DyWorld_Prototype_1b,
    DyWorld_Prototype_2a,
    DyWorld_Prototype_2b,
})