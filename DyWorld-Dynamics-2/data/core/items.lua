

for k,v in pairs(DyWorld_2_Main_Items) do
    DyW.Item.Add.Add_1(v, k)
end

for k,v in pairs(DyWorld_2_Main_Intermediates) do
    DyW.Item.Add.Add_1(v, k)
end


data:extend({
    {
        type = "item-with-inventory",
        name = "dynamic-interface-system",
        icons =
        {
            {
                icon = "__DyCore__/graphics/questionmark.png",
            },
        },
        inventory_size = 5,
        icon_size = 64,
        subgroup = DyDs.."transport-loader",
        order = "1",
        stack_size = 1,
    },
    {
        type = "recipe",
        name = "dynamic-interface-system",
	    --category = "assembling-tier-1",
        normal =
        {
            ingredients =
            {
                
            },
            result = "dynamic-interface-system",
	        result_count = 1,
	        energy_required = 2,
	        enabled = true,
        },
    },
})