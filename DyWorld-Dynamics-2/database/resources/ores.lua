

DyWorld_2_Ore_Table_Main = {
    ["hematite"] = "Fe2-O3", -- Iron Main --
    ["chalcopyrite"] = "Cu-Fe-S2", -- Copper Main --
    ["bauxite"] = "Al2-O3-H2-0", -- Aluminium Main --
    ["sphalerite"] = "Zn-S", -- Zinc Main --
    ["galena"] = "Pb-S", --Lead Main --
    ["tin-pyrite"] = "Cu2-Fe-Sn-S4", -- Tin Main --
    ["argentite"] = "Ag2-S", -- Silver Main --
    ["calaverite"] = "Au-Te2", -- Gold Main --
    ["rock-salt"] = "Na-Cl", -- Sodium Main --
    ["carnalite"] = "KCI-Mg-CI-H2-0", -- Potassium Main --
    ["cinnabar"] = "Hg-S", -- Mercury Main --
    ["dolomite"] = "Ca-Mg-C-O3", -- Magnesium Main --
    ["limestone"] = "Ca-C-O3", -- Calcium Main --
    ["phosphorite"] = "Ca5-P-O4-F", -- Phosphorous Main --
    ["pyrolusite"] = "Mn-O2", -- Manganese Main --
    ["carbon"] = "C-O2", -- Carbon Main --
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