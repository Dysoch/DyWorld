
if data.raw.generator["steam-engine"] then
    data.raw.generator["steam-engine"].fluid_box.filter = nil
    data.raw.generator["steam-engine"].fluid_usage_per_tick = (4 / 60)
    data.raw.generator["steam-engine"].effectivity = 1
    data.raw.generator["steam-engine"].maximum_temperature = 250
    data.raw.generator["steam-engine"].next_upgrade = "steam-engine-2"
    data.raw.generator["steam-engine"].fast_replaceable_group = "energy"
    data.raw.generator["steam-engine"].max_power_output = (500000 / 60).."J" -- 0.5 MW
    data.raw.generator["steam-engine"].max_health = Dy_Diff(200, 0, nil)
end

if data.raw.item["steam-engine"] then
    data.raw.item["steam-engine"].subgroup = DyDs.."steam-engine"
end

local DyWorld_Prototype_1a = DyW.Fx.DC("generator", "steam-engine", "steam-engine-2")
local DyWorld_Prototype_1b = DyW.Fx.DC("item", "steam-engine", "steam-engine-2")
local DyWorld_Prototype_2a = DyW.Fx.DC("generator", "steam-engine", "steam-engine-3")
local DyWorld_Prototype_2b = DyW.Fx.DC("item", "steam-engine", "steam-engine-3")

DyWorld_Prototype_1a.fluid_usage_per_tick = (8 / 60)
DyWorld_Prototype_1a.maximum_temperature = 500
DyWorld_Prototype_1a.effectivity = 1
DyWorld_Prototype_1a.max_health = Dy_Diff(500, 0, nil)
DyWorld_Prototype_1a.max_power_output = (1500000 / 60).."J" -- 1.5 MW
DyWorld_Prototype_1a.next_upgrade = "steam-engine-3"
DyWorld_Prototype_1a.fast_replaceable_group = "energy"
DyWorld_Prototype_1b.subgroup = DyDs.."steam-engine"

DyWorld_Prototype_2a.fluid_usage_per_tick = (16 / 60)
DyWorld_Prototype_2a.maximum_temperature = 1000
DyWorld_Prototype_2a.effectivity = 1
DyWorld_Prototype_2a.max_health = Dy_Diff(1000, 0, nil)
DyWorld_Prototype_2a.max_power_output = (4500000 / 60).."J" -- 4.5 MW
DyWorld_Prototype_2a.next_upgrade = nil
DyWorld_Prototype_2a.fast_replaceable_group = "energy"
DyWorld_Prototype_2b.subgroup = DyDs.."steam-engine"

data:extend({
    DyWorld_Prototype_1a,
    DyWorld_Prototype_1b,
    DyWorld_Prototype_2a,
    DyWorld_Prototype_2b,
})