

if data.raw["solar-panel"]["solar-panel"] then
    data.raw["solar-panel"]["solar-panel"].next_upgrade = "solar-panel-2"
    data.raw["solar-panel"]["solar-panel"].fast_replaceable_group = "energy"
    data.raw["solar-panel"]["solar-panel"].max_health = Dy_Diff(200, 0, nil)
    data.raw["solar-panel"]["solar-panel"].production = "100kW"
end

if data.raw.item["solar-panel"] then
    data.raw.item["solar-panel"].subgroup = DyDs.."solar"
end

local DyWorld_Prototype_1a = DyW.Fx.DC("solar-panel", "solar-panel", "solar-panel-2")
local DyWorld_Prototype_1b = DyW.Fx.DC("item", "solar-panel", "solar-panel-2")
local DyWorld_Prototype_2a = DyW.Fx.DC("solar-panel", "solar-panel", "solar-panel-3")
local DyWorld_Prototype_2b = DyW.Fx.DC("item", "solar-panel", "solar-panel-3")

DyWorld_Prototype_1a.next_upgrade = "solar-panel-3"
DyWorld_Prototype_1a.fast_replaceable_group = "energy"
DyWorld_Prototype_1a.max_health = Dy_Diff(500, 0, nil)
DyWorld_Prototype_1a.production = "500kW"
DyWorld_Prototype_1b.subgroup = DyDs.."solar"

DyWorld_Prototype_2a.next_upgrade = nil
DyWorld_Prototype_2a.fast_replaceable_group = "energy"
DyWorld_Prototype_2a.max_health = Dy_Diff(1000, 0, nil)
DyWorld_Prototype_2a.production = "2500kW"
DyWorld_Prototype_2b.subgroup = DyDs.."solar"

data:extend({
    DyWorld_Prototype_1a,
    DyWorld_Prototype_1b,
    DyWorld_Prototype_2a,
    DyWorld_Prototype_2b,
})