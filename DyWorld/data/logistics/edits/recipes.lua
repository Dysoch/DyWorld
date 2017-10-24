require "data/prefix"



data.raw.recipe["transport-belt"].enabled = false

data.raw.recipe["pipe"].ingredients = {{"stone", 2}}
data.raw.recipe["pipe-to-ground"].ingredients = {{"pipe", DyWorld_Material_Formulas(2, "Stone")},{"stone", 4}}
