require "data/prefix"
	
for k,v in pairs(Material_Table) do
	DyWorld_Transport_Pipe(v)
end

DyWorld_Add_To_Tech("automation", dy.."copper-pipe")
DyWorld_Add_To_Tech("automation", dy.."iron-pipe")
DyWorld_Add_To_Tech("steel-processing", dy.."steel-pipe")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-pipe")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-pipe")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-pipe")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-pipe")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-pipe")

DyWorld_Add_To_Tech("automation", dy.."copper-pipe-to-ground")
DyWorld_Add_To_Tech("automation", dy.."iron-pipe-to-ground")
DyWorld_Add_To_Tech("steel-processing", dy.."steel-pipe-to-ground")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-pipe-to-ground")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-pipe-to-ground")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-pipe-to-ground")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-pipe-to-ground")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-pipe-to-ground")

data.raw.recipe[dy.."wood-pipe"].enabled = true
data.raw.recipe[dy.."wood-pipe-to-ground"].enabled = true

data.raw.recipe[dy.."rubber-pipe"].enabled = true
data.raw.recipe[dy.."rubber-pipe-to-ground"].enabled = true

data.raw.recipe[dy.."obsidian-pipe"].enabled = true
data.raw.recipe[dy.."obsidian-pipe-to-ground"].enabled = true

data.raw.recipe[dy.."stone-pipe"].enabled = true
data.raw.recipe[dy.."stone-pipe-to-ground"].enabled = true