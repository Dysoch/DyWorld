DyDs = "dyworld-"
DyDs_debug_prefix = "dyworld-debug-"

ER_Mod = settings.startup["DyWorld_Expensive_Modifier"].value

-- graphical
DyDs_path_icon = "__DyWorld-Dynamics__/graphics/icons/"
DyDs_path_looped = "__DyWorld-Dynamics__/graphics/looped/"
DyDs_path_icon_base = "__base__/graphics/icons/"
DyDs_path_damage = "__DyWorld-Dynamics__/graphics/damage/"
DyDs_path_fluid = "__DyWorld-Dynamics__/graphics/fluids/"
DyDs_path_tech = "__DyWorld-Dynamics__/graphics/technology/"
DyDs_path_tech_base = "__base__/graphics/technology/"
DyDs_path_entity = "__DyWorld-Dynamics__/graphics/entity/"
DyDs_path_equipment = "__DyWorld-Dynamics__/graphics/equipment/"
DyDs_path_tile = "__DyWorld-Dynamics__/graphics/tiles/"
DyDs_path_item_group = "__DyWorld-Dynamics__/graphics/item-group/"
DyDs_tech_temp = "__base__/graphics/technology/radar.png"
DyDs_icon_temp = "__DyWorld-Dynamics__/graphics/questionmark.png"

-- data paths
DyDs_data_core = "data.core."
DyDs_data_base_edits = "data.base-edits."
DyDs_data_resources = "data.resources."
DyDs_data_warfare = "data.warfare."
DyDs_data_machines = "data.machines."
DyDs_data_logistics = "data.logistics."
DyDs_data_tech = "data.tech."
DyDs_data_equipment = "data.equipment."
DyDs_data_nuclear = "data.nuclear."

DyDs_Inserter_Normal_Pickup = {0, -1}
DyDs_Inserter_Normal_Insert = {0, 1.2}
DyDs_Inserter_Long_Pickup = {0, -2}
DyDs_Inserter_Long_Insert = {0, 2.2}
DyDs_Inserter_Extra_Long_Pickup = {0, -3}
DyDs_Inserter_Extra_Long_Insert = {0, 3.2}

Tier_1 = {255, 255, 0}
Tier_2 = {255, 165, 0}
Tier_3 = {255, 0, 0}
Tier_4 = {0, 255, 255}
Tier_5 = {0, 0, 255}

Tier_Colors = {
	[1] = {255, 255, 0},
	[2] = {255, 165, 0},
	[3] = {255, 0, 0},
	[4] = {0, 255, 255},
	[5] = {0, 0, 255},
}

-- Automation --
Sci_Tier_1 = {200, 0, 0}
Sci_Tier_2 = {255, 0, 0}
-- Logistical --
Sci_Tier_3 = {50, 200, 50}
Sci_Tier_4 = {50, 255, 50}
-- Chemical --
Sci_Tier_5 = {0, 0, 200}
Sci_Tier_6 = {0, 0, 255}
-- Military --
Sci_Tier_7 = {25, 25, 25}
Sci_Tier_8 = {0, 0, 0}
-- Production --
Sci_Tier_9 = {200, 0, 200}
Sci_Tier_10 = {255, 0, 255}
-- Utility --
Sci_Tier_11 = {200, 200, 0}
Sci_Tier_12 = {255, 255, 0}
-- Space --
Sci_Tier_13 = {128, 128, 128}
Sci_Tier_14 = {170, 170, 170}
-- Bio --
Sci_Tier_15 = {0, 200, 0}
Sci_Tier_16 = {0, 255, 0}
-- Unused --
Sci_Tier_17 = {255, 255, 255}
Sci_Tier_18 = {255, 255, 255}
Sci_Tier_19 = {255, 255, 255}
Sci_Tier_20 = {255, 255, 255}

Iron_Color = {82, 174, 212}
Copper_Color = {212, 119, 82}
Tin_Color = {39, 105, 135}
Steel_Color = {229, 227, 227}
Bronze_Color = {126, 112, 109}
Titanium_Color = {57, 61, 112}
Magnesium_Color = {92, 114, 208}
Aluminium_Color = {170, 170, 170}
Lead_Color = {118, 136, 143}
Silver_Color = {192, 192, 192}
Gold_Color = {212, 175, 55}

