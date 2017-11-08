require "data/prefix"

local Data_Table = {
	{
		Name = "copper",
		Tint = Material_Colors.Copper,
		Attack_Range = DyWorld_Material_Formulas(5, "Copper"),
		Dmg_Mod = DyWorld_Material_Formulas(8, "Copper"),
		Mag_Size = DyWorld_Material_Formulas(7, "Copper"),
		Count = Materials.Copper.Density,
	},
	{
		Name = "iron",
		Tint = Material_Colors.Iron,
		Attack_Range = DyWorld_Material_Formulas(5, "Iron"),
		Dmg_Mod = DyWorld_Material_Formulas(8, "Iron"),
		Mag_Size = DyWorld_Material_Formulas(7, "Iron"),
		Count = Materials.Iron.Density,
	},
	{
		Name = "steel",
		Tint = Material_Colors.Steel,
		Attack_Range = DyWorld_Material_Formulas(5, "Steel"),
		Dmg_Mod = DyWorld_Material_Formulas(8, "Steel"),
		Mag_Size = DyWorld_Material_Formulas(7, "Steel"),
		Count = Materials.Steel.Density,
	},
	{
		Name = "stone",
		Tint = Material_Colors.Stone,
		Attack_Range = DyWorld_Material_Formulas(5, "Stone"),
		Dmg_Mod = DyWorld_Material_Formulas(8, "Stone"),
		Mag_Size = DyWorld_Material_Formulas(7, "Stone"),
		Count = Materials.Stone.Density,
	},
	{
		Name = "wood",
		Tint = Material_Colors.Wood,
		Attack_Range = DyWorld_Material_Formulas(5, "Wood"),
		Dmg_Mod = DyWorld_Material_Formulas(8, "Wood"),
		Mag_Size = DyWorld_Material_Formulas(7, "Wood"),
		Count = Materials.Wood.Density,
	},
	{
		Name = "chromium",
		Tint = Material_Colors.Chromium,
		Attack_Range = DyWorld_Material_Formulas(5, "Chromium"),
		Dmg_Mod = DyWorld_Material_Formulas(8, "Chromium"),
		Mag_Size = DyWorld_Material_Formulas(7, "Chromium"),
		Count = Materials.Chromium.Density,
	},
	{
		Name = "tin",
		Tint = Material_Colors.Tin,
		Attack_Range = DyWorld_Material_Formulas(5, "Tin"),
		Dmg_Mod = DyWorld_Material_Formulas(8, "Tin"),
		Mag_Size = DyWorld_Material_Formulas(7, "Tin"),
		Count = Materials.Tin.Density,
	},
	{
		Name = "silver",
		Tint = Material_Colors.Silver,
		Attack_Range = DyWorld_Material_Formulas(5, "Silver"),
		Dmg_Mod = DyWorld_Material_Formulas(8, "Silver"),
		Mag_Size = DyWorld_Material_Formulas(7, "Silver"),
		Count = Materials.Silver.Density,
	},
	{
		Name = "gold",
		Tint = Material_Colors.Gold,
		Attack_Range = DyWorld_Material_Formulas(5, "Gold"),
		Dmg_Mod = DyWorld_Material_Formulas(8, "Gold"),
		Mag_Size = DyWorld_Material_Formulas(7, "Gold"),
		Count = Materials.Gold.Density,
	},
	{
		Name = "lead",
		Tint = Material_Colors.Lead,
		Attack_Range = DyWorld_Material_Formulas(5, "Lead"),
		Dmg_Mod = DyWorld_Material_Formulas(8, "Lead"),
		Mag_Size = DyWorld_Material_Formulas(7, "Lead"),
		Count = Materials.Lead.Density,
	},
}
	
for k,v in pairs(Data_Table) do
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