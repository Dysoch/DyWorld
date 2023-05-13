


DyWorld_2_Metallurgy_Tech = {
    --[""] = {},

    -- Main Categories --
    ["basic-ore-processing"] = {"metallurgy"},
    ["basic-alloying"] = {"basic-ore-processing"},
    ["basic-metal-processing"] = {"basic-alloying"},
    
    ["ore-processing"] = {"basic-metal-processing"},
    ["alloying"] = {"ore-processing"},
    ["metal-processing"] = {"alloying"},

    ["advanced-ore-processing"] = {"metal-processing"},
    ["advanced-alloying"] = {"advanced-ore-processing"},
    ["advanced-metal-processing"] = {"advanced-alloying"},

    ["highly-advanced-ore-processing"] = {"advanced-metal-processing"},
    ["highly-advanced-alloying"] = {"highly-advanced-ore-processing"},
    ["highly-advanced-metal-processing"] = {"highly-advanced-alloying"},

    ["quantum-ore-processing"] = {"highly-advanced-metal-processing"},
    ["quantum-alloying"] = {"quantum-ore-processing"},
    ["quantum-metal-processing"] = {"quantum-alloying"},

    -- Sub-Categories --
    --- Basic Ore Processing ---
    ["basic-iron-processing"] = {"basic-ore-processing"},
    ["basic-copper-processing"] = {"basic-ore-processing"},
    ["basic-tin-processing"] = {"basic-ore-processing"},
    
    --- Basic Alloying ---
    ["basic-bronze-alloying"] = {"basic-alloying", "basic-copper-processing", "basic-tin-processing"},
    ["basic-brass-alloying"] = {"basic-alloying",  "basic-copper-processing", "basic-tin-processing"},
    ["basic-steel-alloying"] = {"basic-alloying", "basic-iron-processing"},

    --- Basic Metal Processing ---
    ["basic-iron-intermediates"] = {"basic-metal-processing"},
    ["basic-copper-intermediates"] = {"basic-metal-processing"},
    ["basic-tin-intermediates"] = {"basic-metal-processing"},
    ["basic-steel-intermediates"] = {"basic-metal-processing"},

    --- Ore Processing ---
    ["iron-processing"] = {"ore-processing"},
    ["copper-processing"] = {"ore-processing"},
    ["tin-processing"] = {"ore-processing"},
    
    --- Alloying ---
    ["bronze-alloying"] = {"alloying", "copper-processing", "tin-processing"},
    ["brass-alloying"] = {"alloying",  "copper-processing", "tin-processing"},
    ["steel-alloying"] = {"alloying", "iron-processing"},
    ["stainless-steel-alloying"] = {"steel-alloying"},

    --- Metal Processing ---
    ["iron-intermediates"] = {"metal-processing"},
    ["copper-intermediates"] = {"metal-processing"},
    ["bronze-brass-intermediates"] = {"metal-processing"},
    ["steel-intermediates"] = {"metal-processing"},
    ["stainless-steel-intermediates"] = {"steel-intermediates"},

    --- Advanced Ore Processing ---
    ["advanced-iron-processing"] = {"advanced-ore-processing"},
    ["advanced-copper-processing"] = {"advanced-ore-processing"},
    ["advanced-tin-processing"] = {"advanced-ore-processing"},
    ["silver-processing"] = {"advanced-ore-processing"},
    ["gold-processing"] = {"advanced-ore-processing"},
    ["titanium-processing"] = {"advanced-ore-processing"},
    
    --- Advanced Alloying ---

    --- Advanced Metal Processing ---

    --- Highly Advanced Ore Processing ---
    ["advanced-silver-processing"] = {"highly-advanced-ore-processing"},
    ["advanced-gold-processing"] = {"highly-advanced-ore-processing"},
    ["advanced-titanium-processing"] = {"highly-advanced-ore-processing"},
    
    --- Highly Advanced Alloying ---

    --- Highly Advanced Metal Processing ---

    --- Quantum Ore Processing ---
    ["quantum-iron-processing"] = {"quantum-ore-processing"},
    ["quantum-copper-processing"] = {"quantum-ore-processing"},
    ["quantum-tin-processing"] = {"quantum-ore-processing"},
    ["quantum-tungsten-processing"] = {"quantum-ore-processing"},
    ["quantum-silver-processing"] = {"quantum-ore-processing"},
    ["quantum-gold-processing"] = {"quantum-ore-processing"},
    ["quantum-titanium-processing"] = {"quantum-ore-processing"},
    
    --- Quantum Alloying ---

    --- Quantum Metal Processing ---
    ["quantum-iron-intermediates"] = {"quantum-metal-processing"},
    ["quantum-copper-intermediates"] = {"quantum-metal-processing"},
    ["quantum-tin-intermediates"] = {"quantum-metal-processing"},
    ["quantum-tungsten-intermediates"] = {"quantum-metal-processing"},
    ["quantum-silver-intermediates"] = {"quantum-metal-processing"},
    ["quantum-gold-intermediates"] = {"quantum-metal-processing"},
    ["quantum-titanium-intermediates"] = {"quantum-metal-processing"},


}