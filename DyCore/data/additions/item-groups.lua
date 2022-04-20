
local DyDs = "dyworld-"
local Table = {
    ["decor"] = {
        ["flooring-1"] = "b1",
        ["flooring-2"] = "b2",
        ["flooring-3"] = "b3",
        ["circuit-network"] = "a1",
        ["transport-drones-circuit"] = "a2",
        ["lamps"] = "a3",
    },
    ["fluids"] = {
        ["f-science-1"] = "z1",
        ["f-science-2"] = "z2",
        ["f-molten-1"] = "m1",
        ["f-molten-2"] = "m2",
        ["f-molten-3"] = "m3",
        ["f-molten-4"] = "m4",
        ["f-molten-5"] = "m5",
        ["f-acidic"] = "a3",
        ["f-basic"] = "a1",
        ["f-gases"] = "b1",
        ["f-oil"] = "a2",
    },
    ["inserters"] = {
        ["inserter-normal"] = "a1",
        ["inserter-filter"] = "a4",
        ["inserter-long"] = "a2",
        ["inserter-long-filter"] = "a5",
        ["inserter-far"] = "a3",
        ["inserter-far-filter"] = "a6",
        ["inserter-tier-1"] = "a1",
        ["inserter-tier-2"] = "a2",
        ["inserter-tier-3"] = "a3",
        ["inserter-tier-4"] = "a4",
        ["inserter-tier-5"] = "a5",
        ["inserter-tier-6"] = "a6",
        ["inserter-tier-7"] = "a7",
        ["inserter-tier-8"] = "a8",
        ["inserter-tier-9"] = "a9",
    },
    ["intermediates"] = {
        ["intermediates-tier-0"] = "1",
        ["intermediates-tier-1"] = "1",
        ["intermediates-tier-2"] = "1",
        ["intermediates-tier-3"] = "1",
        ["intermediates-tier-4"] = "1",
        ["intermediates-tier-5"] = "1",
        ["intermediates-tier-6"] = "1",
        ["intermediates-tier-7"] = "1",
        ["intermediates-tier-8"] = "1",
        ["intermediates-tier-9"] = "1",
        ["intermediates-bio"] = "1",
        ["intermediates-all"] = "1",
        ["satellites-1"] = "1",
        ["satellites-2"] = "1",
        ["satellites-3"] = "1",
        ["satellites-4"] = "1",
        ["0-resource-1"] = "1",
        ["0-resource-2"] = "1",
        ["0-resource-3"] = "1",
        ["0-resource-4"] = "1",
        ["0-resource-5"] = "1",
        ["material-1"] = "1",
        ["material-2"] = "1",
        ["material-3"] = "1",
        ["material-4"] = "1",
        ["material-5"] = "1",
        ["metal-1"] = "1",
        ["metal-2"] = "1",
        ["metal-3"] = "1",
        ["metal-4"] = "1",
        ["metal-5"] = "1",
        ["z-fluids"] = "1",
        ["z-canisters"] = "1",
        ["z-loot"] = "1",
        ["z-space"] = "1",
        ["zzz-void-recipes"] = "1",
        ["fluids-0"] = "1",
        ["fluids-1"] = "1",
        ["fluids-2"] = "1",
        ["fluids-3"] = "1",
        ["fluids-4"] = "1",
        ["fluids-5"] = "1",
        ["fluids-6"] = "1",
        ["fluids-7"] = "1",
        ["fluids-8"] = "1",
        ["fluids-9"] = "1",
        ["slags"] = "1",
    },
    ["logistics"] = {
        ["transport-belt"] = "1",
        ["transport-belt-underground"] = "1",
        ["transport-splitter"] = "1",
        ["transport-loader"] = "1",
        ["pipe"] = "1",
        ["pipe-underground"] = "1",
        ["pipe-storage"] = "1",
        ["pump"] = "1",
        ["pump-offshore"] = "1",
        ["rail"] = "1",
        ["chests"] = "1",
        ["chests-aai-1"] = "1",
        ["chests-aai-2"] = "1",
        ["chests-aai-3"] = "1",
        ["satellites-2a"] = "1",
        ["chests-storehouse"] = "1",
        ["chests-warehouse"] = "1",
        ["robot-construction"] = "1",
        ["robot-logistic"] = "1",
        ["roboport"] = "1",
        ["vehicles"] = "1",
        ["locomotive"] = "1",
        ["tank"] = "1",
        ["cargo-wagon"] = "1",
        ["fluid-wagon"] = "1",
        ["artillery-wagon"] = "1",
        ["transport-drones"] = "1",
    },
    ["machine-production"] = {
        ["burner-machines"] = "1",
        ["assemblers"] = "1",
        ["greenhouse"] = "1",
        ["air-filter"] = "1",
        ["miners"] = "1",
        ["furnaces"] = "1",
        ["centrifuge"] = "1",
        ["oil-machines"] = "1",
        ["rocket-silo"] = "1",
        ["oil-pumps"] = "1",
        ["chemical-plants"] = "1",
        ["oil-refinery"] = "1",
        ["machine-blasting"] = "1",
        ["machine-forger"] = "1",
        ["machine-caster"] = "1",
        ["standalone"] = "1",
    },
    ["modules"] = {
        ["beacon"] = "1",
        ["speed-module"] = "1",
        ["effectivity-module"] = "1",
        ["productivity-module"] = "1",
        ["pollution-1-module"] = "1",
        ["pollution-2-module"] = "1",
        ["super-module"] = "1",
    },
    ["personal"] = {
        ["consume-water"] = "a1",
        ["consume-food"] = "a2",
        ["consume-both"] = "a3",
        ["consume-implant"] = "a4",
        ["consume-zzz"] = "a5",
        ["med-pack"] = "1",
        ["labs"] = "1",
        ["science-fluids"] = "1",
        ["science-packs"] = "1",
        ["repair-pack"] = "1",
        ["mod-nanobots"] = "1",
    },
    ["power"] = {
        ["power-transfer"] = "1",
        ["solar"] = "1",
        ["accumulator"] = "1",
        ["boiler"] = "1",
        ["generator"] = "1",
        ["reactor"] = "1",
        ["heat-exchanger"] = "1",
        ["heat-pipe"] = "1",
        ["steam-engine"] = "1",
        ["steam-turbine"] = "1",
    },
    ["warfare-defensive"] = {
        ["radar"] = "1",
        ["turret-gun"] = "1",
        ["turret-sniper"] = "1",
        ["turret-gun-chain"] = "1",
        ["turret-shotgun"] = "1",
        ["turret-cannon"] = "1",
        ["turret-rocket"] = "1",
        ["turret-laser"] = "1",
        ["turret-beam"] = "1",
        ["turret-flame"] = "1",
        ["turret-artillery"] = "1",
        ["turret-laser-1a"] = "1",
        ["turret-laser-1b"] = "1",
        ["turret-laser-2a"] = "1",
        ["turret-laser-2b"] = "1",
        ["turret-laser-3a"] = "1",
        ["turret-laser-3b"] = "1",
        ["turret-laser-4a"] = "1",
        ["turret-laser-4b"] = "1",
        ["turret-laser-5a"] = "1",
        ["turret-laser-5b"] = "1",
        ["turret-beam-1a"] = "1",
        ["turret-beam-1b"] = "1",
        ["turret-beam-2a"] = "1",
        ["turret-beam-2b"] = "1",
        ["turret-beam-3a"] = "1",
        ["turret-beam-3b"] = "1",
        ["wall"] = "1",
        ["wall-gate"] = "1",
    },
    ["warfare-personal"] = {
        ["guns"] = "1",
        ["armor"] = "1",
        ["equipment-energy"] = "1",
        ["equipment-defense"] = "1",
        ["equipment-attack"] = "1",
        ["equipment-shield"] = "1",
        ["equipment-qol"] = "1",
        ["equipment-vehicle-defense"] = "1",
        ["equipment-vehicle-attack"] = "1",
        ["equipment-vehicle-shield"] = "1",
        ["equipment-vehicle-qol"] = "1",
        ["ammo-basic"] = "1",
        ["ammo-sniper"] = "1",
        ["ammo-bullet-basic"] = "1",
        ["ammo-bullet-piercing"] = "1",
        ["ammo-bullet-explosive"] = "1",
        ["ammo-shotgun"] = "1",
        ["ammo-shotgun-basic"] = "1",
        ["ammo-shotgun-piercing"] = "1",
        ["ammo-shotgun-explosive"] = "1",
        ["ammo-laser"] = "1",
        ["ammo-rocket"] = "1",
        ["ammo-cannon"] = "1",
        ["ammo-artillery"] = "1",
        ["ammo-flame"] = "1",
        ["grenade"] = "1",
        ["capsule"] = "1",
        ["landmine"] = "1",
        ["robots"] = "1",
        ["capsule-others"] = "1",
    },
    ["z-hidden"] = {
        ["hidden-items"] = "1",
        ["recycler-recipes"] = "1",
    },
}

for Main, Sub in pairs(Table) do
	data:extend({
        {
            type = "item-group",
            name = DyDs..Main,
            icon = "__DyCore__/graphics/item-group/"..Main..".png",
            icon_size = 64,
            order = DyDs..Main,
        }
	})
    for k, v in pairs(Sub) do
        data:extend({
            {
                type = "item-subgroup",
                name = DyDs..k,
                group = DyDs..Main,
                order = v,
            }
        })
    end
end