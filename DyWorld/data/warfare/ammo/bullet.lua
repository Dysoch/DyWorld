require "data/prefix"
	
for k,v in pairs(Material_Table) do
	DyWorld_Ammo(v)
end

DyWorld_Add_To_Tech("military", dy.."copper-basic-ammo")
DyWorld_Add_To_Tech("military", dy.."iron-basic-ammo")
DyWorld_Add_To_Tech("steel-processing", dy.."steel-basic-ammo")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-basic-ammo")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-basic-ammo")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-basic-ammo")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-basic-ammo")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-basic-ammo")

DyWorld_Add_To_Tech("military", dy.."copper-shotgun-ammo")
DyWorld_Add_To_Tech("military", dy.."iron-shotgun-ammo")
DyWorld_Add_To_Tech("steel-processing", dy.."steel-shotgun-ammo")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-shotgun-ammo")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-shotgun-ammo")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-shotgun-ammo")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-shotgun-ammo")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-shotgun-ammo")

DyWorld_Add_To_Tech("military-2", dy.."stone-basic-piercing-ammo")
DyWorld_Add_To_Tech("military-2", dy.."wood-basic-piercing-ammo")
DyWorld_Add_To_Tech("military-2", dy.."copper-basic-piercing-ammo")
DyWorld_Add_To_Tech("military-2", dy.."iron-basic-piercing-ammo")
DyWorld_Add_To_Tech("steel-processing", dy.."steel-basic-piercing-ammo")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-basic-piercing-ammo")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-basic-piercing-ammo")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-basic-piercing-ammo")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-basic-piercing-ammo")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-basic-piercing-ammo")

DyWorld_Add_To_Tech("military-2", dy.."stone-shotgun-piercing-ammo")
DyWorld_Add_To_Tech("military-2", dy.."wood-shotgun-piercing-ammo")
DyWorld_Add_To_Tech("military-2", dy.."copper-shotgun-piercing-ammo")
DyWorld_Add_To_Tech("military-2", dy.."iron-shotgun-piercing-ammo")
DyWorld_Add_To_Tech("steel-processing", dy.."steel-shotgun-piercing-ammo")
DyWorld_Add_To_Tech(dy.."lead-processing", dy.."lead-shotgun-piercing-ammo")
DyWorld_Add_To_Tech(dy.."silver-processing", dy.."silver-shotgun-piercing-ammo")
DyWorld_Add_To_Tech(dy.."tin-processing", dy.."tin-shotgun-piercing-ammo")
DyWorld_Add_To_Tech(dy.."gold-processing", dy.."gold-shotgun-piercing-ammo")
DyWorld_Add_To_Tech(dy.."chromium-processing", dy.."chromium-shotgun-piercing-ammo")

data.raw.recipe[dy.."stone-basic-ammo"].enabled = true
data.raw.recipe[dy.."wood-basic-ammo"].enabled = true

data.raw.recipe[dy.."stone-shotgun-ammo"].enabled = true
data.raw.recipe[dy.."wood-shotgun-ammo"].enabled = true