Dy_Metal_Colors = {
	["iron"] = {82, 174, 212},
	["copper"] = {212, 119, 82},
	["tin"] = {39, 105, 135},
	["steel"] = {229, 227, 227},
	["bronze"] = {126, 112, 109},
	["titanium"] = {57, 61, 112},
	["magnesium"] = {92, 114, 208},
	["aluminium"] = {170, 170, 170},
	["lead"] = {118, 136, 143},
	["silver"] = {192, 192, 192},
	["gold"] = {212, 175, 55},
	
	["nickel"] = {114, 116, 114},
	["cobalt"] = {0, 71, 171},
	["chromium"] = {198, 200, 201},
	["zinc"] = {145, 136, 139},
	["tungsten"] = {120, 124, 133},
}

Dy_Metals = {
	["iron"] = {Ore_1 = "tool", Ore_2 = "item", Ingot = "tool", Plate = "item", Tier = 1},
	["copper"] = {Ore_1 = "tool", Ore_2 = "item", Ingot = "tool", Plate = "item", Tier = 1},
	["tin"] = {Ore_1 = "tool", Ore_2 = "item", Ingot = "tool", Plate = "item", Tier = 2},
	["titanium"] = {Ore_1 = "item", Ore_2 = "item", Ingot = "item", Plate = "item", Tier = 3},
	["magnesium"] = {Ore_1 = "item", Ore_2 = "item", Ingot = "item", Plate = "item", Tier = 2},
	["aluminium"] = {Ore_1 = "item", Ore_2 = "item", Ingot = "item", Plate = "item", Tier = 1},
	["lead"] = {Ore_1 = "item", Ore_2 = "item", Ingot = "item", Plate = "item", Tier = 3},
	["silver"] = {Ore_1 = "item", Ore_2 = "item", Ingot = "item", Plate = "item", Tier = 2},
	["gold"] = {Ore_1 = "item", Ore_2 = "item", Ingot = "item", Plate = "item", Tier = 2},
	["nickel"] = {Ore_1 = "item", Ore_2 = "item", Ingot = "item", Plate = "item", Tier = 1},
	["zinc"] = {Ore_1 = "item", Ore_2 = "item", Ingot = "item", Plate = "item", Tier = 1},
	["cobalt"] = {Ore_1 = "item", Ore_2 = "item", Ingot = "item", Plate = "item", Tier = 2},
	["chromium"] = {Ore_1 = "item", Ore_2 = "item", Ingot = "item", Plate = "item", Tier = 3},
	["tungsten"] = {Ore_1 = "item", Ore_2 = "item", Ingot = "item", Plate = "item", Tier = 3},
}

Dy_Alloys = {
	["purple-gold"] = {Ingre_1 = "gold", Rat_1 = 0.8, Ingre_2 = "aluminium", Rat_2 = 0.2, Tier = 1},
	["magnox"] = {Ingre_1 = "aluminium", Rat_1 = 0.8, Ingre_2 = "magnesium", Rat_2 = 0.2, Tier = 1},
	["duralumin"] = {Ingre_1 = "aluminium", Rat_1 = 0.8, Ingre_2 = "copper", Rat_2 = 0.2, Tier = 1},
	["solder"] = {Ingre_1 = "lead", Rat_1 = 0.9, Ingre_2 = "tin", Rat_2 = 0.1, Tier = 1},
	["leaded-copper"] = {Ingre_1 = "copper", Rat_1 = 0.9, Ingre_2 = "lead", Rat_2 = 0.1, Tier = 1},
	["silver-solder"] = {Ingre_1 = "solder", Rat_1 = 0.75, Ingre_2 = "silver", Rat_2 = 0.25, Tier = 2},
	["copper-solder"] = {Ingre_1 = "solder", Rat_1 = 0.75, Ingre_2 = "copper", Rat_2 = 0.25, Tier = 2},
	["electrum"] = {Ingre_1 = "gold", Rat_1 = 0.55, Ingre_2 = "silver", Rat_2 = 0.45, Tier = 2},
}

