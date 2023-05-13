


DyWorld_2_Metallurgy_Tech = {
    --[""] = {},

    -- Main Categories --
    ["ore-processing-1"] = {"metallurgy"},
    ["alloying-1"] = {"ore-processing-1"},
    ["metal-processing-1"] = {"alloying-1"},
    
    ["ore-processing-2"] = {"metal-processing-1"},
    ["alloying-2"] = {"ore-processing-1"},
    ["metal-processing-2"] = {"alloying-1"},
    
    ["ore-processing-3"] = {"metal-processing-2"},
    ["alloying-3"] = {"ore-processing-2"},
    ["metal-processing-3"] = {"alloying-2"},
    
    ["ore-processing-4"] = {"metal-processing-3"},
    ["alloying-4"] = {"ore-processing-3"},
    ["metal-processing-4"] = {"alloying-3"},
    
    ["ore-processing-5"] = {"metal-processing-4"},
    ["alloying-5"] = {"ore-processing-4"},
    ["metal-processing-5"] = {"alloying-4"},

    -- Sub-Categories --
    --- Ore Processing 1 ---
    ["iron-processing-1"] = {"ore-processing-1"},
    ["copper-processing-1"] = {"ore-processing-1"},
    ["tin-processing-1"] = {"ore-processing-1"},
    
    --- Alloying 1 ---
    ["bronze-alloying-1"] = {"alloying-1", "copper-processing-1", "tin-processing-1"},
    ["brass-alloying-1"] = {"alloying-1",  "copper-processing-1", "tin-processing-1"},
    ["steel-alloying-1"] = {"alloying-1", "iron-processing-1"},

    --- Metal Processing 1 ---
    ["steel-processing"] = {"metal-processing-1"},
    ["brass-bronze-processing-1"] = {"metal-processing-1"},

    --- Ore Processing 2 ---
    ["iron-processing-2"] = {"ore-processing-2"},
    ["copper-processing-2"] = {"ore-processing-2"},
    ["tin-processing-2"] = {"ore-processing-2"},
    
    --- Alloying 2 ---
    ["bronze-alloying-2"] = {"alloying-2", "copper-processing-2", "tin-processing-2"},
    ["brass-alloying-2"] = {"alloying-2",  "copper-processing-2", "tin-processing-2"},
    ["steel-alloying-2"] = {"alloying-2", "iron-processing-1"},
    ["stainless-steel-alloying-1"] = {"steel-alloying-2"},

    --- Metal Processing 2 ---
    ["steel-processing-2"] = {"metal-processing-2"},
    ["brass-bronze-processing-2"] = {"metal-processing-2"},
    ["stainless-steel-processing"] = {"steel-processing-2"},

    --- Ore Processing 3 ---
    ["iron-processing-3"] = {"ore-processing-3"},
    ["copper-processing-3"] = {"ore-processing-3"},
    ["tin-processing-3"] = {"ore-processing-3"},
    ["silver-processing-1"] = {"ore-processing-3"},
    ["gold-processing-1"] = {"ore-processing-3"},
    ["titanium-processing-1"] = {"ore-processing-3"},
    
    --- Alloying 3 ---

    --- Metal Processing 3 ---

    --- Ore Processing 4 ---
    ["silver-processing-2"] = {"ore-processing-4"},
    ["gold-processing-2"] = {"ore-processing-4"},
    ["titanium-processing-2"] = {"ore-processing-4"},
    
    --- Alloying 4 ---

    --- Metal Processing 4 ---

    --- Ore Processing 5 ---
    ["iron-processing-4"] = {"ore-processing-5"},
    ["copper-processing-4"] = {"ore-processing-5"},
    ["tin-processing-4"] = {"ore-processing-5"},
    ["tungsten-processing-1"] = {"ore-processing-5"},
    ["silver-processing-3"] = {"ore-processing-5"},
    ["gold-processing-3"] = {"ore-processing-5"},
    ["titanium-processing-3"] = {"ore-processing-5"},
    
    --- Alloying 5 ---

    --- Main Ore Processing ---
    ["hematite-processing-1"] = {"ore-processing-1"},
    ["hematite-processing-2"] = {"ore-processing-2"},
    ["hematite-processing-3"] = {"ore-processing-3"},
    ["hematite-processing-4"] = {"ore-processing-4"},
    ["hematite-processing-5"] = {"ore-processing-5"},
    
    ["chalcopyrite-processing-1"] = {"ore-processing-1"},
    ["chalcopyrite-processing-2"] = {"ore-processing-2"},
    ["chalcopyrite-processing-3"] = {"ore-processing-3"},
    ["chalcopyrite-processing-4"] = {"ore-processing-4"},
    ["chalcopyrite-processing-5"] = {"ore-processing-5"},

    ["carbon-processing-1"] = {"ore-processing-1"},
    ["carbon-processing-2"] = {"ore-processing-2"},
    ["carbon-processing-3"] = {"ore-processing-3"},
    ["carbon-processing-4"] = {"ore-processing-4"},
    ["carbon-processing-5"] = {"ore-processing-5"},

}