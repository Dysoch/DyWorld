require "data/prefix"

local Data_Table = {
	{
		Name = "copper",
		Tint = Material_Colors.Copper,
		Health = DyWorld_Material_Formulas(3, "Copper"),
		Attack_MaxRange = DyWorld_Material_Formulas(5, "Copper"),
		Attack_Speed = DyWorld_Material_Formulas(6, "Copper"),
		Attack_Radius = DyWorld_Material_Formulas(7, "Copper"),
	},
	{
		Name = "iron",
		Tint = Material_Colors.Iron,
		Health = DyWorld_Material_Formulas(3, "Iron"),
		Attack_MaxRange = DyWorld_Material_Formulas(5, "Iron"),
		Attack_Speed = DyWorld_Material_Formulas(6, "Iron"),
		Attack_Radius = DyWorld_Material_Formulas(7, "Iron"),
	},
	{
		Name = "steel",
		Tint = Material_Colors.Steel,
		Health = DyWorld_Material_Formulas(3, "Steel"),
		Attack_MaxRange = DyWorld_Material_Formulas(5, "Steel"),
		Attack_Speed = DyWorld_Material_Formulas(6, "Steel"),
		Attack_Radius = DyWorld_Material_Formulas(7, "Steel"),
	},
	{
		Name = "stone",
		Tint = Material_Colors.Stone,
		Health = DyWorld_Material_Formulas(3, "Stone"),
		Attack_MaxRange = DyWorld_Material_Formulas(5, "Stone"),
		Attack_Speed = DyWorld_Material_Formulas(6, "Stone"),
		Attack_Radius = DyWorld_Material_Formulas(7, "Stone"),
	},
	{
		Name = "wood",
		Tint = Material_Colors.Wood,
		Health = DyWorld_Material_Formulas(3, "Wood"),
		Attack_MaxRange = DyWorld_Material_Formulas(5, "Wood"),
		Attack_Speed = DyWorld_Material_Formulas(6, "Wood"),
		Attack_Radius = DyWorld_Material_Formulas(7, "Wood"),
	},
	{
		Name = "chromium",
		Tint = Material_Colors.Chromium,
		Health = DyWorld_Material_Formulas(3, "Chromium"),
		Attack_MaxRange = DyWorld_Material_Formulas(5, "Chromium"),
		Attack_Speed = DyWorld_Material_Formulas(6, "Chromium"),
		Attack_Radius = DyWorld_Material_Formulas(7, "Chromium"),
	},
	{
		Name = "tin",
		Tint = Material_Colors.Tin,
		Health = DyWorld_Material_Formulas(3, "Tin"),
		Attack_MaxRange = DyWorld_Material_Formulas(5, "Tin"),
		Attack_Speed = DyWorld_Material_Formulas(6, "Tin"),
		Attack_Radius = DyWorld_Material_Formulas(7, "Tin"),
	},
	{
		Name = "silver",
		Tint = Material_Colors.Silver,
		Health = DyWorld_Material_Formulas(3, "Silver"),
		Attack_MaxRange = DyWorld_Material_Formulas(5, "Silver"),
		Attack_Speed = DyWorld_Material_Formulas(6, "Silver"),
		Attack_Radius = DyWorld_Material_Formulas(7, "Silver"),
	},
	{
		Name = "gold",
		Tint = Material_Colors.Gold,
		Health = DyWorld_Material_Formulas(3, "Gold"),
		Attack_MaxRange = DyWorld_Material_Formulas(5, "Gold"),
		Attack_Speed = DyWorld_Material_Formulas(6, "Gold"),
		Attack_Radius = DyWorld_Material_Formulas(7, "Gold"),
	},
	{
		Name = "lead",
		Tint = Material_Colors.Lead,
		Health = DyWorld_Material_Formulas(3, "Lead"),
		Attack_MaxRange = DyWorld_Material_Formulas(5, "Lead"),
		Attack_Speed = DyWorld_Material_Formulas(6, "Lead"),
		Attack_Radius = DyWorld_Material_Formulas(7, "Lead"),
	},
}
	
for k,v in pairs(Data_Table) do
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