Dy_Focals = {
	["lense-1"] = {
		Tier = 1, 
		Mod = 1,
	},
	["lense-2"] = {
		Tier = 2, 
		Mod = 1.5,
	},
	["lense-3"] = {
		Tier = 3, 
		Mod = 2.75,
	},
	["lense-4"] = {
		Tier = 4, 
		Mod = 5,
	},
	["lense-5"] = {
		Tier = 5, 
		Mod = 8,
	},
}

Dy_Ammo_Mods = {
	{Name = "bronze", Mod = 0.35, Tier = 1},
	{Name = "tin", Mod = 0.3, Tier = 1, Dmg_T = "acid", Dmg_A = 2.5},
	{Name = "copper", Mod = 0.75, Tier = 1},
	{Name = "iron", Mod = 1, Tier = 2, Dmg_T = "acid", Dmg_A = 5},
	{Name = "steel", Mod = 1.5, Tier = 2},
	{Name = "titanium", Mod = 1.75, Tier = 3},
	{Name = "aluminium", Mod = 1.25, Tier = 2},
	{Name = "lead", Mod = 0.25, Tier = 3, Dmg_T = "acid", Dmg_A = 15},
	{Name = "gold", Mod = 1.65, Tier = 3},
	{Name = "silver", Mod = 1.45, Tier = 3},
}

Dy_Exclude_Recipes = {
	["burner-turbine"] = 1, 
	["electric-motor"] = 1, 
	["motor"] = 1, 
	["satellite"] = 1, 
}

