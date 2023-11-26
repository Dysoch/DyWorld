
local DyDs = "dyworld-"
local Table = {
    "unused",
    "hidden",
    "carbon",
    "chemical",
    "oil",
    "water",
    "nuclear",
    "energy",
    --"hidden",
}

for _, Name in pairs(Table) do
    data:extend(
        {
          {
            type = "fuel-category",
            name = DyDs..Name
          }
        })
end