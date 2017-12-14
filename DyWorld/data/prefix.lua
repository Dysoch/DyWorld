dyworld_prefix = "dyworld-"
dy = "dyworld-"
dyworld_prefix_intermediate = "dyworld-intermediate-"
dyworld_debug_prefix = "dyworld-debug-"
primitive = "primitive"
basic = "basic"
intermediate = "intermediate"
enhanced = "enhanced"
advanced = "advanced"
godlike = "godlike"

-- amount of tiers for entities
-- can only be max of Color_Tier!!!!!!!!!!!!
Tiered_Entities = 9

-- graphical
dyworld_path_icon = "__DyWorld__/graphics/icons/"
dyworld_path_fluid = "__DyWorld__/graphics/fluids/"
dyworld_path_tech = "__DyWorld__/graphics/technology/"
dyworld_path_entity = "__DyWorld__/graphics/entity/"
dyworld_path_tile = "__DyWorld__/graphics/tiles/"
dyworld_path_item_group = "__DyWorld__/graphics/item-group/"
dyworld_path_icon_temp = "__DyWorld__/graphics/icons/temp.png"

-- color tiers
Color_Tier = {
	[1] = {r=128, g=0, b=128}, --purple
	[2] = {r=255, g=255, b=0}, --yellow
	[3] = {r=165, g=42, b=42}, --brown
	[4] = {r=0, g=255, b=0}, --green
	[5] = {r=0, g=0, b=255}, --blue
	[6] = {r=255, g=0, b=0}, --red
	[7] = {r=0, g=255, b=255}, --cyan
	[8] = {r=255, g=165, b=0}, --orange
	[9] = {r=255, g=192, b=203}, --pink
	["Dirty"] = {r = 165, g = 165, b = 165},
}

Material_Colors = {
	Rubber = {r=128, g=128, b=128},
	Chitin = {r=228, g=128, b=128},
	Obsidian = {r=105, g=105, b=105},
	Wood = {r=182, g=155, b=76},
	Stone = {r=139, g=141, b=122},
	
	Iron = {r=82, g=174, b=212}, -- 52aed4
	Copper = {r=212, g=119, b=82}, -- d47752
	Chromium = {r=200, g=56, b=60}, -- c8383c
	Tin = {r=39, g=105, b=135}, -- 276987
	Silver = {r=170, g=170, b=170}, -- aaaaaa
	Lead = {r=105, g=213, b=212}, -- 69d5d4
	Gold = {r=134, g=128, b=34}, -- 868022
	Tungsten = {r=87, g=87, b=87}, -- 575757
	Zinc = {r=97, g=208, b=92}, -- 61d05c
	Nickel = {r=92, g=114, b=208}, -- 5c72d0
	Aluminium = {r=150, g=150, b=150}, -- 969696
	
	Steel = {r=192, g=192, b=192},
	
	Stainless_Steel = {r=196, g=124, b=126}, -- c47c7e
	Bronze = {r=126, g=112, b=109}, -- 7e706d
	Elinvar = {r=125, g=115, b=160}, -- 7d73a0
	Billon = {r=191, g=145, b=126}, -- bf917e
	Copper_Tungsten = {r=137, g=135, b=142}, -- 89878e
	Copper_Hydride = {r=212, g=179, b=123}, -- d4b37b
	
	Stainless_Copilinvar_Tungstate = {r=153, g=124, b=143}, -- 997c8f
}

