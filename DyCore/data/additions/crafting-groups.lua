
local DyDs = "dyworld-"
local Table = {
    "unused",
    "hidden",
    "bloomery",
    "casting",
    "grinding",
    "farming",
    "blast-furnace",
    
    "assembling-1",
    "assembling-2",
    "assembling-3",
    "assembling-4",
    "assembling-5",
    "assembling-6",
    "assembling-7",
    "assembling-8",
    "assembling-9",
    "assembling-10",
}

for _, Name in pairs(Table) do
    data:extend(
        {
          {
            type = "recipe-category",
            name = DyDs..Name
          }
        })
end