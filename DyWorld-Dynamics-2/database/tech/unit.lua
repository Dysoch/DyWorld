local red = "automation-science-pack"
local green = "logistic-science-pack"
local black = "chemical-science-pack"
local grey = "military-science-pack"
local purple = "production-science-pack"
local yellow = "utility-science-pack"
local white = "space-science-pack"

DyWorld_2_Tech_Unit = {
    --[""] = {},

    -- Start of the game --
    ["combat"] = {
        table = {{red, 100},},
        time = 50,
        amount = 1,
    },
    ["metallurgy"] = {
        table = {{red, 100},},
        time = 50,
        amount = 1,
    },
    ["biological"] = {
        table = {{red, 100},},
        time = 50,
        amount = 1,
    },
    ["production-1"] = {
        table = {{red, 100},},
        time = 50,
        amount = 1,
    },
    ["infrastructure"] = {
        table = {{red, 100},},
        time = 50,
        amount = 1,
    },
    ["automation"] = {
        table = {{red, 100},},
        time = 50,
        amount = 1,
    },
    -- Metallurgy --
    --- Ore Processing ---
    ["ore-processing-1"] = {
        table = {{red, 100},},
        time = 50,
        amount = 1,
    },
    ["ore-processing-2"] = {
        table = {{red, 150},{purple, 150},},
        time = 100,
        amount = 2,
    },
    ["ore-processing-3"] = {
        table = {{red, 200},{purple, 200},},
        time = 200,
        amount = 3,
    },
    ["ore-processing-4"] = {
        table = {{red, 300},{purple, 300},{yellow, 300},},
        time = 400,
        amount = 4,
    },
    ["ore-processing-5"] = {
        table = {{red, 500},{purple, 500},{yellow, 500},{white, 500},},
        time = 800,
        amount = 5,
    },
    --- Metal Processing ---
    ["metal-processing-1"] = {
        table = {{red, 150},},
        time = 150,
        amount = 1,
    },
    ["metal-processing-2"] = {
        table = {{red, 300},{purple, 300},},
        time = 200,
        amount = 2,
    },
    ["metal-processing-3"] = {
        table = {{red, 500},{purple, 500},},
        time = 350,
        amount = 3,
    },
    ["metal-processing-4"] = {
        table = {{red, 750},{purple, 750},{yellow, 750},},
        time = 750,
        amount = 4,
    },
    ["metal-processing-5"] = {
        table = {{red, 1250},{purple, 1250},{yellow, 1250},{white, 1250},},
        time = 1200,
        amount = 5,
    },
    --- Alloying ---
    ["alloying-1"] = {
        table = {{red, 200},},
        time = 250,
        amount = 1,
    },
    ["alloying-2"] = {
        table = {{red, 400},{purple, 400},},
        time = 400,
        amount = 2,
    },
    ["alloying-3"] = {
        table = {{red, 750},{purple, 750},},
        time = 750,
        amount = 3,
    },
    ["alloying-4"] = {
        table = {{red, 1250},{purple, 1250},{yellow, 1250},},
        time = 1250,
        amount = 4,
    },
    ["alloying-5"] = {
        table = {{red, 2000},{purple, 2000},{yellow, 2000},{white, 2000},},
        time = 1800,
        amount = 5,
    },
    --- Main Ore Processing ---
    ["carbon-processing-1"] = {
        table = {{red, 200},},
        time = 250,
        amount = 1,
    },
    ["carbon-processing-2"] = {
        table = {{red, 400},{purple, 400},},
        time = 400,
        amount = 2,
    },
    ["carbon-processing-3"] = {
        table = {{red, 750},{purple, 750},},
        time = 750,
        amount = 3,
    },
    ["carbon-processing-4"] = {
        table = {{red, 1250},{purple, 1250},{yellow, 1250},},
        time = 1250,
        amount = 4,
    },
    ["carbon-processing-5"] = {
        table = {{red, 2000},{purple, 2000},{yellow, 2000},{white, 2000},},
        time = 1800,
        amount = 5,
    },
    ["hematite-processing-1"] = {
        table = {{red, 200},},
        time = 250,
        amount = 1,
    },
    ["hematite-processing-2"] = {
        table = {{red, 400},{purple, 400},},
        time = 400,
        amount = 2,
    },
    ["hematite-processing-3"] = {
        table = {{red, 750},{purple, 750},},
        time = 750,
        amount = 3,
    },
    ["hematite-processing-4"] = {
        table = {{red, 1250},{purple, 1250},{yellow, 1250},},
        time = 1250,
        amount = 4,
    },
    ["hematite-processing-5"] = {
        table = {{red, 2000},{purple, 2000},{yellow, 2000},{white, 2000},},
        time = 1800,
        amount = 5,
    },
    ["chalcopyrite-processing-1"] = {
        table = {{red, 200},},
        time = 250,
        amount = 1,
    },
    ["chalcopyrite-processing-2"] = {
        table = {{red, 400},{purple, 400},},
        time = 400,
        amount = 2,
    },
    ["chalcopyrite-processing-3"] = {
        table = {{red, 750},{purple, 750},},
        time = 750,
        amount = 3,
    },
    ["chalcopyrite-processing-4"] = {
        table = {{red, 1250},{purple, 1250},{yellow, 1250},},
        time = 1250,
        amount = 4,
    },
    ["chalcopyrite-processing-5"] = {
        table = {{red, 2000},{purple, 2000},{yellow, 2000},{white, 2000},},
        time = 1800,
        amount = 5,
    },
    --[[
    --- Secondary Ore Processing ---
    ["iron-processing-1"] = {a27},
    ["iron-processing-2"] = {a24, "ore-processing-2"},
    ["iron-processing-3"] = {a41, "ore-processing-3"},
    ["iron-processing-4"] = {a47, "ore-processing-5"},
    ["copper-processing-1"] = {a29},
    ["copper-processing-2"] = {a25, "ore-processing-2"},
    ["copper-processing-3"] = {a42, "ore-processing-3"},
    ["copper-processing-4"] = {"ore-processing-5", a48},
    ["tin-processing-1"] = {"ore-processing-1"},
    ["tin-processing-2"] = {a26, "ore-processing-2"},
    ["tin-processing-3"] = {a43, "ore-processing-3"},
    ["tin-processing-4"] = {a49, "ore-processing-5"},
    ["zinc-processing-1"] = {"ore-processing-1"},
    ["lead-processing-1"] = {"ore-processing-1"},
    ["silver-processing-1"] = {"ore-processing-3"},
    ["silver-processing-2"] = {a69, "ore-processing-4"},
    ["silver-processing-3"] = {a72, "ore-processing-5"},
    ["gold-processing-1"] = {"ore-processing-3"},
    ["gold-processing-2"] = {a68, "ore-processing-4"},
    ["gold-processing-3"] = {a71, "ore-processing-5"},
    ["aluminium-processing-1"] = {"ore-processing-1"},
    ["titanium-processing-1"] = {"ore-processing-3"},
    ["titanium-processing-2"] = {a67, "ore-processing-4"},
    ["titanium-processing-3"] = {a70, "ore-processing-5"},
    ["tungsten-processing-1"] = {"ore-processing-4"},
    ["tungsten-processing-2"] = {"ore-processing-5", a76},
    --- Alloys ---
    ["bronze-alloying-1"] = {"alloying-1"},
    ["bronze-alloying-2"] = {"alloying-2", a30},
    ["bronze-alloying-3"] = {a33, "alloying-3"},
    ["steel-processing"] = {"metal-processing-1"},
    ["steel-processing-2"] = {a62, "metal-processing-2"},
    ["steel-alloying-1"] = {"alloying-1"},
    ["steel-alloying-2"] = {"alloying-2", a32},
    ["steel-alloying-3"] = {"alloying-3", a35},
    ["brass-alloying-1"] = {"alloying-1"},
    ["brass-alloying-2"] = {"alloying-2", a31},
    ["brass-alloying-3"] = {a34, "alloying-3"},
    ["brass/bronze-processing-1"] = {"metal-processing-1"},
    ["brass/bronze-processing-2"] = {a63, "metal-processing-2"},
    ["stainless-steel-alloying-1"] = {a35},
    ["stainless-steel-alloying-2"] = {a38, a39},
    ["stainless-steel-processing-1"] = {a64},

    -- Combat/Warfare/Military --
    ["military"] = {"combat"},
    ["military-2"] = {a82},
    ["military-3"] = {a83},
    ["military-4"] = {a84},
    ["military-5"] = {a85, a9},
    ["equipment"] = {"combat"},
    ["support"] = {a78},
    ["defence"] = {a78},
    ["attack"] = {a78},
    --- Armor ---
    ["heavy-armor"] = {a137, a78},
    ["modular-armor"] = {a117, a83},
    ["power-armor"] = {a126, a84},
    ["power-armor-mk2"] = {a121, a86},
    --- Equipment ---
    ["energy-shield-equipment"] = {a70, a71, a163, a80},
    ["night-vision-equipment"] = {a69, a163},
    ["belt-immunity-equipment"] = {a160, a41, a79},
    ["solar-panel-equipment"] = {a132, a26, a79},
    ["personal-laser-defense-equipment"] = {a157, a164, a81},
    ["energy-shield-mk2-equipment"] = {a157, a164, a165},
    ["battery-equipment"] = {a69, a160},
    ["battery-mk2-equipment"] = {a163},
    ["fusion-reactor-equipment"] = {a107, a160, a76},
    ["exoskeleton-equipment"] = {a159, a67},
    ["personal-roboport-equipment"] = {a151, a152, a163, a79},
    ["personal-roboport-mk2-equipment"] = {a150, a167},

    -- Logistic --
    ["logistics"] = {"infrastructure"},
    ["logistics-2"] = {a87},
    ["logistics-3"] = {a90},
    ["logistics-4"] = {a93},
    ["logistics-5"] = {a9, a96},
    ["transportation-1"] = {"infrastructure"},
    ["transportation-2"] = {a89},
    ["transportation-3"] = {a92},
    ["transportation-4"] = {a95},
    ["transportation-5"] = {a98},

    -- Power --
    ["power-1"] = {"infrastructure", a8},
    ["power-2"] = {a88},
    ["power-3"] = {a91},
    ["power-4"] = {a94},
    ["power-5"] = {a9, a97},
    ["solar-energy"] = {a128, a145},
    ["electric-energy-accumulators"] = {a91},
    ["electric-energy-distribution-1"] = {a88},
    ["electric-energy-distribution-2"] = {a138, a91},

    -- Automation --
    ["automation-2"] = {a8},
    ["automation-3"] = {a102},
    ["automation-4"] = {a103},
    ["automation-5"] = {a104, a9},
    ["production-2"] = {"production-1"},
    ["production-3"] = {a153},
    ["production-4"] = {a154},
    ["production-5"] = {a155, a9},
    ["advanced-material-processing"] = {a153},
    ["advanced-material-processing-2"] = {a154},
    --- Oil ---
    ["fluid-handling"] = {a170},
    ["oil-processing"] = {a153},
    ["advanced-oil-processing"] = {a170},
    ["coal-liquefaction"] = {a170, a173, a51},
    ["lubricant"] = {a153},
    ["sulfur-processing"] = {a170, a45},
    ["plastics"] = {a173},
    --- Nuclear ---
    ["uranium-processing"] = {"ore-processing-2", a94},
    ["nuclear-power"] = {a106},
    ["kovarex-enrichment-process"] = {a106},
    ["nuclear-fuel-reprocessing"] = {a107, a108},

    -- Modules --
    ["modules"] = {a149},
    ["speed-module"] = {a153, "modules"},
    ["speed-module-2"] = {a69, a154, "speed-module"},
    ["speed-module-3"] = {a70, a155, "speed-module-2"},
    ["speed-module-4"] = {a76, a156, "speed-module-3"},
    ["speed-module-5"] = {a74, a77, "metal-processing-5", "speed-module-4"},
    ["productivity-module"] = {a153, "modules"},
    ["productivity-module-2"] = {a69, a154, "productivity-module"},
    ["productivity-module-3"] = {a70, a155, "productivity-module-2"},
    ["productivity-module-4"] = {a76, a156, "productivity-module-3"},
    ["productivity-module-5"] = {a74, a77, "metal-processing-5", "productivity-module-4"},
    ["effectivity-module"] = {a153, "modules"},
    ["effectivity-module-2"] = {a69, a154, "effectivity-module"},
    ["effectivity-module-3"] = {a70, a155, "effectivity-module-2"},
    ["effectivity-module-4"] = {a76, a156, "effectivity-module-3"},
    ["effectivity-module-5"] = {a74, a77, "metal-processing-5", "effectivity-module-4"},

    -- Space Technologies --
    ["low-density-structure"] = {a155},
    ["rocket-control-unit"] = {a123, a154},
    ["rocketry"] = {a122, a127, a148},
    ["rocket-silo"] = {a134, a141, a144},
    ["space-technology"] = {a67, a94, a90, a103, a154, a143},

    -- Intermediates --
    ["electronics"] = {"production-1"},
    ["battery"] = {a154},
    ["engine"] = {a153},
    ["electric-engine"] = {a139, a154, a174},
    ["advanced-electronics"] = {a115, a153},
    ["advanced-electronics-2"] = {a145, a154},


    -- Unsorted --
    ["stack-inserter"] = {a103, a135},
    ["automobilism"] = {a89, a90},
    ["gun-turret"] = {a82},
    ["concrete"] = {a87},
    ["gate"] = {a115, a119},
    ["rail-signals"] = {a131},
    ["stone-wall"] = {a82},
    ["tank"] = {a111, a84},
    ["fluid-wagon"] = {a136, a169},
    ["rocket-fuel"] = {a155, a51},
    ["steel-axe"] = {"production-1"},
    ["automated-rail-transport"] = {a136, a95},
    ["landfill"] = {a113},
    ["fast-inserter"] = {a8},
    ["railway"] = {a139, a92},
    ["optics"] = {"production-1", "infrastructure", a8},
    ["robotics"] = {a93, a95},
    ["laser"] = {a145},
    ["effect-transmission"] = {a138, a154, a94},
    ["logistic-system"] = {a151, a152},
    ["logistic-robots"] = {a124, a142},
    ["construction-robots"] = {a124, a142},
    ]]
}