Dy_Exclude_Tech = { 
	-- AAI Signal ----
	["aai-signal-transmission"] = 1, 
	-- Jetpack ----
	["jetpack-1"] = 1, 
	["jetpack-2"] = 1, 
	["jetpack-3"] = 1, 
	["jetpack-4"] = 1, 
	-- Robot Attrition ----
	["robot-attrition-explosion-safety"] = 1,
	-- Shield Projector ---- 
	["shield-projector"] = 1, 
	-- Space Exploration ----
	["se-aeroframe-pole"] = 1, 
	["se-aeroframe-scaffold"] = 1, 
	["se-aeroframe-bulkhead"] = 1, 
	["se-antimatter-reactor"] = 1, 
	["se-core-miner"] = 1, 
	["se-cryogun"] = 1, 
	["se-meteor-point-defence"] = 1, 
	["se-meteor-defence"] = 1, 
	["se-deep-catalogue-1"] = 1, 
	["se-deep-catalogue-2"] = 1, 
	["se-deep-catalogue-3"] = 1, 
	["se-deep-catalogue-4"] = 1, 
	["se-fluid-burner-generator"] = 1, 
	["se-fuel-refining"] = 1, 
	["se-heat-shielding"] = 1, 
	["se-heavy-girder"] = 1, 
	["se-heavy-bearing"] = 1, 
	["se-heavy-composite"] = 1, 
	["se-heavy-assembly"] = 1, 
	["se-holmium-cable"] = 1, 
	["se-holmium-solenoid"] = 1, 
	["se-quantum-processor"] = 1,  ---???????????
	["se-dynamic-emitter"] = 1, 
	["se-lattice-pressure-vessel"] = 1, 
	["se-long-range-star-mapping"] = 1, 
	["se-dimensional-anchor"] = 1, 
	["se-medpack"] = 1,   ---???????????
	["se-medpack-2"] = 1,   ---???????????
	["se-medpack-3"] = 1,   ---???????????
	["se-medpack-4"] = 1,   ---???????????
	["se-naquium-cube"] = 1, 
	["se-naquium-tessaract"] = 1, 
	["se-naquium-processor"] = 1, 
	["se-plague"] = 1,   ---???????????
	["se-processing-beryllium"] = 1, 
	["se-processing-cryonite"] = 1, 
	["se-processing-holmium"] = 1, 
	["se-processing-iridium"] = 1, 
	["se-processing-naquium"] = 1, 
	["se-processing-vitamelange"] = 1, 
	["se-processing-vulcanite"] = 1, 
	["se-pulveriser"] = 1,   ---???????????
	["se-addon-power-pole"] = 1,   ---???????????
	["se-pylon"] = 1,   ---???????????
	["se-pylon-substation"] = 1,   ---???????????
	["se-pylon-construction-radar"] = 1,   ---???????????
	["se-railgun"] = 1,   ---???????????
	["se-rocket-fuel-from-water"] = 1, 
	["se-rocket-landing-pad"] = 1, 
	["se-rocket-launch-pad"] = 1, 
	["se-rocket-cargo-safety-1"] = 1, 
	["se-rocket-cargo-safety-2"] = 1, 
	["se-rocket-cargo-safety-3"] = 1, 
	["se-rocket-reusability-1"] = 1, 
	["se-rocket-reusability-2"] = 1, 
	["se-rocket-reusability-3"] = 1, 
	["se-rocket-survivability-1"] = 1, 
	["se-rocket-survivability-2"] = 1, 
	["se-rocket-survivability-3"] = 1, 
	["se-rtg-equipment"] = 1, 
	["se-rtg-equipment-2"] = 1, 
	["se-space-accumulator"] = 1, 
	["se-space-accumulator-2"] = 1, 
	["se-space-astrometrics-laboratory"] = 1,    ---???????????
	["se-space-assembling"] = 1, 
	["se-condenser-turbine"] = 1, 
	["se-space-biochemical-laboratory"] = 1,    ---???????????
	["se-space-catalogue-astronomic-1"] = 1,    ---???????????
	["se-space-catalogue-astronomic-2"] = 1,    ---???????????
	["se-space-catalogue-astronomic-3"] = 1,    ---???????????
	["se-space-catalogue-astronomic-4"] = 1,    ---???????????
	["se-space-catalogue-biological-1"] = 1,    ---???????????
	["se-space-catalogue-biological-2"] = 1,    ---???????????
	["se-space-catalogue-biological-3"] = 1,    ---???????????
	["se-space-catalogue-biological-4"] = 1,    ---???????????
	["se-space-catalogue-material-1"] = 1,    ---???????????
	["se-space-catalogue-material-2"] = 1,    ---???????????
	["se-space-catalogue-material-3"] = 1,    ---???????????
	["se-space-catalogue-material-4"] = 1,    ---???????????
	["se-space-catalogue-energy-1"] = 1,    ---???????????
	["se-space-catalogue-energy-2"] = 1,    ---???????????
	["se-space-catalogue-energy-3"] = 1,    ---???????????
	["se-space-catalogue-energy-4"] = 1,    ---???????????
	["se-space-data-card"] = 1, 
	["se-space-decontamination-facility"] = 1,    ---???????????
	["se-space-electromagnetics-laboratory"] = 1,    ---???????????
	["se-space-genetics-laboratory"] = 1,    ---???????????
	["se-space-gravimetrics-laboratory"] = 1,    ---???????????
	["se-space-growth-facility"] = 1, 
	["se-space-hypercooling-1"] = 1, 
	["se-space-hypercooling-2"] = 1, 
	["se-space-hypercooling-3"] = 1, 
	["se-space-laser-laboratory"] = 1, 
	["se-lifesupport-facility"] = 1, 
	["se-space-manufactory"] = 1, 
	["se-space-material-fabricator"] = 1, 
	["se-space-matter-fusion"] = 1, 
	["se-nanomaterial"] = 1, 
	["se-space-mechanical-laboratory"] = 1, 
	["se-space-rail"] = 1, 
	["se-space-telescope"] = 1, 
	["se-space-telescope-xray"] = 1, 
	["se-space-telescope-microwave"] = 1, 
	["se-space-telescope-gammaray"] = 1, 
	["se-space-telescope-radio"] = 1, 
	["se-space-particle-accelerator"] = 1, 
	["se-space-particle-collider"] = 1, 
	["se-antimatter-production"] = 1, 
	["se-antimatter-engine"] = 1, 
	["se-teleportation"] = 1, 
	["se-space-plasma-generator"] = 1, 
	["se-space-platform-plating"] = 1, 
	["se-space-platform-scaffold"] = 1, 
	["se-space-radiation-laboratory"] = 1, 
	["se-space-radiator-1"] = 1, 
	["se-space-radiator-2"] = 1, 
	["se-space-radiating-efficiency"] = 1, 
	["se-space-radiating-speed"] = 1, 
	["se-recycling-facility"] = 1, 
	["se-space-science-lab"] = 1, 
	["se-space-simulation-ab"] = 1, 
	["se-space-simulation-as"] = 1, 
	["se-space-simulation-am"] = 1, 
	["se-space-simulation-bm"] = 1, 
	["se-space-simulation-sb"] = 1, 
	["se-space-simulation-sm"] = 1, 
	["se-space-simulation-abm"] = 1, 
	["se-space-simulation-asb"] = 1, 
	["se-space-simulation-asm"] = 1,  
	["se-space-simulation-sbm"] = 1,  
	["se-space-simulation-asbm"] = 1,  
	["se-space-solar-panel"] = 1, 
	["se-space-solar-panel-2"] = 1, 
	["se-space-solar-panel-3"] = 1, 
	["se-space-supercomputer-1"] = 1, 
	["se-space-supercomputer-2"] = 1, 
	["se-space-supercomputer-3"] = 1, 
	["se-space-supercomputer-4"] = 1, 
	["se-space-thermodynamics-laboratory"] = 1, 
	["se-spaceship"] = 1, 
	["se-spaceship-integrity-1"] = 1, 
	["se-spaceship-integrity-2"] = 1, 
	["se-spaceship-integrity-3"] = 1, 
	["se-spaceship-integrity-4"] = 1, 
	["se-spaceship-integrity-5"] = 1, 
	["se-spaceship-integrity-6"] = 1, 
	["se-spaceship-integrity-7"] = 1, 
	["se-factory-spaceship-1"] = 1, 
	["se-factory-spaceship-2"] = 1, 
	["se-factory-spaceship-3"] = 1, 
	["se-factory-spaceship-4"] = 1, 
	["se-factory-spaceship-5"] = 1, 
	["se-spaceship-victory"] = 1, 
	["se-superconductive-cable"] = 1, 
	["se-tesla-gun"] = 1, 
	["se-thruster-suit"] = 1, 
	["se-thruster-suit-2"] = 1, 
	["se-thruster-suit-3"] = 1, 
	["se-thruster-suit-4"] = 1, 
	["se-vitalic-acid"] = 1, 
	["se-bioscrubber"] = 1, 
	["se-vitalic-reagent"] = 1, 
	["se-vitalic-epoxy"] = 1, 
	["se-self-sealing-gel"] = 1, 
	["se-supercharger"] = 1, 
	["se-wide-beacon"] = 1, 
	["se-wide-beacon-2"] = 1, 
	["se-zone-discovery-random"] = 1, 
	["se-zone-discovery-targeted"] = 1, 
	["se-zone-discovery-deep"] = 1, 
	["se-rocket-science-pack"] = 1,
	["se-astronomic-science-pack-1"] = 1,
	["se-astronomic-science-pack-2"] = 1,
	["se-astronomic-science-pack-3"] = 1,
	["se-astronomic-science-pack-4"] = 1,
	["se-biological-science-pack-1"] = 1,
	["se-biological-science-pack-2"] = 1,
	["se-biological-science-pack-3"] = 1,
	["se-biological-science-pack-4"] = 1,
	["se-energy-science-pack-1"] = 1,
	["se-energy-science-pack-2"] = 1,
	["se-energy-science-pack-3"] = 1,
	["se-energy-science-pack-4"] = 1,
	["se-material-science-pack-1"] = 1,
	["se-material-science-pack-2"] = 1,
	["se-material-science-pack-3"] = 1,
	["se-material-science-pack-4"] = 1,
	["se-deep-space-science-pack-1"] = 1,
	["se-deep-space-science-pack-2"] = 1,
	["se-deep-space-science-pack-3"] = 1,
	["se-deep-space-science-pack-4"] = 1,
}