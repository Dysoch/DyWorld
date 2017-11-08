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
}

Material_Colors = {
	Iron = {r=0.56, g=0.57, b=0.58},
	Copper = {r=0.955, g=0.637, b=0.538},
	Steel = {r=192, g=192, b=192},
	Stainless_Steel = {r=224, g=223, b=219},
	Wood = {r=182, g=155, b=76},
	Stone = {r=139, g=141, b=122},
	Chromium = {r=0.550, g=0.556, b=0.554},
	Tin = {r=211, g=212, b=213},
	Silver = {r=0.972, g=0.96, b=0.915},
	Lead = {r=159, g=157, b=153},
	Gold = {r=1, g=0.766, b=0.336},
}

-- Material Formulas to calculate everything
function DyWorld_Material_Formulas(TYPE, TABLE, OPT)
	if TYPE == 1 then
		-- Belt Speed
		return (((Materials[TABLE].Strength_Ultimate - Materials[TABLE].Strength_Yield) / Materials[TABLE].Density) + 1)
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
		return math.floor(Materials[TABLE].Density * Materials[TABLE].Hardness)
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
	end
end

-- Material Properties (for metallurgy and other stuff)
Materials = {
	Iron = {
		Density = 7.874,
		Melting_Point = 1538,
		Boiling_Point = 2862,
		Hardness = 4,
		Elasticity = 28.5,
		Strength_Yield = 130,
		Strength_Ultimate = 200,
	},
	Copper = {
		Density = 8.94,
		Melting_Point = 1084,
		Boiling_Point = 2562,
		Hardness = 3,
		Elasticity = 17,
		Strength_Yield = 70,
		Strength_Ultimate = 220,
	},
	Steel = {
		Density = 7.8,
		Melting_Point = 1425,
		Boiling_Point = 2862,
		Hardness = 4.25,
		Elasticity = 20,
		Strength_Yield = 250,
		Strength_Ultimate = 400,
	},
	Stainless_Steel = {
		Density = 8.19,
		Melting_Point = 1510,
		Boiling_Point = 2862,
		Hardness = 7.75,
		Elasticity = 18,
		Strength_Yield = 520,
		Strength_Ultimate = 860,
	},
	Wood = {
		Density = 7.5,
		Melting_Point = nil,
		Boiling_Point = nil,
		Hardness = 2.25,
		Elasticity = 11,
		Strength_Yield = 1,
		Strength_Ultimate = 40,
	},
	Stone = {
		Density = 12.55,
		Melting_Point = 100,
		Boiling_Point = 5000,
		Hardness = 5,
		Elasticity = 1,
		Strength_Yield = 1,
		Strength_Ultimate = 15,
	},
	Chromium = {
		Density = 7.19,
		Melting_Point = 1860,
		Boiling_Point = 2670,
		Hardness = 8.5,
		Elasticity = 36,
		Strength_Yield = 160,
		Strength_Ultimate = 280,
	},
	Tin = {
		Density = 7.28,
		Melting_Point = 232,
		Boiling_Point = 2600,
		Hardness = 1.5,
		Elasticity = 47,
		Strength_Yield = 9,
		Strength_Ultimate = 19,
	},
	Silver = {
		Density = 10.49,
		Melting_Point = 961,
		Boiling_Point = 2212,
		Hardness = 2.75,
		Elasticity = 10.5,
		Strength_Yield = 55,
		Strength_Ultimate = 360,
	},
	Gold = {
		Density = 19.32,
		Melting_Point = 1063,
		Boiling_Point = 2800,
		Hardness = 2.75,
		Elasticity = 10.8,
		Strength_Yield = 190,
		Strength_Ultimate = 220,
	},
	Lead = {
		Density = 11.34,
		Melting_Point = 327,
		Boiling_Point = 1750,
		Hardness = 1.5,
		Elasticity = 2,
		Strength_Yield = 19,
		Strength_Ultimate = 32,
	},
}

function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end