require "data/prefix"
	
for k,v in pairs(Material_Table) do
	DyWorld_Storage_Tanks(v)
end

DyWorld_Add_To_Tech("automation", dy.."copper-storage-tank")
DyWorld_Add_To_Tech("automation", dy.."iron-storage-tank")
DyWorld_Add_To_Tech("steel-processing", dy.."steel-storage-tank")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-storage-tank")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-storage-tank")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-storage-tank")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-storage-tank")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-storage-tank")

data.raw.recipe[dy.."wood-storage-tank"].enabled = true

data.raw.recipe[dy.."stone-storage-tank"].enabled = true