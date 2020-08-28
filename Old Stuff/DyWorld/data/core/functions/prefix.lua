dy = "dyworld-"
dyworld_debug_prefix = "dyworld-debug-"

-- graphical
dyworld_path_icon = "__DyWorld__/graphics/icons/"
dyworld_path_damage = "__DyWorld__/graphics/damage/"
dyworld_path_fluid = "__DyWorld__/graphics/fluids/"
dyworld_path_tech = "__DyWorld__/graphics/technology/"
dyworld_path_entity = "__DyWorld__/graphics/entity/"
dyworld_path_equipment = "__DyWorld__/graphics/equipment/"
dyworld_path_tile = "__DyWorld__/graphics/tiles/"
dyworld_path_item_group = "__DyWorld__/graphics/item-group/"
dyworld_path_icon_temp = "__DyWorld__/graphics/questionmark.png"

Order_Tiers = {
	[1] = "d",
	[2] = "e",
	[3] = "f",
	[4] = "g",
	[5] = "h",
	[6] = "i",
	[7] = "j",
	[8] = "k",
	[9] = "l",
	[10] = "m",
	["single"] = "a",
	["duo"] = "b",
	["trio"] = "c",
}

Metal_Tiers = {
	["stone"] = 1,
	["wood"] = 1,
	["silver"] = 2,
	["nickel"] = 2,
	["tin"] = 2,
	["copper"] = 2,
	["iron"] = 2,
	["coal"] = 2,
	["gold"] = 3,
	["steel"] = 3,
	["bronze"] = 3,
	["lead"] = 3,
	["cobalt"] = 4,
	["invar"] = 4,
	["electrum"] = 4,
	["uranium"] = 5,
	["stainless-steel"] = 5,
	["arditium"] = 5,
	["titanium"] = 6,
	["tungsten"] = 6,
	["electranium"] = 7,
	["arditium-tungstenate"] = 7,
	["tungstvar"] = 8,
	["neutronium"] = 9,
	["neutrobaltium"] = 10,
}

Metal_Resistances = {
	["stone"] = {
	  {type = "physical", decrease = 0, percent = 5},
	  {type = "impact", decrease = 0, percent = 10},
	},
	["wood"] = {
	  {type = "physical", decrease = 0, percent = 1},
	  {type = "fire", decrease = 0, percent = -100},
	  {type = "impact", decrease = 0, percent = 1},
	},
	["silver"] = {
	  {type = "physical", decrease = 0, percent = 4},
	},
	["nickel"] = {
	  {type = "physical", decrease = 0, percent = 4},
	},
	["tin"] = {
	  {type = "physical", decrease = 0, percent = 4},
	},
	["copper"] = {
	  {type = "physical", decrease = 0, percent = 4},
	},
	["iron"] = {
	  {type = "physical", decrease = 0, percent = 5},
	},
	["coal"] = {
	  {type = "physical", decrease = 0, percent = 6},
	},
	["gold"] = {
	  {type = "physical", decrease = 0, percent = 7},
	},
	["steel"] = {
	  {type = "physical", decrease = 0, percent = 9},
	},
	["bronze"] = {
	  {type = "physical", decrease = 0, percent = 9},
	},
	["lead"] = {
	  {type = "physical", decrease = 0, percent = 12},
	},
	["cobalt"] = {
	  {type = "physical", decrease = 0, percent = 12},
	},
	["invar"] = {
	  {type = "physical", decrease = 0, percent = 15},
	},
	["electrum"] = {
	  {type = "physical", decrease = 0, percent = 15},
	},
	["uranium"] = {
	  {type = "physical", decrease = 0, percent = 15},
	  {type = "nuclear", decrease = 0, percent = 100},
	},
	["stainless-steel"] = {
	  {type = "physical", decrease = 0, percent = 20},
	},
	["arditium"] = {
	  {type = "physical", decrease = 0, percent = 20},
	},
	["titanium"] = {
	  {type = "physical", decrease = 1, percent = 25},
	},
	["tungsten"] = {
	  {type = "physical", decrease = 1, percent = 25},
	  {type = "impact", decrease = 0, percent = 50},
	},
	["electranium"] = {
	  {type = "physical", decrease = 2, percent = 30},
	},
	["arditium-tungstenate"] = {
	  {type = "physical", decrease = 2, percent = 30},
	  {type = "impact", decrease = 0, percent = 50},
	},
	["tungstvar"] = {
	  {type = "physical", decrease = 3, percent = 35},
	  {type = "impact", decrease = 0, percent = 50},
	},
	["neutronium"] = {
	  {type = "physical", decrease = 7, percent = 40},
	  {type = "impact", decrease = 0, percent = 30},
	},
	["neutrobaltium"] = {
	  {type = "physical", decrease = 10, percent = 50},
	  {type = "impact", decrease = 0, percent = 50},
	},
}

Damage_Mod = {
	["water"] = 0.25,
	["earth"] = 0.5,
	["electric"] = 0.75,
	["chemical"] = 1,
	["poison"] = 1.5,
	["fire"] = 2,
	["physical"] = 3,
	["impact"] = 4.5,
	["explosion"] = 6,
	["sonic"] = 8,
	["fusion"] = 10,
	["laser"] = 13,
	["lightning"] = 17,
	["acid"] = 21,
	["plasma"] = 26,
	["gas"] = 30,
	["fungal"] = 35,
	["lava"] = 40,
	["fission"] = 45,
	["ice"] = 50,
	["nuclear"] = 50,
}

Range_Mod = {
	["water"] = 0.75,
	["earth"] = 0.85,
	["electric"] = 1,
	["chemical"] = 1,
	["poison"] = 1.15,
	["fire"] = 1.2,
	["physical"] = 1.5,
	["impact"] = 1.8,
	["explosion"] = 2.2,
	["sonic"] = 2.5,
	["fusion"] = 2.9,
	["laser"] = 3.2,
	["lightning"] = 3.4,
	["acid"] = 3.7,
	["plasma"] = 3.8,
	["gas"] = 4.1,
	["fungal"] = 4.4,
	["lava"] = 4.6,
	["fission"] = 4.7,
	["ice"] = 5,
	["nuclear"] = 5,
}

Enemy_Names_Scales = {
	["small"] = 0.5,
	["medium"] = 0.7,
	["big"] = 1,
	["huge"] = 1.2,
	["behemoth"] = 1.5,
}