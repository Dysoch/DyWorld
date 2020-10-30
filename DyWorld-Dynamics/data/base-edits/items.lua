




-- Fuel --
data.raw.item["wood"].fuel_category = "carbon"
data.raw.item["coal"].fuel_category = "carbon"

data.raw.item["landfill"].subgroup = DyDs.."flooring-1"
data.raw.item["concrete"].subgroup = DyDs.."flooring-2"
data.raw.item["hazard-concrete"].subgroup = DyDs.."flooring-2"
data.raw.item["refined-concrete"].subgroup = DyDs.."flooring-3"
data.raw.item["refined-hazard-concrete"].subgroup = DyDs.."flooring-3"

data.raw.item["arithmetic-combinator"].subgroup = DyDs.."circuit-network"
data.raw.item["decider-combinator"].subgroup = DyDs.."circuit-network"
data.raw.item["constant-combinator"].subgroup = DyDs.."circuit-network"
data.raw.item["power-switch"].subgroup = DyDs.."circuit-network"
data.raw.item["programmable-speaker"].subgroup = DyDs.."circuit-network"


data.raw.item["red-wire"].subgroup = DyDs.."material-2"
data.raw.item["green-wire"].subgroup = DyDs.."material-2"

data.raw.item["logistic-chest-passive-provider"].subgroup = DyDs.."chests"
data.raw.item["logistic-chest-passive-provider"].order = "5a"
data.raw.item["logistic-chest-active-provider"].subgroup = DyDs.."chests"
data.raw.item["logistic-chest-active-provider"].order = "5d"
data.raw.item["logistic-chest-storage"].subgroup = DyDs.."chests"
data.raw.item["logistic-chest-storage"].order = "5c"
data.raw.item["logistic-chest-buffer"].subgroup = DyDs.."chests"
data.raw.item["logistic-chest-buffer"].order = "5e"
data.raw.item["logistic-chest-requester"].subgroup = DyDs.."chests"
data.raw.item["logistic-chest-requester"].order = "5b"

data.raw.item["small-lamp"].subgroup = DyDs.."lamps"

data.raw["rail-planner"]["rail"].subgroup = DyDs.."rail"
data.raw["rail-planner"]["rail"].stack_size = 500
data.raw.item["train-stop"].subgroup = DyDs.."rail"
data.raw.item["rail-signal"].subgroup = DyDs.."rail"
data.raw.item["rail-signal"].stack_size = 500
data.raw.item["rail-chain-signal"].subgroup = DyDs.."rail"
data.raw.item["rail-chain-signal"].stack_size = 500
data.raw["item-with-entity-data"]["cargo-wagon"].subgroup = DyDs.."rail"
data.raw["item-with-entity-data"]["fluid-wagon"].subgroup = DyDs.."rail"

data.raw.item["stone-brick"].stack_size = 5000
data.raw.item["stone-brick"].subgroup = DyDs.."material-1"
data.raw.item["stone-brick"].order = "stone-brick"

data.raw.capsule["raw-fish"].capsule_action.attack_parameters.ammo_type.action.action_delivery.target_effects[1].damage.amount = 25
data.raw.capsule["raw-fish"].subgroup = DyDs.."material-1"

data.raw["repair-tool"]["repair-pack"].subgroup = "dyworld-hidden-items"

data.raw.item["solar-panel-equipment"].subgroup = DyDs.."equipment-energy"
data.raw.item["fusion-reactor-equipment"].subgroup = DyDs.."equipment-energy"
data.raw.item["battery-equipment"].subgroup = DyDs.."equipment-energy"
data.raw.item["battery-mk2-equipment"].subgroup = DyDs.."equipment-energy"

data.raw.item["energy-shield-equipment"].subgroup = DyDs.."equipment-defense"
data.raw.item["energy-shield-mk2-equipment"].subgroup = DyDs.."equipment-defense"
data.raw.item["personal-laser-defense-equipment"].subgroup = DyDs.."equipment-defense"
data.raw.item["discharge-defense-equipment"].subgroup = DyDs.."equipment-defense"
data.raw.capsule["discharge-defense-remote"].subgroup = DyDs.."equipment-defense"

data.raw.item["belt-immunity-equipment"].subgroup = DyDs.."equipment-qol"
data.raw.item["exoskeleton-equipment"].subgroup = DyDs.."equipment-qol"
data.raw.item["personal-roboport-equipment"].subgroup = DyDs.."equipment-qol"
data.raw.item["personal-roboport-mk2-equipment"].subgroup = DyDs.."equipment-qol"
data.raw.item["night-vision-equipment"].subgroup = DyDs.."equipment-qol"

-- Nanobots --
data.raw.ammo["ammo-nano-constructors"].magazine_size = 100000000000000000000000000000000
data.raw.ammo["ammo-nano-constructors"].localised_name = {"DyDs-story.coica-1"}
data.raw.ammo["ammo-nano-constructors"].localised_description = {"DyDs-story.coica-2"}
data.raw.ammo["ammo-nano-constructors"].subgroup = DyDs.."mod-nanobots"
data.raw.ammo["ammo-nano-termites"].subgroup = DyDs.."mod-nanobots"
data.raw.gun["gun-nano-emitter"].subgroup = DyDs.."mod-nanobots"

data.raw.item["equipment-bot-chip-trees"].subgroup = DyDs.."equipment-qol"
data.raw.item["equipment-bot-chip-nanointerface"].subgroup = DyDs.."equipment-qol"
data.raw.item["equipment-bot-chip-launcher"].subgroup = DyDs.."equipment-defense"
data.raw.item["equipment-bot-chip-items"].subgroup = DyDs.."equipment-qol"
data.raw.item["equipment-bot-chip-feeder"].subgroup = DyDs.."equipment-qol"
data.raw.item["roboport-interface"].subgroup = DyDs.."equipment-qol"