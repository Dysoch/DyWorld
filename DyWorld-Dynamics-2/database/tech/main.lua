
-- TODO Finish technology a-number removal
local a8 = "automation"
local a9 = "space-technology"
local a24 = "iron-processing-1"
local a25 = "copper-processing-1"
local a26 = "tin-processing-1"
local a27 = "hematite-processing-1"
local a44 = "hematite-processing-2"
local a50 = "hematite-processing-3"
local a53 = "hematite-processing-4"
local a28 = "carbon-processing-1"
local a29 = "chalcopyrite-processing-1"
local a30 = "bronze-alloying-1"
local a31 = "brass-alloying-1"
local a32 = "steel-alloying-1"
local a33 = "bronze-alloying-2"
local a34 = "brass-alloying-2"
local a35 = "steel-alloying-2"
local a38 = "steel-alloying-3"
local a39 = "stainless-steel-alloying-1"
local a41 = "iron-processing-2"
local a42 = "copper-processing-2"
local a43 = "tin-processing-2"
local a45 = "carbon-processing-2"
local a46 = "chalcopyrite-processing-2"
local a47 = "iron-processing-3"
local a48 = "copper-processing-3"
local a49 = "tin-processing-3"
local a51 = "carbon-processing-3"
local a52 = "chalcopyrite-processing-3"
local a54 = "carbon-processing-4"
local a55 = "chalcopyrite-processing-4"
local a62 = "steel-processing"
local a63 = "brass/bronze-processing-1"
local a64 = "steel-processing-2"
local a67 = "titanium-processing-1"
local a68 = "gold-processing-1"
local a69 = "silver-processing-1"
local a70 = "titanium-processing-2"
local a71 = "gold-processing-2"
local a72 = "silver-processing-2"
local a74 = "gold-processing-3"
local a76 = "tungsten-processing-1"
local a77 = "tungsten-processing-2"
local a78 = "equipment"
local a79 = "support"
local a80 = "defence"
local a81 = "attack"
local a82 = "military"
local a83 = "military-2"
local a84 = "military-3"
local a85 = "military-4"
local a86 = "military-5"
local a87 = "logistics"
local a88 = "power-1"
local a89 = "transportation-1"
local a90 = "logistics-2"
local a91 = "power-2"
local a92 = "transportation-2"
local a93 = "logistics-3"
local a94 = "power-3"
local a95 = "transportation-3"
local a96 = "logistics-4"
local a97 = "power-4"
local a98 = "transportation-4"
local a102 = "automation-2"
local a103 = "automation-3"
local a104 = "automation-4"
local a106 = "uranium-processing"
local a107 = "nuclear-power"
local a108 = "kovarex-enrichment-process"
local a111 = "automobilism"
local a113 = "concrete"
local a115 = "electronics"
local a117 = "heavy-armor"
local a119 = "stone-wall"
local a121 = "power-armor"
local a122 = "low-density-structure"
local a123 = "advanced-material-processing-2"
local a124 = "battery"
local a126 = "modular-armor"
local a127 = "rocket-fuel"
local a128 = "electric-energy-accumulators"
local a131 = "automated-rail-transport"
local a132 = "solar-energy"
local a134 = "landfill"
local a135 = "fast-inserter"
local a136 = "railway"
local a137 = "optics"
local a138 = "electric-energy-distribution-1"
local a139 = "engine"
local a141 = "rocketry"
local a142 = "robotics"
local a143 = "rocket-silo"
local a144 = "lubricant"
local a145 = "advanced-electronics"
local a148 = "rocket-control-unit"
local a149 = "effect-transmission"
local a150 = "logistic-system"
local a151 = "logistic-robots"
local a152 = "construction-robots"
local a153 = "production-2"
local a154 = "production-3"
local a155 = "production-4"
local a156 = "production-5"
local a157 = "energy-shield-equipment"
local a159 = "belt-immunity-equipment"
local a160 = "solar-panel-equipment"
local a163 = "battery-equipment"
local a164 = "battery-mk2-equipment"
local a165 = "fusion-reactor-equipment"
local a167 = "personal-roboport-equipment"
local a169 = "fluid-handling"
local a170 = "oil-processing"
local a173 = "sulfur-processing"
local a174 = "plastics"

