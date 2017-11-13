require "data/prefix"
	
for k,v in pairs(Material_Table) do
	DyWorld_Turrets(v)
end

DyWorld_Add_To_Tech("turrets", dy.."copper-gun-turret")
DyWorld_Add_To_Tech("turrets", dy.."iron-gun-turret")
DyWorld_Add_To_Tech("turrets", dy.."steel-gun-turret")
DyWorld_Add_To_Tech("turrets", dy.."chromium-gun-turret")
DyWorld_Add_To_Tech("turrets", dy.."tin-gun-turret")
DyWorld_Add_To_Tech("turrets", dy.."silver-gun-turret")
DyWorld_Add_To_Tech("turrets", dy.."gold-gun-turret")
DyWorld_Add_To_Tech("turrets", dy.."lead-gun-turret")

DyWorld_Add_To_Tech("turrets", dy.."copper-shotgun-turret")
DyWorld_Add_To_Tech("turrets", dy.."iron-shotgun-turret")
DyWorld_Add_To_Tech("turrets", dy.."steel-shotgun-turret")
DyWorld_Add_To_Tech("turrets", dy.."chromium-shotgun-turret")
DyWorld_Add_To_Tech("turrets", dy.."tin-shotgun-turret")
DyWorld_Add_To_Tech("turrets", dy.."silver-shotgun-turret")
DyWorld_Add_To_Tech("turrets", dy.."gold-shotgun-turret")
DyWorld_Add_To_Tech("turrets", dy.."lead-shotgun-turret")

data.raw.recipe[dy.."stone-gun-turret"].enabled = true
data.raw.recipe[dy.."wood-gun-turret"].enabled = true

data.raw.recipe[dy.."stone-shotgun-turret"].enabled = true
data.raw.recipe[dy.."wood-shotgun-turret"].enabled = true