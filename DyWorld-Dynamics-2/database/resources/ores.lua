

DyWorld_2_Ore_Table_Main = {
    ["hematite"] = { -- Iron Main --
        chem = "Fe2-O3",
        ore = "iron-ore",
        ratio_ore = 1,
        ratio_main = 3,
    },
    ["chalcopyrite"] = { -- Copper Main --
        chem = "Cu-Fe-S2",
        ore = "copper-ore",
        ratio_ore = 1,
        ratio_main = 2,
    },
    ["bauxite"] = { -- Aluminium Main --
        chem = "Al2-O3-H2-0",
        ore = "aluminium-ore",
        ratio_ore = 1,
        ratio_main = 4,
    },
    ["sphalerite"] = { -- Zinc Main --
        chem = "Zn-S",
        ore = "zinc-ore",
        ratio_ore = 1,
        ratio_main = 2,
    },
    ["galena"] = { -- Lead Main --
        chem = "Pb-S",
        ore = "lead-ore",
        ratio_ore = 1,
        ratio_main = 3,
    },
    ["tin-pyrite"] = { -- Tin Main --
        chem = "Cu2-Fe-Sn-S4",
        ore = "tin-ore",
        ratio_ore = 1,
        ratio_main = 2,
    },
    ["argentite"] = { -- Silver Main --
        chem = "Ag2-S",
        ore = "silver-ore",
        ratio_ore = 1,
        ratio_main = 6,
    },
    ["calaverite"] = { -- Gold Main --
        chem = "Au-Te2",
        ore = "gold-ore",
        ratio_ore = 1,
        ratio_main = 6,
    },
    ["rock-salt"] = { -- Sodium Main --
        chem = "Na-Cl",
        --ore = "s-ore",
        --ratio_ore = 3,
    },
    ["carnalite"] = { -- Potassium Main --
        chem = "KCI-Mg-CI-H2-0",
        --ore = "iron-ore",
        --ratio_ore = 3,
    },
    ["cinnabar"] = { -- Mercury Main --
        chem = "Hg-S",
        --ore = "iron-ore",
        --ratio_ore = 3,
    },
    ["dolomite"] = { -- Magnesium Main --
        chem = "Ca-Mg-C-O3",
        ore = "magnesium-ore",
        ratio_ore = 1,
        ratio_main = 4,
    },
    ["limestone"] = { -- Calcium Main --
        chem = "Ca-C-O3",
        --ore = "iron-ore",
        --ratio_ore = 3,
    },
    ["phosphorite"] = { -- Phosphorous Main --
        chem = "Ca5-P-O4-F",
        --ore = "iron-ore",
        --ratio_ore = 3,
    },
    ["pyrolusite"] = { -- Manganese Main --
        chem = "Mn-O2",
        ore = "manganese-ore",
        ratio_ore = 1,
        ratio_main = 7,
    },
    ["carbon"] = { -- Coal Main --
        chem = "C-O2",
        ore = "coal",
        ratio_ore = 3,
        ratio_main = 1,
    },
}

