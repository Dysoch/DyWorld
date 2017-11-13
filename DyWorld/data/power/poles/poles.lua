require "data/prefix"
	
for k,v in pairs(Material_Table) do
	DyWorld_Power_Poles(v)
end

DyWorld_Add_To_Tech("logistics", dy.."copper-power-pole")
DyWorld_Add_To_Tech("logistics", dy.."iron-power-pole")
DyWorld_Add_To_Tech("steel-processing", dy.."steel-power-pole")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-power-pole")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-power-pole")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-power-pole")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-power-pole")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-power-pole")

DyWorld_Add_To_Tech("logistics", dy.."copper-power-relay")
DyWorld_Add_To_Tech("logistics", dy.."iron-power-relay")
DyWorld_Add_To_Tech("steel-processing", dy.."steel-power-relay")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-power-relay")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-power-relay")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-power-relay")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-power-relay")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-power-relay")

data.raw.recipe[dy.."wood-power-pole"].enabled = true
data.raw.recipe[dy.."wood-power-relay"].enabled = true

data.raw.recipe[dy.."stone-power-pole"].enabled = true
data.raw.recipe[dy.."stone-power-relay"].enabled = true