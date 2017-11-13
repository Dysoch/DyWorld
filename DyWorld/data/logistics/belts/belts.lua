require "data/prefix"
	
for k,v in pairs(Material_Table) do
	DyWorld_Transport_Belt(v)
end

DyWorld_Add_To_Tech("logistics", dy.."copper-transport-belt")
DyWorld_Add_To_Tech("logistics", dy.."iron-transport-belt")
DyWorld_Add_To_Tech("logistics", dy.."steel-transport-belt")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-transport-belt")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-transport-belt")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-transport-belt")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-transport-belt")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-transport-belt")

DyWorld_Add_To_Tech("logistics", dy.."copper-underground-belt")
DyWorld_Add_To_Tech("logistics", dy.."iron-underground-belt")
DyWorld_Add_To_Tech("logistics", dy.."steel-underground-belt")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-underground-belt")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-underground-belt")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-underground-belt")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-underground-belt")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-underground-belt")

DyWorld_Add_To_Tech("logistics", dy.."copper-splitter")
DyWorld_Add_To_Tech("logistics", dy.."iron-splitter")
DyWorld_Add_To_Tech("logistics", dy.."steel-splitter")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-splitter")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-splitter")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-splitter")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-splitter")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-splitter")

data.raw.recipe[dy.."stone-transport-belt"].enabled = true
data.raw.recipe[dy.."wood-transport-belt"].enabled = true

data.raw.recipe[dy.."stone-underground-belt"].enabled = true
data.raw.recipe[dy.."wood-underground-belt"].enabled = true

data.raw.recipe[dy.."stone-splitter"].enabled = true
data.raw.recipe[dy.."wood-splitter"].enabled = true