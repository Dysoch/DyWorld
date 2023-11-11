local Name = "stick"

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
                {type = "item", name = k.."-plate", amount = v},
            },
            results = {
                {type = "item", name = k.."-"..Name, amount_min = 2, amount_max = 3, probability = 1},
            },
            main_product = k.."-"..Name,
            energy_required = (v * 1),
            enabled = v >= 2 and false or true,
        },
    },
})
-- Create recipe for auto machine --
    end
end