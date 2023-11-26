local t1a = "automation-science-pack"
local t1b = "advanced-automation-science-pack"
local t2a = "logistic-science-pack"
local t2b = "advanced-logistic-science-pack"
local t3a = "chemical-science-pack"
local t3b = "advanced-chemical-science-pack"
local t4a = "military-science-pack"
local t4b = "advanced-military-science-pack"
local t5a = "production-science-pack"
local t5b = "advanced-production-science-pack"
local t6a = "utility-science-pack"
local t6b = "advanced-utility-science-pack"
local t7a = "space-science-pack"
local t7b = "advanced-space-science-pack"

DyWorld_2_Tech_Unit = {
    --[""] = {},

    -- Start of the game --
    ["combat"] = {
        table = {{t1a, 100},},
        time = 50,
        amount = 1,
    },
    ["metallurgy"] = {
        table = {{t1a, 100},},
        time = 50,
        amount = 1,
    },
    ["biological"] = {
        table = {{t1a, 100},},
        time = 50,
        amount = 1,
    },
    ["production-1"] = {
        table = {{t1a, 100},},
        time = 50,
        amount = 1,
    },
    ["infrastructure"] = {
        table = {{t1a, 100},},
        time = 50,
        amount = 1,
    },
    ["automation"] = {
        table = {{t1a, 100},},
        time = 50,
        amount = 1,
    },
    -- Science Packs --
    ["logistic-science-pack"] = {
        table = {{t1a, 100},},
        time = 50,
        amount = 1,
    },
    ["chemical-science-pack"] = {
        table = {{t1a, 100},{t2a, 100},},
        time = 50,
        amount = 2,
    },
    ["military-science-pack"] = {
        table = {{t1a, 100},{t2a, 100},{t3a, 100},},
        time = 50,
        amount = 4,
    },
    ["production-science-pack"] = {
        table = {{t1a, 100},{t2a, 100},{t3a, 100},{t4a, 100},},
        time = 50,
        amount = 8,
    },
    ["utility-science-pack"] = {
        table = {{t1a, 100},{t2a, 100},{t3a, 100},{t4a, 100},{t5a, 100},},
        time = 50,
        amount = 16,
    },
    ["space-science-pack"] = {
        table = {{t1a, 100},{t2a, 100},{t3a, 100},{t4a, 100},{t5a, 100},{t6a, 100},},
        time = 50,
        amount = 32,
    },
    -- Metallurgy --
    --- Ore Processing ---
    ["ore-processing-1"] = {
        table = {{t1a, 100},},
        time = 50,
        amount = 1,
    },
    ["ore-processing-2"] = {
        table = {{t1a, 150},{t2a, 150},{t3a, 200},},
        time = 100,
        amount = 2,
    },
    ["ore-processing-3"] = {
        table = {{t1a, 200},{t2a, 200},{t3a, 200},{t4a, 200},{t5a, 200},{t6a, 200},},
        time = 200,
        amount = 3,
    },
    ["ore-processing-4"] = {
        table = {{t1b, 300},{t2b, 300},{t3b, 300},},
        time = 400,
        amount = 4,
    },
    ["ore-processing-5"] = {
        table = {{t1b, 300},{t2b, 300},{t3b, 300},{t4b, 300},{t5b, 300},{t6b, 300},},
        time = 800,
        amount = 5,
    },
    --- Metal Processing ---
    ["metal-processing-1"] = {
        table = {{t1a, 150},},
        time = 150,
        amount = 1,
    },
    ["metal-processing-2"] = {
        table = {{t1a, 300},{t5a, 300},},
        time = 200,
        amount = 2,
    },
    ["metal-processing-3"] = {
        table = {{t1a, 500},{t5a, 500},},
        time = 350,
        amount = 3,
    },
    ["metal-processing-4"] = {
        table = {{t1a, 750},{t5a, 750},{t6a, 750},},
        time = 750,
        amount = 4,
    },
    ["metal-processing-5"] = {
        table = {{t1a, 1250},{t5a, 1250},{t6a, 1250},{t7a, 1250},},
        time = 1200,
        amount = 5,
    },
    --- Alloying ---
    ["alloying-1"] = {
        table = {{t1a, 200},},
        time = 250,
        amount = 1,
    },
    ["alloying-2"] = {
        table = {{t1a, 400},{t5a, 400},},
        time = 400,
        amount = 2,
    },
    ["alloying-3"] = {
        table = {{t1a, 750},{t5a, 750},},
        time = 750,
        amount = 3,
    },
    ["alloying-4"] = {
        table = {{t1a, 1250},{t5a, 1250},{t6a, 1250},},
        time = 1250,
        amount = 4,
    },
    ["alloying-5"] = {
        table = {{t1a, 2000},{t5a, 2000},{t6a, 2000},{t7a, 2000},},
        time = 1800,
        amount = 5,
    },
    --- Main Ore Processing ---
    ["carbon-processing-1"] = {
        table = {{t1a, 200},},
        time = 250,
        amount = 1,
    },
    ["carbon-processing-2"] = {
        table = {{t1a, 400},{t5a, 400},},
        time = 400,
        amount = 2,
    },
    ["carbon-processing-3"] = {
        table = {{t1a, 750},{t5a, 750},},
        time = 750,
        amount = 3,
    },
    ["carbon-processing-4"] = {
        table = {{t1a, 1250},{t5a, 1250},{t6a, 1250},},
        time = 1250,
        amount = 4,
    },
    ["carbon-processing-5"] = {
        table = {{t1a, 2000},{t5a, 2000},{t6a, 2000},{t7a, 2000},},
        time = 1800,
        amount = 5,
    },
    ["hematite-processing-1"] = {
        table = {{t1a, 200},},
        time = 250,
        amount = 1,
    },
    ["hematite-processing-2"] = {
        table = {{t1a, 400},{t5a, 400},},
        time = 400,
        amount = 2,
    },
    ["hematite-processing-3"] = {
        table = {{t1a, 750},{t5a, 750},},
        time = 750,
        amount = 3,
    },
    ["hematite-processing-4"] = {
        table = {{t1a, 1250},{t5a, 1250},{t6a, 1250},},
        time = 1250,
        amount = 4,
    },
    ["hematite-processing-5"] = {
        table = {{t1a, 2000},{t5a, 2000},{t6a, 2000},{t7a, 2000},},
        time = 1800,
        amount = 5,
    },
    ["chalcopyrite-processing-1"] = {
        table = {{t1a, 200},},
        time = 250,
        amount = 1,
    },
    ["chalcopyrite-processing-2"] = {
        table = {{t1a, 400},{t5a, 400},},
        time = 400,
        amount = 2,
    },
    ["chalcopyrite-processing-3"] = {
        table = {{t1a, 750},{t5a, 750},},
        time = 750,
        amount = 3,
    },
    ["chalcopyrite-processing-4"] = {
        table = {{t1a, 1250},{t5a, 1250},{t6a, 1250},},
        time = 1250,
        amount = 4,
    },
    ["chalcopyrite-processing-5"] = {
        table = {{t1a, 2000},{t5a, 2000},{t6a, 2000},{t7a, 2000},},
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