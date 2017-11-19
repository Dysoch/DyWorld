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
	Rubber = {r=128, g=128, b=128},
	Obsidian = {r=105, g=105, b=105},
	Tungsten = {r=105, g=105, b=105},
	Cadmium = {r=105, g=105, b=105},
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
		return math.floor(((Materials[TABLE].Density * Materials[TABLE].Hardness) / 2) + 5)
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
		return math.floor(Materials[TABLE].Conductivity + Materials[TABLE].Hardness)
	elseif TYPE == 12 then
		-- Pole/Relay Wire Reach
		return math.floor(Materials[TABLE].Conductivity + Materials[TABLE].Density)
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
	},
	Wood = {
		Density = 7.5,
		Hardness = 2.25,
		Elasticity = 11,
		Conductivity = 0,
		Strength_Yield = 1,
		Strength_Ultimate = 40,
		Melting_Point = nil,
		Boiling_Point = nil,
	},
	Iron = {
		Density = 7.874,
		Hardness = 4,
		Elasticity = 28.5,
		Conductivity = 1.04,
		Strength_Yield = 130,
		Strength_Ultimate = 200,
		Melting_Point = 1538,
		Boiling_Point = 2862,
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
	},
	Cadmium = {
		Density = 8.65,
		Hardness = 2,
		Elasticity = 4.6,
		Conductivity = 1.46,
		Strength_Yield = 25,
		Strength_Ultimate = 78,
		Melting_Point = 321,
		Boiling_Point = 767,
	},
	Steel = {
		Density = 7.8,
		Hardness = 4.25,
		Elasticity = 20,
		Conductivity = 6.21,
		Strength_Yield = 250,
		Strength_Ultimate = 400,
		Melting_Point = 1425,
		Boiling_Point = 2862,
	},
	Stainless_Steel = {
		-- mix of steel and chromium
		Density = 14.99,
		Hardness = 12.75,
		Elasticity = 56,
		Conductivity = 11.31,
		Strength_Yield = 410,
		Strength_Ultimate = 680,
		Melting_Point = 1643,
		Boiling_Point = 2766,
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
	},
}

function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

Material_Table = {
	-- Normal Plates
	{ Name = "stone", Table = "Stone", Type = "Primitive"},
	{ Name = "wood", Table = "Wood", Type = "Primitive"},
	{ Name = "obsidian", Table = "Obsidian", Type = "Primitive"},
	{ Name = "rubber", Table = "Rubber", Type = "Primitive"},
	{ Name = "copper", Table = "Copper", Type = "Basic"},
	{ Name = "iron", Table = "Iron", Type = "Basic"},
	{ Name = "chromium", Table = "Chromium", Type = "Basic"},
	{ Name = "cadmium", Table = "Cadmium", Type = "Basic"},
	{ Name = "tin", Table = "Tin", Type = "Basic"},
	{ Name = "silver", Table = "Silver", Type = "Basic"},
	{ Name = "gold", Table = "Gold", Type = "Basic"},
	{ Name = "lead", Table = "Lead", Type = "Basic"},
	{ Name = "tungsten", Table = "Tungsten", Type = "Basic"},
	{ Name = "steel", Table = "Steel", Type = "Alloy"},
	-- Alloys
	--{ Name = "stainless-steel", Table = "Stainless_Steel"},
	--{ Name = "bronze", Table = "Bronze"},
}