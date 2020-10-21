




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

data.raw.item["stone-brick"].stack_size = 500
data.raw.item["stone-brick"].subgroup = DyDs.."material-1"
data.raw.item["stone-brick"].order = "stone-brick"

data.raw.capsule["raw-fish"].capsule_action.attack_parameters.ammo_type.action.action_delivery.target_effects[1].damage.amount = 25
data.raw.capsule["raw-fish"].subgroup = DyDs.."material-1"

data.raw["repair-tool"]["repair-pack"].subgroup = "dyworld-hidden-items"

-- Nanobots --
data.raw.ammo["ammo-nano-constructors"].magazine_size = 100000000000000000000000000000000
data.raw.ammo["ammo-nano-constructors"].localised_name = {"DyDs-story.coica-1"}
data.raw.ammo["ammo-nano-constructors"].localised_description = {"DyDs-story.coica-2"}
data.raw.ammo["ammo-nano-constructors"].subgroup = DyDs.."mod-nanobots"