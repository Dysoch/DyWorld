

local Science_Table = {
    ["automation"] = 1,
    ["logistic"] = 2,
    ["chemical"] = 3,
    ["military"] = 4,
    ["production"] = 5,
    ["utility"] = 6,
    ["space"] = 7,
}
local Metal_Table = {}
local Bio_Table = {}

for k,v in pairs(Science_Table) do
    data:extend({
        {
            type = "tool",
            name = k.."-science-pack",
            localised_description = {"item-description.science-pack"},
            icons =
            {
                {
                    icon = Dy_icon.."science-1/"..k..".png",
                },
            },
            icon_size = 32,
            stack_size = 500,
            durability = 1,
            durability_description_key = "description.science-pack-remaining-amount-key",
            durability_description_value = "description.science-pack-remaining-amount-value",
            subgroup = DyDs.."science-packs-1",
            order = v,
            rocket_launch_product = {"advanced-"..k.."-science-pack", 1},
        },
        {
            type = "tool",
            name = "advanced-"..k.."-science-pack",
            localised_description = {"item-description.science-pack"},
            icons =
            {
                {
                    icon = Dy_icon.."science-2/"..k..".png",
                },
            },
            icon_size = 32,
            stack_size = 500,
            durability = 1,
            durability_description_key = "description.science-pack-remaining-amount-key",
            durability_description_value = "description.science-pack-remaining-amount-value",
            subgroup = DyDs.."science-packs-2",
            order = v,
        },
    })
end
