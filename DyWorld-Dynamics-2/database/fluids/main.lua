local fluid_path = "__DyWorld-Dynamics-2__/graphics/fluids/"


DyWorld_2_Fluids = {
    --[""] = {},

    --- Main Ores Slurry---
    ["slurry-hematite"] = {subgroup = DyDs.."f-slurry-1"},
    ["slurry-chalcopyrite"] = {subgroup = DyDs.."f-slurry-1"},
    ["slurry-bauxite"] = {subgroup = DyDs.."f-slurry-1"},
    ["slurry-sphalerite"] = {subgroup = DyDs.."f-slurry-1"},
    ["slurry-galena"] = {subgroup = DyDs.."f-slurry-1"},
    ["slurry-tin-pyrite"] = {subgroup = DyDs.."f-slurry-1"},
    ["slurry-argentite"] = {subgroup = DyDs.."f-slurry-1"},
    ["slurry-calaverite"] = {subgroup = DyDs.."f-slurry-1"},
    ["slurry-rock-salt"] = {subgroup = DyDs.."f-slurry-1"},
    ["slurry-carnalite"] = {subgroup = DyDs.."f-slurry-1"},
    ["slurry-cinnabar"] = {subgroup = DyDs.."f-slurry-1"},
    ["slurry-dolomite"] = {subgroup = DyDs.."f-slurry-1"},
    ["slurry-limestone"] = {subgroup = DyDs.."f-slurry-1"},
    ["slurry-phosphorite"] = {subgroup = DyDs.."f-slurry-1"},
    ["slurry-pyrolusite"] = {subgroup = DyDs.."f-slurry-1"},
    ["slurry-carbon"] = {subgroup = DyDs.."f-slurry-1"},

    --- Ores Slurry---
    ["slurry-stone"] = {subgroup = DyDs.."f-slurry-2"},
    ["slurry-coal"] = {subgroup = DyDs.."f-slurry-2"},
    ["slurry-iron"] = {subgroup = DyDs.."f-slurry-2"},
    ["slurry-copper"] = {subgroup = DyDs.."f-slurry-2"},
    ["slurry-tin"] = {subgroup = DyDs.."f-slurry-2"},
    ["slurry-lead"] = {subgroup = DyDs.."f-slurry-2"},
    ["slurry-gold"] = {subgroup = DyDs.."f-slurry-2"},
    ["slurry-silver"] = {subgroup = DyDs.."f-slurry-2"},
    ["slurry-titanium"] = {subgroup = DyDs.."f-slurry-2"},
    ["slurry-tungsten"] = {subgroup = DyDs.."f-slurry-2"},
    ["slurry-zinc"] = {subgroup = DyDs.."f-slurry-2"},
    ["slurry-magnesium"] = {subgroup = DyDs.."f-slurry-2"},
    ["slurry-manganese"] = {subgroup = DyDs.."f-slurry-2"},

    --- Ores Molten---
    ["molten-iron"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["iron"]}},
        subgroup = DyDs.."f-molten",
    },
    ["molten-copper"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["copper"]}},
        subgroup = DyDs.."f-molten",
    },
    ["molten-tin"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["tin"]}},
        subgroup = DyDs.."f-molten",
    },
    ["molten-lead"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["lead"]}},
        subgroup = DyDs.."f-molten",
    },
    ["molten-gold"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["gold"]}},
        subgroup = DyDs.."f-molten",
    },
    ["molten-silver"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["silver"]}},
        subgroup = DyDs.."f-molten",
    },
    ["molten-titanium"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["titanium"]}},
        subgroup = DyDs.."f-molten",
    },
    ["molten-tungsten"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["tungsten"]}},
        subgroup = DyDs.."f-molten",
    },
    ["molten-zinc"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["zinc"]}},
        subgroup = DyDs.."f-molten",
    },
    ["molten-magnesium"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["magnesium"]}},
        subgroup = DyDs.."f-molten",
    },
    ["molten-manganese"] = {
        icons = {{icon = fluid_path.."metal.png", tint = Dy_Metal_Colors["manganese"]}},
        subgroup = DyDs.."f-molten",
    },

    -- Chemicals --
    ["argon"] = {
        icons = {{icon = fluid_path.."argon.png"}},
        subgroup = DyDs.."f-gases",
    },
    ["crude-oil"] = {
        icons = {{icon = fluid_path.."crude-oil.png"}},
        subgroup = DyDs.."f-oil",
        order = "1",
    },
    ["light-oil"] = {
        icons = {{icon = fluid_path.."light-oil.png"}},
        subgroup = DyDs.."f-oil",
        order = "2",
    },
    ["heavy-oil"] = {
        icons = {{icon = fluid_path.."heavy-oil.png"}},
        subgroup = DyDs.."f-oil",
        order = "3",
    },
    ["gasoline"] = {
        icons = {{icon = fluid_path.."gasoline.png"}},
        subgroup = DyDs.."f-oil",
        order = "5",
    },
    ["hydrogen"] = {
        icons = {{icon = fluid_path.."hydrogen.png"}},
        subgroup = DyDs.."f-gases",
    },
    ["oxygen"] = {
        icons = {{icon = fluid_path.."oxygen.png"}},
        subgroup = DyDs.."f-gases",
    },
    ["kerosine"] = {
        icons = {{icon = fluid_path.."kerosine.png"}},
        subgroup = DyDs.."f-oil",
        order = "6",
    },
    ["lubricant"] = {
        icons = {{icon = fluid_path.."lubricant.png"}},
        subgroup = DyDs.."f-oil",
        order = "7",
    },
    ["methane"] = {
        icons = {{icon = fluid_path.."methane.png"}},
        subgroup = DyDs.."f-gases",
    },
    ["natural-gas"] = {
        icons = {{icon = fluid_path.."natural-gas.png"}},
        subgroup = DyDs.."f-gases",
    },
    ["nitrogen"] = {
        icons = {{icon = fluid_path.."nitrogen.png"}},
        subgroup = DyDs.."f-gases",
    },
    ["petroleum-gas"] = {
        icons = {{icon = fluid_path.."petroleum-gas.png"}},
        subgroup = DyDs.."f-oil",
        order = "4",
    },
    ["steam"] = {
        icons = {{icon = fluid_path.."steam.png"}},
        subgroup = DyDs.."f-basic",
    },
    ["steam-dirty"] = {
        icons = {{icon = fluid_path.."steam.png", tint = Dy_Metal_Colors["tungsten"]}},
        subgroup = DyDs.."f-basic",
    },
    ["water"] = {
        icons = {{icon = fluid_path.."water.png"}},
        subgroup = DyDs.."f-basic",
    },
    ["water-dirty"] = {
        icons = {{icon = fluid_path.."water.png", tint = Dy_Metal_Colors["tungsten"]}},
        subgroup = DyDs.."f-basic",
    },
    ["sulfuric-acid"] = {
        icons = {{icon = fluid_path.."sulfuric-acid.png"}},
        subgroup = DyDs.."f-acidic",
    },
    ["xenon"] = {
        icons = {{icon = fluid_path.."xenon.png"}},
        subgroup = DyDs.."f-gases",
    },
}