DyWorld_2_Ore_Table = {
    ["stone"] = {
        properties = {chunk = false, ore = false, clean = false, plate = false, fuel = false, stone = true, special = true},
        mine = {main = "limestone", min = 1, max = 5, prob = 0.98},
        loot = {enabled = false, type = "enemy", min = 1, max = 2, prob = 0.1}
    },
    ["coal"] = {
        properties = {chunk = false, ore = false, clean = false, plate = false, fuel = true, stone = false, special = true},
        mine = {main = "carbon", min = 1, max = 5, prob = 0.98},
        loot = {enabled = false, type = "enemy", min = 1, max = 2, prob = 0.1}
    },
    ["iron"] = {
        properties = {chunk = true, ore = true, clean = true, plate = true, fuel = false, stone = false, special = true},
        mine = {main = "hematite", min = 1, max = 5, prob = 0.98},
        loot = {enabled = false, type = "enemy", min = 1, max = 2, prob = 0.1}
    },
    ["copper"] = {
        properties = {chunk = true, ore = true, clean = true, plate = true, fuel = false, stone = false, special = true},
        mine = {main = "chalcopyrite", min = 1, max = 5, prob = 0.98},
        loot = {enabled = false, type = "enemy", min = 1, max = 2, prob = 0.1}
    },
    ["aluminium"] = {
        properties = {chunk = true, ore = true, clean = true, plate = true, fuel = false, stone = false, special = false},
        mine = {main = "bauxite", min = 1, max = 5, prob = 0.98},
        loot = {enabled = false, type = "enemy", min = 1, max = 2, prob = 0.1}
    },
    ["zinc"] = {
        properties = {chunk = true, ore = true, clean = true, plate = true, fuel = false, stone = false, special = false},
        mine = {main = "sphalerite", min = 1, max = 5, prob = 0.98},
        loot = {enabled = false, type = "enemy", min = 1, max = 2, prob = 0.1}
    },
    ["lead"] = {
        properties = {chunk = true, ore = true, clean = true, plate = true, fuel = false, stone = false, special = false},
        mine = {main = "galena", min = 1, max = 5, prob = 0.98},
        loot = {enabled = false, type = "enemy", min = 1, max = 2, prob = 0.1}
    },
    ["tin"] = {
        properties = {chunk = true, ore = true, clean = true, plate = true, fuel = false, stone = false, special = false},
        mine = {main = "tin-pyrite", min = 1, max = 5, prob = 0.98},
        loot = {enabled = false, type = "enemy", min = 1, max = 2, prob = 0.1}
    },
    ["silver"] = {
        properties = {chunk = true, ore = true, clean = true, plate = true, fuel = false, stone = false, special = false},
        mine = {main = "argentite", min = 1, max = 5, prob = 0.98},
        loot = {enabled = false, type = "enemy", min = 1, max = 2, prob = 0.1}
    },
    ["gold"] = {
        properties = {chunk = true, ore = true, clean = true, plate = true, fuel = false, stone = false, special = false},
        mine = {main = "calaverite", min = 1, max = 5, prob = 0.98},
        loot = {enabled = false, type = "enemy", min = 1, max = 2, prob = 0.1}
    },
    ["sodium"] = {
        properties = {chunk = false, ore = false, clean = false, plate = false, fuel = false, stone = true, special = false},
        mine = {main = "rock-salt", min = 1, max = 5, prob = 0.98},
        loot = {enabled = false, type = "enemy", min = 1, max = 2, prob = 0.1}
    },
    ["potassium"] = {
        properties = {chunk = false, ore = false, clean = false, plate = false, fuel = false, stone = true, special = false},
        mine = {main = "carnalite", min = 1, max = 5, prob = 0.98},
        loot = {enabled = false, type = "enemy", min = 1, max = 2, prob = 0.1}
    },
    ["mercury"] = {
        properties = {chunk = false, ore = false, clean = false, plate = false, fuel = false, stone = true, special = false},
        mine = {main = "cinnabar", min = 1, max = 5, prob = 0.98},
        loot = {enabled = false, type = "enemy", min = 1, max = 2, prob = 0.1}
    },
    ["magnesium"] = {
        properties = {chunk = false, ore = false, clean = false, plate = false, fuel = false, stone = true, special = false},
        mine = {main = "dolomite", min = 1, max = 5, prob = 0.98},
        loot = {enabled = false, type = "enemy", min = 1, max = 2, prob = 0.1}
    },
    ["phosphorous"] = {
        properties = {chunk = false, ore = false, clean = false, plate = false, fuel = false, stone = true, special = false},
        mine = {main = "phosphorite", min = 1, max = 5, prob = 0.98},
        loot = {enabled = false, type = "enemy", min = 1, max = 2, prob = 0.1}
    },
    ["manganese"] = {
        properties = {chunk = true, ore = true, clean = true, plate = true, fuel = false, stone = false, special = false},
        mine = {main = "pyrolusite", min = 1, max = 5, prob = 0.98},
        loot = {enabled = false, type = "enemy", min = 1, max = 2, prob = 0.1}
    },
}