Material_Resistances = {
	Rubber = {
	  {type = "physical", decrease = 0, percent = -100},
	  {type = "impact", decrease = 0, percent = -100},
      {type = "poison", decrease = 0, percent = 25},
      {type = "explosion", decrease = 0, percent = -100},
      {type = "fire", decrease = 0, percent = 35},
      {type = "laser", decrease = 0, percent = 10},
      {type = "acid", decrease = 0, percent = -50},
      {type = "electric", decrease = 5000, percent = 100}
	},
	Chitin = {
	  {type = "physical", decrease = 1, percent = 0},
	  {type = "impact", decrease = 1, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Obsidian = {
	  {type = "physical", decrease = 10, percent = 0},
	  {type = "impact", decrease = 10, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 5, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Wood = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = -100},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Stone = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	
	Iron = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Copper = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Chromium = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Tin = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Silver = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Lead = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Gold = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Tungsten = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Zinc = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Nickel = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Aluminium = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	
	Steel = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Stainless_Steel = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Bronze = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Elinvar = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Billon = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Copper_Tungsten = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Copper_Hydride = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	
	Stainless_Copilinvar_Tungstate = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
}

-- Material Formulas to calculate everything
function DyWorld_Material_Formulas(TYPE, TABLE, OPT)
	if TYPE == 1 then
		-- Belt Speed
		return ((Materials[TABLE].Elasticity / 2) + Materials[TABLE].Density)
	elseif TYPE == 2 then
		-- Belt & Pipe Range
		return math.floor((Materials[TABLE].Strength_Ultimate / Materials[TABLE].Elasticity) + 2)
	elseif TYPE == 3 then
		-- Health
		return math.floor((Materials[TABLE].Density * Materials[TABLE].Hardness) + Materials[TABLE].Strength_Yield)
	elseif TYPE == 4 then
		-- Pipe Capacity
		return math.floor((Materials[TABLE].Density * Materials[TABLE].Hardness) * Materials[TABLE].Elasticity)
	elseif TYPE == 5 then
		-- Turret / Ammo Range
			if math.floor(((Materials[TABLE].Density * Materials[TABLE].Hardness) / 2) + 5) >= 250 then
				return 250
			else
				return math.floor(((Materials[TABLE].Density * Materials[TABLE].Hardness) / 2) + 5)
			end
	elseif TYPE == 6 then
		-- Turret Shoot Speed
		return Round((Materials[TABLE].Elasticity / Materials[TABLE].Hardness), 2)
	elseif TYPE == 7 then
		-- Turret Shoot Arc & Mag Size
		return math.floor(60 + Materials[TABLE].Elasticity)
	elseif TYPE == 8 then
		-- Ammo Damage
		return Round((Materials[TABLE].Strength_Ultimate / Materials[TABLE].Elasticity), 2)
	elseif TYPE == 9 then
		-- Inserter Speed
		return (Materials[TABLE].Hardness / Materials[TABLE].Density)
	elseif TYPE == 10 then
		-- Solar Power
		return math.floor(Materials[TABLE].Strength_Ultimate * Materials[TABLE].Conductivity)
	elseif TYPE == 11 then
		-- Pole/Relay Supply Area
		return math.ceil((Materials[TABLE].Conductivity + Materials[TABLE].Hardness) / 2)
	elseif TYPE == 12 then
		-- Pole Wire Reach
			if math.floor(Materials[TABLE].Conductivity + Materials[TABLE].Density) >= 64 then
				return 64
			else
				return math.floor(Materials[TABLE].Conductivity + Materials[TABLE].Density)
			end
	elseif TYPE == 13 then
		-- Relay Wire Reach
			if math.floor((Materials[TABLE].Conductivity + Materials[TABLE].Density) * 5) >= 64 then
				return 64
			else
				return math.floor((Materials[TABLE].Conductivity + Materials[TABLE].Density) * 5)
			end
	end
end

-- Material Properties (for metallurgy and other stuff)
Materials = {
	Stone = {
		Density = 12.55,
		Hardness = 5,
		Elasticity = 1,
		Conductivity = 0,
		Strength_Yield = 1,
		Strength_Ultimate = 15,
		Melting_Point = 100,
		Boiling_Point = 5000,
		Icon = {icon = "__base__/graphics/icons/stone.png", scale= 0.6, shift = {8, 9}}
	},
	Rubber = {
		Density = 1.2,
		Hardness = 5,
		Elasticity = 100,
		Conductivity = 0,
		Strength_Yield = 5,
		Strength_Ultimate = 35,
		Melting_Point = nil,
		Boiling_Point = nil,
		Icon = {icon = dyworld_path_icon.."rubber.png", scale= 0.6, shift = {8, 9}}
	},
	Chitin = {
		Density = 0.6,
		Hardness = 2,
		Elasticity = 51,
		Conductivity = 0,
		Strength_Yield = 7,
		Strength_Ultimate = 61,
		Melting_Point = nil,
		Boiling_Point = nil,
		Icon = {icon = dyworld_path_icon.."chitin.png", scale= 0.6, shift = {8, 9}}
	},
	Obsidian = {
		Density = 3.6,
		Hardness = 6,
		Elasticity = 13.5,
		Conductivity = 0.25,
		Strength_Yield = 300,
		Strength_Ultimate = 450,
		Melting_Point = nil,
		Boiling_Point = nil,
		Icon = {icon = dyworld_path_icon.."obsidian.png", scale= 0.6, shift = {8, 9}}
	},
	Wood = {
		Density = 7.5,
		Hardness = 2.25,
		Elasticity = 11,
		Conductivity = 1,
		Strength_Yield = 1,
		Strength_Ultimate = 40,
		Melting_Point = nil,
		Boiling_Point = nil,
		Icon = {icon = "__base__/graphics/icons/wood.png", scale= 0.6, shift = {8, 9}}
	},
	-- Basic
	Iron = {
		Density = 7.874,
		Hardness = 4,
		Elasticity = 28.5,
		Conductivity = 1.04,
		Strength_Yield = 130,
		Strength_Ultimate = 200,
		Melting_Point = 1538,
		Boiling_Point = 2862,
		Icon = {icon = dyworld_path_icon.."plate/iron.png", scale= 0.6, shift = {8, 9}}
	},
	Copper = {
		Density = 8.94,
		Hardness = 3,
		Elasticity = 17,
		Conductivity = 5.98,
		Strength_Yield = 70,
		Strength_Ultimate = 220,
		Melting_Point = 1084,
		Boiling_Point = 2562,
		Icon = {icon = dyworld_path_icon.."plate/copper.png", scale= 0.6, shift = {8, 9}}
	},
	Chromium = {
		Density = 7.19,
		Hardness = 8.5,
		Elasticity = 36,
		Conductivity = 5.1,
		Strength_Yield = 160,
		Strength_Ultimate = 280,
		Melting_Point = 1860,
		Boiling_Point = 2670,
		Icon = {icon = dyworld_path_icon.."plate/chromium.png", scale= 0.6, shift = {8, 9}}
	},
	Tin = {
		Density = 7.28,
		Hardness = 1.5,
		Elasticity = 47,
		Conductivity = 8.7,
		Strength_Yield = 9,
		Strength_Ultimate = 19,
		Melting_Point = 232,
		Boiling_Point = 2600,
		Icon = {icon = dyworld_path_icon.."plate/tin.png", scale= 0.6, shift = {8, 9}}
	},
	Silver = {
		Density = 10.49,
		Hardness = 2.75,
		Elasticity = 10.5,
		Conductivity = 6.3,
		Strength_Yield = 55,
		Strength_Ultimate = 360,
		Melting_Point = 961,
		Boiling_Point = 2212,
		Icon = {icon = dyworld_path_icon.."plate/silver.png", scale= 0.6, shift = {8, 9}}
	},
	Gold = {
		Density = 19.32,
		Hardness = 2.75,
		Elasticity = 10.8,
		Conductivity = 4.52,
		Strength_Yield = 190,
		Strength_Ultimate = 220,
		Melting_Point = 1063,
		Boiling_Point = 2800,
		Icon = {icon = dyworld_path_icon.."plate/gold.png", scale= 0.6, shift = {8, 9}}
	},
	Lead = {
		Density = 11.34,
		Hardness = 1.5,
		Elasticity = 2,
		Conductivity = 4.87,
		Strength_Yield = 19,
		Strength_Ultimate = 32,
		Melting_Point = 327,
		Boiling_Point = 1750,
		Icon = {icon = dyworld_path_icon.."plate/lead.png", scale= 0.6, shift = {8, 9}}
	},
	Tungsten = {
		Density = 19.25,
		Hardness = 7.5,
		Elasticity = 40.5,
		Conductivity = 1.82,
		Strength_Yield = 500,
		Strength_Ultimate = 1000,
		Melting_Point = 3422,
		Boiling_Point = 5000,
		Icon = {icon = dyworld_path_icon.."plate/tungsten.png", scale= 0.6, shift = {8, 9}}
	},
	Zinc = {
		Density = 7.14,
		Hardness = 2.5,
		Elasticity = 12,
		Conductivity = 11.6,
		Strength_Yield = 43,
		Strength_Ultimate = 108,
		Melting_Point = 419,
		Boiling_Point = 907,
		Icon = {icon = dyworld_path_icon.."plate/zinc.png", scale= 0.6, shift = {8, 9}}
	},
	Nickel = {
		Density = 8.91,
		Hardness = 4,
		Elasticity = 31,
		Conductivity = 9.09,
		Strength_Yield = 76,
		Strength_Ultimate = 200,
		Melting_Point = 1455,
		Boiling_Point = 2730,
		Icon = {icon = dyworld_path_icon.."plate/nickel.png", scale= 0.6, shift = {8, 9}}
	},
	Aluminium = {
		Density = 2.7,
		Hardness = 2.75,
		Elasticity = 10,
		Conductivity = 2.37,
		Strength_Yield = 26,
		Strength_Ultimate = 70,
		Melting_Point = 660,
		Boiling_Point = 2470,
		Icon = {icon = dyworld_path_icon.."plate/aluminium.png", scale= 0.6, shift = {8, 9}}
	},
	-- Simple Alloy
	Steel = {
		Density = 11.81,
		Hardness = 6,
		Elasticity = 42.75,
		Conductivity = 1.56,
		Strength_Yield = 195,
		Strength_Ultimate = 300,
		Melting_Point = 1425,
		Boiling_Point = 2862,
		Icon = {icon = "__base__/graphics/icons/steel-plate.png", scale = 0.6, shift = {8, 9}}
	},
	-- Alloy
	Stainless_Steel = {
		-- mix of steel and chromium
		Density = 19,
		Hardness = 14.5,
		Elasticity = 78.75,
		Conductivity = 6.66,
		Strength_Yield = 355,
		Strength_Ultimate = 580,
		Melting_Point = 1643,
		Boiling_Point = 2766,
		Icon = {icon = dyworld_path_icon.."alloy/stainless-steel.png", scale= 0.6, shift = {8, 9}}
	},
	Bronze = {
		-- mix of copper and tin
		Density = 16.22,
		Hardness = 4.50,
		Elasticity = 64,
		Conductivity = 14.68,
		Strength_Yield = 79,
		Strength_Ultimate = 239,
		Melting_Point = 658,
		Boiling_Point = 2581,
		Icon = {icon = dyworld_path_icon.."alloy/bronze.png", scale= 0.6, shift = {8, 9}}
	},
	Billon = {
		-- mix of copper and silver
		Density = 19.43,
		Hardness = 5.75,
		Elasticity = 27.5,
		Conductivity = 12.28,
		Strength_Yield = 125,
		Strength_Ultimate = 580,
		Melting_Point = 1023,
		Boiling_Point = 2387,
		Icon = {icon = dyworld_path_icon.."alloy/billon.png", scale= 0.6, shift = {8, 9}}
	},
	Copper_Tungsten = {
		-- mix of copper and tungsten
		Density = 28.19,
		Hardness = 10.5,
		Elasticity = 57.50,
		Conductivity = 7.8,
		Strength_Yield = 570,
		Strength_Ultimate = 1220,
		Melting_Point = 2253,
		Boiling_Point = 3781,
		Icon = {icon = dyworld_path_icon.."alloy/copper-tungsten.png", scale= 0.6, shift = {8, 9}}
	},
	Copper_Hydride = {
		-- mix of copper and hydrogen
		Density = 13.41,
		Hardness = 4.5,
		Elasticity = 25.2,
		Conductivity = 8.97,
		Strength_Yield = 105,
		Strength_Ultimate = 330,
		Melting_Point = 1626,
		Boiling_Point = 3843,
		Icon = {icon = dyworld_path_icon.."alloy/copper-hydride.png", scale= 0.6, shift = {8, 9}}
	},
	-- Compex Alloy
	Elinvar = {
		-- mix of iron, chromium and nickel
		Density = 23.97,
		Hardness = 16.5,
		Elasticity = 95.50,
		Conductivity = 15.23,
		Strength_Yield = 366,
		Strength_Ultimate = 680,
		Melting_Point = 1618,
		Boiling_Point = 2754,
		Icon = {icon = dyworld_path_icon.."alloy/elinvar.png", scale= 0.6, shift = {8, 9}}
	},
	-- Super Alloy
	Stainless_Copilinvar_Tungstate = {
		-- mix of Elinvar and Copper_Tungsten and Stainless Steel
		Density = 71.16,
		Hardness = 41.5,
		Elasticity = 231.75,
		Conductivity = 29.69,
		Strength_Yield = 1291,
		Strength_Ultimate = 2480,
		Melting_Point = 1838,
		Boiling_Point = 2750,
		Icon = {icon = dyworld_path_icon.."alloy/stainless-copilinvar-tungstate.png", scale= 0.6, shift = {8, 9}}
	},
}

function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

Material_Table = {
	-- Non Plates, aka Primitive
	{ Name = "stone", Table = "Stone", Type = "Primitive"},
	{ Name = "wood", Table = "Wood", Type = "Primitive"},
	{ Name = "obsidian", Table = "Obsidian", Type = "Primitive"},
	{ Name = "rubber", Table = "Rubber", Type = "Primitive"},
	{ Name = "chitin", Table = "Chitin", Type = "Primitive"},
	-- Normal Plates, aka Basic
	{ Name = "copper", Table = "Copper", Type = "Basic"},
	{ Name = "iron", Table = "Iron", Type = "Basic"},
	{ Name = "chromium", Table = "Chromium", Type = "Basic"},
	{ Name = "zinc", Table = "Zinc", Type = "Basic"},
	{ Name = "tin", Table = "Tin", Type = "Basic"},
	{ Name = "silver", Table = "Silver", Type = "Basic"},
	{ Name = "gold", Table = "Gold", Type = "Basic"},
	{ Name = "lead", Table = "Lead", Type = "Basic"},
	{ Name = "tungsten", Table = "Tungsten", Type = "Basic"},
	{ Name = "nickel", Table = "Nickel", Type = "Basic"},
	{ Name = "aluminium", Table = "Aluminium", Type = "Basic"},
	-- Simple_Alloy
	{ Name = "steel", Table = "Steel", Type = "Simple_Alloy"},
	-- Alloy
	{ Name = "stainless-steel", Table = "Stainless_Steel", Type = "Alloy"},
	{ Name = "billon", Table = "Billon", Type = "Alloy"},
	{ Name = "bronze", Table = "Bronze", Type = "Alloy"},
	{ Name = "copper-tungsten", Table = "Copper_Tungsten", Type = "Alloy"},
	{ Name = "copper-hydride", Table = "Copper_Hydride", Type = "Alloy"},
	-- Complex_Alloy
	{ Name = "elinvar", Table = "Elinvar", Type = "Complex_Alloy"},
	-- Super_Alloy
	{ Name = "stainless-copilinvar-tungstate", Table = "Stainless_Copilinvar_Tungstate", Type = "Super_Alloy"},
}