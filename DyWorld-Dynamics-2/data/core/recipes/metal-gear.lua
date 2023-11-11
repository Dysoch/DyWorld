local Name = "gear-wheel"

for k,v in pairs(Dy_Metal_Table) do
    if data.raw.item[k.."-plate"] and data.raw.item[k.."-"..Name] then
-- Create recipe for player --
data:extend({
    {
        type = "recipe",
        name = k.."-"..Name,
        --category = "centrifuging",
        main_product = k.."-"..Name,
        Add_To_Tech = v >= 2 and k.."-processing-1" or nil,
        normal = {
            ingredients = {
                {type = "item", name = k.."-plate", amount = (v * 5)},
            },
            results = {
                {type = "item", name = k.."-"..Name, amount_min = 1, amount_max = 1, probability = 1},
            },
            main_product = k.."-"..Name,
            energy_required = (v * 2),
            enabled = v >= 2 and false or true,
        },
    },
})
-- Create recipe for auto machine --
    end
end