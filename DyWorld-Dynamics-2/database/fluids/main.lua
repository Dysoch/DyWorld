local fluid_path = "__DyWorld-Dynamics-2__/graphics/fluids/"


DyWorld_2_Fluids = {
    --[""] = {},

    --- Main Ores Slurry---
    ["slurry-hematite"] = {group = DyDs.."f-slurry-1"},
    ["slurry-chalcopyrite"] = {group = DyDs.."f-slurry-1"},
    ["slurry-bauxite"] = {group = DyDs.."f-slurry-1"},
    ["slurry-sphalerite"] = {group = DyDs.."f-slurry-1"},
    ["slurry-galena"] = {group = DyDs.."f-slurry-1"},
    ["slurry-tin-pyrite"] = {group = DyDs.."f-slurry-1"},
    ["slurry-argentite"] = {group = DyDs.."f-slurry-1"},
    ["slurry-calaverite"] = {group = DyDs.."f-slurry-1"},
    ["slurry-rock-salt"] = {group = DyDs.."f-slurry-1"},
    ["slurry-carnalite"] = {group = DyDs.."f-slurry-1"},
    ["slurry-cinnabar"] = {group = DyDs.."f-slurry-1"},
    ["slurry-dolomite"] = {group = DyDs.."f-slurry-1"},
    ["slurry-limestone"] = {group = DyDs.."f-slurry-1"},
    ["slurry-phosphorite"] = {group = DyDs.."f-slurry-1"},
    ["slurry-pyrolusite"] = {group = DyDs.."f-slurry-1"},
    ["slurry-carbon"] = {group = DyDs.."f-slurry-1"},

    --- Ores Slurry---
    ["slurry-stone"] = {group = DyDs.."f-slurry-2"},
    ["slurry-coal"] = {group = DyDs.."f-slurry-2"},
    ["slurry-iron"] = {group = DyDs.."f-slurry-2"},
    ["slurry-copper"] = {group = DyDs.."f-slurry-2"},
    ["slurry-tin"] = {group = DyDs.."f-slurry-2"},
    ["slurry-lead"] = {group = DyDs.."f-slurry-2"},
    ["slurry-gold"] = {group = DyDs.."f-slurry-2"},
    ["slurry-silver"] = {group = DyDs.."f-slurry-2"},
    ["slurry-titanium"] = {group = DyDs.."f-slurry-2"},
    ["slurry-tungsten"] = {group = DyDs.."f-slurry-2"},
    ["slurry-zinc"] = {group = DyDs.."f-slurry-2"},
    ["slurry-magnesium"] = {group = DyDs.."f-slurry-2"},
    ["slurry-manganese"] = {group = DyDs.."f-slurry-2"},

    --- Ores Molten---
    ["molten-iron"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["iron"]}},
        group = DyDs.."f-molten",
        temp_max = (Dy_Material_System["iron"] and Dy_Material_System["iron"].boiling_Point) or 1000,
        temp_def = (Dy_Material_System["iron"] and Dy_Material_System["iron"].melting_Point) or 100,
        temp_gas = (Dy_Material_System["iron"] and Dy_Material_System["iron"].boiling_Point) or 1000,
    },
    ["molten-copper"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["copper"]}},
        group = DyDs.."f-molten",
        temp_max = (Dy_Material_System["copper"] and Dy_Material_System["copper"].boiling_Point) or 1000,
        temp_def = (Dy_Material_System["copper"] and Dy_Material_System["copper"].melting_Point) or 100,
        temp_gas = (Dy_Material_System["copper"] and Dy_Material_System["copper"].boiling_Point) or 1000,
    },
    ["molten-tin"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["tin"]}},
        group = DyDs.."f-molten",
        temp_max = (Dy_Material_System["tin"] and Dy_Material_System["tin"].boiling_Point) or 1000,
        temp_def = (Dy_Material_System["tin"] and Dy_Material_System["tin"].melting_Point) or 100,
        temp_gas = (Dy_Material_System["tin"] and Dy_Material_System["tin"].boiling_Point) or 1000,
    },
    ["molten-lead"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["lead"]}},
        group = DyDs.."f-molten",
        temp_max = (Dy_Material_System["lead"] and Dy_Material_System["lead"].boiling_Point) or 1000,
        temp_def = (Dy_Material_System["lead"] and Dy_Material_System["lead"].melting_Point) or 100,
        temp_gas = (Dy_Material_System["lead"] and Dy_Material_System["lead"].boiling_Point) or 1000,
    },
    ["molten-gold"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["gold"]}},
        group = DyDs.."f-molten",
        temp_max = (Dy_Material_System["gold"] and Dy_Material_System["gold"].boiling_Point) or 1000,
        temp_def = (Dy_Material_System["gold"] and Dy_Material_System["gold"].melting_Point) or 100,
        temp_gas = (Dy_Material_System["gold"] and Dy_Material_System["gold"].boiling_Point) or 1000,
    },
    ["molten-silver"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["silver"]}},
        group = DyDs.."f-molten",
        temp_max = (Dy_Material_System["silver"] and Dy_Material_System["silver"].boiling_Point) or 1000,
        temp_def = (Dy_Material_System["silver"] and Dy_Material_System["silver"].melting_Point) or 100,
        temp_gas = (Dy_Material_System["silver"] and Dy_Material_System["silver"].boiling_Point) or 1000,
    },
    ["molten-titanium"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["titanium"]}},
        group = DyDs.."f-molten",
        temp_max = (Dy_Material_System["titanium"] and Dy_Material_System["titanium"].boiling_Point) or 1000,
        temp_def = (Dy_Material_System["titanium"] and Dy_Material_System["titanium"].melting_Point) or 100,
        temp_gas = (Dy_Material_System["titanium"] and Dy_Material_System["titanium"].boiling_Point) or 1000,
    },
    ["molten-tungsten"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["tungsten"]}},
        group = DyDs.."f-molten",
        temp_max = (Dy_Material_System["tungsten"] and Dy_Material_System["tungsten"].boiling_Point) or 1000,
        temp_def = (Dy_Material_System["tungsten"] and Dy_Material_System["tungsten"].melting_Point) or 100,
        temp_gas = (Dy_Material_System["tungsten"] and Dy_Material_System["tungsten"].boiling_Point) or 1000,
    },
    ["molten-zinc"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["zinc"]}},
        group = DyDs.."f-molten",
        temp_max = (Dy_Material_System["zinc"] and Dy_Material_System["zinc"].boiling_Point) or 1000,
        temp_def = (Dy_Material_System["zinc"] and Dy_Material_System["zinc"].melting_Point) or 100,
        temp_gas = (Dy_Material_System["zinc"] and Dy_Material_System["zinc"].boiling_Point) or 1000,
    },
    ["molten-magnesium"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["magnesium"]}},
        group = DyDs.."f-molten",
    },
    ["molten-manganese"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["manganese"]}},
        group = DyDs.."f-molten",
    },

    -- Chemicals --
    ["argon"] = {
        icons = {{icon = fluid_path.."argon.png"}},
        group = DyDs.."f-gases",
    },
    ["crude-oil"] = {
        icons = {{icon = fluid_path.."crude-oil.png"}},
        group = DyDs.."f-oil",
        order = "1",
    },
    ["light-oil"] = {
        icons = {{icon = fluid_path.."light-oil.png"}},
        group = DyDs.."f-oil",
        order = "2",
    },
    ["heavy-oil"] = {
        icons = {{icon = fluid_path.."heavy-oil.png"}},
        group = DyDs.."f-oil",
        order = "3",
    },
    ["gasoline"] = {
        icons = {{icon = fluid_path.."gasoline.png"}},
        group = DyDs.."f-oil",
        order = "5",
    },
    ["hydrogen"] = {
        icons = {{icon = fluid_path.."hydrogen.png"}},
        group = DyDs.."f-gases",
    },
    ["oxygen"] = {
        icons = {{icon = fluid_path.."oxygen.png"}},
        group = DyDs.."f-gases",
    },
    ["kerosine"] = {
        icons = {{icon = fluid_path.."kerosine.png"}},
        group = DyDs.."f-oil",
        order = "6",
    },
    ["lubricant"] = {
        icons = {{icon = fluid_path.."lubricant.png"}},
        group = DyDs.."f-oil",
        order = "7",
    },
    ["methane"] = {
        icons = {{icon = fluid_path.."methane.png"}},
        group = DyDs.."f-gases",
    },
    ["natural-gas"] = {
        icons = {{icon = fluid_path.."natural-gas.png"}},
        group = DyDs.."f-gases",
    },
    ["nitrogen"] = {
        icons = {{icon = fluid_path.."nitrogen.png"}},
        group = DyDs.."f-gases",
    },
    ["petroleum-gas"] = {
        icons = {{icon = fluid_path.."petroleum-gas.png"}},
        group = DyDs.."f-oil",
        order = "4",
    },
    ["steam"] = {
        icons = {{icon = fluid_path.."steam.png"}},
        group = DyDs.."f-basic",
        fuel = "0J",
        heat = "0.2KJ",
        temp_max = 1000,
        temp_def = 100,
        temp_gas = 15,
    },
    ["steam-dirty"] = {
        icons = {{icon = fluid_path.."steam.png", tint = Dy_Metal_Colors["tungsten"]}},
        group = DyDs.."f-basic",
        fuel = "0J",
        heat = "0.02KJ",
        temp_max = 1000,
        temp_def = 100,
        temp_gas = 15,
    },
    ["water"] = {
        icons = {{icon = fluid_path.."water.png"}},
        group = DyDs.."f-basic",
    },
    ["water-dirty"] = {
        icons = {{icon = fluid_path.."water.png", tint = Dy_Metal_Colors["tungsten"]}},
        group = DyDs.."f-basic",
    },
    ["sulfuric-acid"] = {
        icons = {{icon = fluid_path.."sulfuric-acid.png"}},
        group = DyDs.."f-acidic",
    },
    ["xenon"] = {
        icons = {{icon = fluid_path.."xenon.png"}},
        group = DyDs.."f-gases",
    },
}