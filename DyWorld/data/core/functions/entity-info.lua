require "data/core/functions/prefix"

--TODO balance recipes of belts
--@body balance the recipe's Zukii
Data_Entity = {
	["iron"] = {
		Belt = true,
		Belt_Speed = 9,
		Belt_Range = 7,
		Belt_Next = "bronze",
		Belt_Tech = "logistics",
		Belt_Ingredients = {
			["iron-gear-wheel"] = 4,
			["iron-plate"] = 5,
			["transport-belt"] = 2,
		},
		Underground_Ingredients = {
			["underground-belt"] = 2,
		},
		Splitter_Ingredients = {
			["splitter"] = 1,
		},
		Loader_Ingredients = {
			["loader"] = 1,
		},
		Drill = true,
	},
	["copper"] = {
		Belt = false,
	},
	["steel"] = {
		Belt = true,
		Belt_Speed = 23,
		Belt_Range = 14,
		Belt_Next = "stainless-steel",
		Belt_Tech = "logistics-3",
		Belt_Ingredients = {
			["steel-gear-wheel"] = 4,
			["steel-plate"] = 5,
			["bronze-transport-belt"] = 2,
		},
		Underground_Ingredients = {
			["bronze-underground-belt"] = 2,
		},
		Splitter_Ingredients = {
			["bronze-splitter"] = 1,
		},
		Loader_Ingredients = {
			["bronze-loader"] = 1,
		},
	},
	["nickel"] = {
		Belt = false,
		Drill = true,
	},
	["silver"] = {
		Belt = false,
	},
	["tin"] = {
		Belt = false,
	},
	["gold"] = {
		Belt = false,
	},
	["bronze"] = {
		Belt = true,
		Belt_Speed = 15,
		Belt_Range = 10,
		Belt_Next = "steel",
		Belt_Tech = "logistics-2",
		Belt_Ingredients = {
			["electronic-circuit"] = 1,
			["bronze-plate"] = 5,
			["iron-transport-belt"] = 2,
		},
		Underground_Ingredients = {
			["iron-underground-belt"] = 2,
		},
		Splitter_Ingredients = {
			["iron-splitter"] = 1,
		},
		Loader_Ingredients = {
			["iron-loader"] = 1,
		},
	},
	["lead"] = {
		Belt = false,
		Drill = true,
	},
	["cobalt"] = {
		Belt = false,
		Drill = true,
	},
	["invar"] = {
		Belt = false,
	},
	["electrum"] = {
		Belt = false,
	},
	["stainless-steel"] = {
		Belt = true,
		Belt_Speed = 32,
		Belt_Range = 17,
		Belt_Next = "titanium",
		Belt_Tech = "logistics-4",
		Belt_Ingredients = {
			["stainless-steel-gear-wheel"] = 4,
			["stainless-steel-plate"] = 5,
			["steel-transport-belt"] = 2,
		},
		Underground_Ingredients = {
			["steel-underground-belt"] = 2,
		},
		Splitter_Ingredients = {
			["steel-splitter"] = 1,
		},
		Loader_Ingredients = {
			["steel-loader"] = 1,
		},
	},
	["arditium"] = {
		Belt = false,
		Drill = true,
	},
	["titanium"] = {
		Belt = true,
		Belt_Speed = 42,
		Belt_Range = 21,
		Belt_Next = "tungsten",
		Belt_Tech = "logistics-5",
		Belt_Ingredients = {
			["titanium-gear-wheel"] = 4,
			["titanium-plate"] = 5,
			["advanced-circuit"] = 1,
			["stainless-steel-transport-belt"] = 2,
		},
		Underground_Ingredients = {
			["stainless-steel-underground-belt"] = 2,
		},
		Splitter_Ingredients = {
			["stainless-steel-splitter"] = 1,
		},
		Loader_Ingredients = {
			["stainless-steel-loader"] = 1,
		},
		Drill = true,
	},
	["tungsten"] = {
		Belt = true,
		Belt_Speed = 55,
		Belt_Range = 26,
		Belt_Next = "arditium-tungstenate",
		Belt_Tech = "logistics-6",
		Belt_Ingredients = {
			["tungsten-gear-wheel"] = 4,
			["tungsten-plate"] = 5,
			["titanium-transport-belt"] = 2,
		},
		Underground_Ingredients = {
			["titanium-underground-belt"] = 2,
		},
		Splitter_Ingredients = {
			["titanium-splitter"] = 1,
		},
		Loader_Ingredients = {
			["titanium-loader"] = 1,
		},
	},
	["electranium"] = {
		Belt = false,
		Drill = true,
	},
	["arditium-tungstenate"] = {
		Belt = true,
		Belt_Speed = 70,
		Belt_Range = 32,
		Belt_Next = "tungstvar",
		Belt_Tech = "logistics-7",
		Belt_Ingredients = {
			["arditium-tungstenate-gear-wheel"] = 4,
			["arditium-tungstenate-plate"] = 5,
			["tungsten-transport-belt"] = 2,
		},
		Underground_Ingredients = {
			["tungsten-underground-belt"] = 2,
		},
		Splitter_Ingredients = {
			["tungsten-splitter"] = 1,
		},
		Loader_Ingredients = {
			["tungsten-loader"] = 1,
		},
	},
	["tungstvar"] = {
		Belt = true,
		Belt_Speed = 88,
		Belt_Range = 38,
		Belt_Next = "neutrobaltium",
		Belt_Tech = "logistics-8",
		Belt_Ingredients = {
			["arditium-tungstenate-gear-wheel"] = 8,
			["tungstvar-plate"] = 5,
			["processing-unit"] = 1,
			["arditium-tungstenate-transport-belt"] = 2,
		},
		Underground_Ingredients = {
			["arditium-tungstenate-underground-belt"] = 2,
		},
		Splitter_Ingredients = {
			["arditium-tungstenate-splitter"] = 1,
		},
		Loader_Ingredients = {
			["arditium-tungstenate-loader"] = 1,
		},
		Drill = true,
	},
	["neutronium"] = {
		Belt = false,
		Drill = true,
	},
	["neutrobaltium"] = {
		Belt = true,
		Belt_Speed = 110,
		Belt_Range = 50,
		Belt_Next = "neutrobaltium",
		Belt_Tech = "logistics-9",
		Belt_Ingredients = {
			["neutrobaltium-gear-wheel"] = 4,
			["neutrobaltium-plate"] = 5,
			["tungstvar-transport-belt"] = 2,
		},
		Underground_Ingredients = {
			["tungstvar-underground-belt"] = 2,
		},
		Splitter_Ingredients = {
			["tungstvar-splitter"] = 1,
		},
		Loader_Ingredients = {
			["tungstvar-loader"] = 1,
		},
		Drill = true,
	},
}