DyWorld_2_Main_Tech = {
    --[""] = {},

    -- Start of the game --
    ["combat"] = {},
    ["metallurgy"] = {},
    ["biological"] = {},
    ["production-1"] = {},
    ["infrastructure"] = {},
    ["automation"] = {},

    -- Metallurgy --
    --- Ore Processing ---
    ["ore-processing-1"] = {"metallurgy"},
    ["ore-processing-2"] = {"metal-processing-1"},
    ["ore-processing-3"] = {"metal-processing-2"},
    ["ore-processing-4"] = {"metal-processing-3"},
    ["ore-processing-5"] = {"metal-processing-4", a9},
    --- Metal Processing ---
    ["metal-processing-1"] = {"alloying-1"},
    ["metal-processing-2"] = {"alloying-2"},
    ["metal-processing-3"] = {"alloying-3"},
    ["metal-processing-4"] = {"alloying-4"},
    ["metal-processing-5"] = {"alloying-5"},
    --- Alloying ---
    ["alloying-1"] = {"ore-processing-1"},
    ["alloying-2"] = {"ore-processing-2"},
    ["alloying-3"] = {"ore-processing-3"},
    ["alloying-4"] = {"ore-processing-4"},
    ["alloying-5"] = {"ore-processing-5"},
    --- Main Ore Processing ---
    ["carbon-processing-1"] = {"ore-processing-1"},
    ["carbon-processing-2"] = {a28, "ore-processing-2"},
    ["carbon-processing-3"] = {a45, "ore-processing-3"},
    ["carbon-processing-4"] = {a51, "ore-processing-4"},
    ["carbon-processing-5"] = {a54, "ore-processing-5"},
    ["hematite-processing-1"] = {"ore-processing-1"},
    ["hematite-processing-2"] = {a27, "ore-processing-2"},
    ["hematite-processing-3"] = {a44, "ore-processing-3"},
    ["hematite-processing-4"] = {a50, "ore-processing-4"},
    ["hematite-processing-5"] = {a53, "ore-processing-5"},
    ["chalcopyrite-processing-1"] = {"ore-processing-1"},
    ["chalcopyrite-processing-2"] = {a29, "ore-processing-2"},
    ["chalcopyrite-processing-3"] = {a46, "ore-processing-3"},
    ["chalcopyrite-processing-4"] = {a52, "ore-processing-4"},
    ["chalcopyrite-processing-5"] = {a55, "ore-processing-5"},
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
    
}

