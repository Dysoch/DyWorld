require "data/core/functions/prefix"

 -- FARL --
if mods["FARL"] then
data.raw["item-with-entity-data"]["farl"].subgroup = dy.."locomotive"
data.raw["item-with-entity-data"]["farl"].order = Order_Tiers["single"]
data.raw.item["farl-roboport"].subgroup = dy.."locomotive"
data.raw.item["farl-roboport"].order = Order_Tiers["single"]
end

 -- Nanobots --
if mods["Nanobots"] then
data.raw.gun["gun-nano-emitter"].subgroup = dy.."mod-nanobots"
data.raw.ammo["ammo-nano-constructors"].subgroup = dy.."mod-nanobots"
data.raw.ammo["ammo-nano-termites"].subgroup = dy.."mod-nanobots"
data.raw.item["equipment-bot-chip-feeder"].subgroup = dy.."mod-nanobots"
data.raw.item["equipment-bot-chip-items"].subgroup = dy.."mod-nanobots"
data.raw.item["equipment-bot-chip-launcher"].subgroup = dy.."mod-nanobots"
data.raw.item["equipment-bot-chip-nanointerface"].subgroup = dy.."mod-nanobots"
data.raw.item["equipment-bot-chip-trees"].subgroup = dy.."mod-nanobots"
data.raw.item["roboport-interface"].subgroup = dy.."mod-nanobots"
end