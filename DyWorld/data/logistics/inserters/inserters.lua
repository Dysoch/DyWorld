require "data/prefix"
	
for k,v in pairs(Material_Table) do
	DyWorld_Inserters(v)
end

DyWorld_Add_To_Tech("automation", dy.."copper-basic-inserter")
DyWorld_Add_To_Tech("automation", dy.."iron-basic-inserter")
DyWorld_Add_To_Tech("steel-processing", dy.."steel-basic-inserter")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-basic-inserter")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-basic-inserter")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-basic-inserter")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-basic-inserter")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-basic-inserter")

DyWorld_Add_To_Tech("automation", dy.."copper-long-inserter")
DyWorld_Add_To_Tech("automation", dy.."iron-long-inserter")
DyWorld_Add_To_Tech("steel-processing", dy.."steel-long-inserter")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-long-inserter")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-long-inserter")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-long-inserter")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-long-inserter")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-long-inserter")

DyWorld_Add_To_Tech("automation", dy.."copper-filter-inserter")
DyWorld_Add_To_Tech("automation", dy.."iron-filter-inserter")
DyWorld_Add_To_Tech("steel-processing", dy.."steel-filter-inserter")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-filter-inserter")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-filter-inserter")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-filter-inserter")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-filter-inserter")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-filter-inserter")

DyWorld_Add_To_Tech("logistics-3", dy.."wood-stack-inserter")
DyWorld_Add_To_Tech("logistics-3", dy.."stone-stack-inserter")
DyWorld_Add_To_Tech("logistics-3", dy.."copper-stack-inserter")
DyWorld_Add_To_Tech("logistics-3", dy.."iron-stack-inserter")
DyWorld_Add_To_Tech("logistics-3", dy.."steel-stack-inserter")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-stack-inserter")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-stack-inserter")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-stack-inserter")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-stack-inserter")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-stack-inserter")

DyWorld_Add_To_Tech("logistics-3", dy.."wood-stack-filter-inserter")
DyWorld_Add_To_Tech("logistics-3", dy.."stone-stack-filter-inserter")
DyWorld_Add_To_Tech("logistics-3", dy.."copper-stack-filter-inserter")
DyWorld_Add_To_Tech("logistics-3", dy.."iron-stack-filter-inserter")
DyWorld_Add_To_Tech("logistics-3", dy.."steel-stack-filter-inserter")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-stack-filter-inserter")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-stack-filter-inserter")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-stack-filter-inserter")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-stack-filter-inserter")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-stack-filter-inserter")

DyWorld_Add_To_Tech("logistics-3", dy.."wood-super-inserter")
DyWorld_Add_To_Tech("logistics-3", dy.."stone-super-inserter")
DyWorld_Add_To_Tech("logistics-3", dy.."copper-super-inserter")
DyWorld_Add_To_Tech("logistics-3", dy.."iron-super-inserter")
DyWorld_Add_To_Tech("logistics-3", dy.."steel-super-inserter")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-super-inserter")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-super-inserter")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-super-inserter")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-super-inserter")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-super-inserter")

data.raw.recipe[dy.."wood-basic-inserter"].enabled = true
data.raw.recipe[dy.."wood-long-inserter"].enabled = true
data.raw.recipe[dy.."wood-filter-inserter"].enabled = true

data.raw.recipe[dy.."stone-basic-inserter"].enabled = true
data.raw.recipe[dy.."stone-long-inserter"].enabled = true
data.raw.recipe[dy.."stone-filter-inserter"].enabled = true