-- TODO Add all technology icons
DyWorld_2_Main_Tech_Icons = {
    -- Stuff will be added automatically below here if it is not already present --
    --[""] = {},

    ["hematite-processing-1"] = {{{icon = Dy_icon_ore.."hematite.png"},{icon = Dy_looped.."1.png"}}, 64},
    ["hematite-processing-2"] = {{{icon = Dy_icon_ore.."hematite.png"},{icon = Dy_looped.."2.png"}}, 64},
    ["hematite-processing-3"] = {{{icon = Dy_icon_ore.."hematite.png"},{icon = Dy_looped.."3.png"}}, 64},
    ["hematite-processing-4"] = {{{icon = Dy_icon_ore.."hematite.png"},{icon = Dy_looped.."4.png"}}, 64},
    ["hematite-processing-5"] = {{{icon = Dy_icon_ore.."hematite.png"},{icon = Dy_looped.."5.png"}}, 64},
    ["chalcopyrite-processing-1"] = {{{icon = Dy_icon_ore.."chalcopyrite.png"},{icon = Dy_looped.."1.png"}}, 64},
    ["chalcopyrite-processing-2"] = {{{icon = Dy_icon_ore.."chalcopyrite.png"},{icon = Dy_looped.."2.png"}}, 64},
    ["chalcopyrite-processing-3"] = {{{icon = Dy_icon_ore.."chalcopyrite.png"},{icon = Dy_looped.."3.png"}}, 64},
    ["chalcopyrite-processing-4"] = {{{icon = Dy_icon_ore.."chalcopyrite.png"},{icon = Dy_looped.."4.png"}}, 64},
    ["chalcopyrite-processing-5"] = {{{icon = Dy_icon_ore.."chalcopyrite.png"},{icon = Dy_looped.."5.png"}}, 64},
    ["metallurgy"] = {{{icon = Dy_tech.."metallurgy.png"}}, 256},
    ["ore-processing-1"] = {{{icon = Dy_tech.."metallurgy.png"}}, 256},
    ["ore-processing-2"] = {{{icon = Dy_tech.."metallurgy.png"}}, 256},
    ["ore-processing-3"] = {{{icon = Dy_tech.."metallurgy.png"}}, 256},
    ["ore-processing-4"] = {{{icon = Dy_tech.."metallurgy.png"}}, 256},
    ["ore-processing-5"] = {{{icon = Dy_tech.."metallurgy.png"}}, 256},
    ["metal-processing-1"] = {{{icon = Dy_tech.."slag.png"}}, 256},
    ["metal-processing-2"] = {{{icon = Dy_tech.."slag.png"}}, 256},
    ["metal-processing-3"] = {{{icon = Dy_tech.."slag.png"}}, 256},
    ["metal-processing-4"] = {{{icon = Dy_tech.."slag.png"}}, 256},
    ["metal-processing-5"] = {{{icon = Dy_tech.."slag.png"}}, 256},
    ["alloying-1"] = {{{icon = Dy_tech.."slag.png"}}, 256},
    ["alloying-2"] = {{{icon = Dy_tech.."slag.png"}}, 256},
    ["alloying-3"] = {{{icon = Dy_tech.."slag.png"}}, 256},
    ["alloying-4"] = {{{icon = Dy_tech.."slag.png"}}, 256},
    ["alloying-5"] = {{{icon = Dy_tech.."slag.png"}}, 256},
    ["iron-processing-1"] = {{{icon = Dy_tech.."iron.png"}}, 256},
    ["iron-processing-2"] = {{{icon = Dy_tech.."iron.png"}}, 256},
    ["iron-processing-3"] = {{{icon = Dy_tech.."iron.png"}}, 256},
    ["iron-processing-4"] = {{{icon = Dy_tech.."iron.png"}}, 256},
    ["copper-processing-1"] = {{{icon = Dy_tech.."copper.png"}}, 256},
    ["copper-processing-2"] = {{{icon = Dy_tech.."copper.png"}}, 256},
    ["copper-processing-3"] = {{{icon = Dy_tech.."copper.png"}}, 256},
    ["copper-processing-4"] = {{{icon = Dy_tech.."copper.png"}}, 256},
    ["tin-processing-1"] = {{{icon = Dy_tech.."tin.png"}}, 256},
    ["tin-processing-2"] = {{{icon = Dy_tech.."tin.png"}}, 256},
    ["tin-processing-3"] = {{{icon = Dy_tech.."tin.png"}}, 256},
    ["tin-processing-4"] = {{{icon = Dy_tech.."tin.png"}}, 256},
    ["silver-processing-1"] = {{{icon = Dy_tech.."silver.png"}}, 256},
    ["silver-processing-2"] = {{{icon = Dy_tech.."silver.png"}}, 256},
    ["silver-processing-3"] = {{{icon = Dy_tech.."silver.png"}}, 256},
    ["silver-processing-4"] = {{{icon = Dy_tech.."silver.png"}}, 256},
    ["titanium-processing-1"] = {{{icon = Dy_tech.."titanium.png"}}, 256},
    ["titanium-processing-2"] = {{{icon = Dy_tech.."titanium.png"}}, 256},
    ["titanium-processing-3"] = {{{icon = Dy_tech.."titanium.png"}}, 256},
    ["aluminium-processing-1"] = {{{icon = Dy_tech.."aluminium.png"}}, 256},

    
}

for k,v in pairs(DyWorld_2_Main_Tech) do
    if not DyWorld_2_Main_Tech_Icons[k] then
        DyWorld_2_Main_Tech_Icons[k] = {{{icon = "__DyCore__/graphics/questionmark.png"}}, 64}
    end
end