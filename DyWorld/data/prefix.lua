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
	Iron = {r=255, g=192, b=203},
	Copper = {r=255, g=192, b=203},
	Steel = {r=255, g=192, b=203},
	Stainless_Steel = {r=255, g=192, b=203},
	Wood = {r=255, g=192, b=203},
	Stone = {r=255, g=192, b=203},
}

-- Material Properties (for metallurgy and other stuff)
Materials = {
	Iron = {
		Density = 7.85,
		Melting_Point = 1538,
		Boiling_Point = 2862,
		Hardness = 4,
	},
	Copper = {
		Density = 8.94,
		Melting_Point = 1084,
		Boiling_Point = 2562,
		Hardness = 3,
	},
	Steel = {
		Density = 7.85,
		Melting_Point = 1084,
		Boiling_Point = 2562,
		Hardness = 3,
	},
	Stainless_Steel = {
		Density = 8,
		Melting_Point = 1084,
		Boiling_Point = 2562,
		Hardness = 3,
	},
	Wood = {
		Density = 7.5,
		Melting_Point = 1084,
		Boiling_Point = 2562,
		Hardness = 3,
	},
	Stone = {
		Density = 2.55,
		Melting_Point = 100,
		Boiling_Point = 5000,
		Hardness = 3,
	},
}
