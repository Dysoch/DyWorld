require "data/core/functions/prefix"

Data_Entity = {
	["iron"] = {
		Belt = true,
		Belt_Speed = 9,
		Belt_Range = 7,
		Belt_Next = "bronze",
	},
	["copper"] = {
		Belt = false,
	},
	["steel"] = {
		Belt = true,
		Belt_Speed = 23,
		Belt_Range = 14,
		Belt_Next = "stainless-steel",
	},
	["nickel"] = {
		Belt = false,
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
	},
	["lead"] = {
		Belt = false,
	},
	["cobalt"] = {
		Belt = false,
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
	},
	["arditium"] = {
		Belt = false,
	},
	["titanium"] = {
		Belt = true,
		Belt_Speed = 42,
		Belt_Range = 21,
		Belt_Next = "tungsten",
	},
	["tungsten"] = {
		Belt = true,
		Belt_Speed = 55,
		Belt_Range = 26,
		Belt_Next = "arditium-tungstenate",
	},
	["electranium"] = {
		Belt = false,
	},
	["arditium-tungstenate"] = {
		Belt = true,
		Belt_Speed = 70,
		Belt_Range = 32,
		Belt_Next = "tungstvar",
	},
	["tungstvar"] = {
		Belt = true,
		Belt_Speed = 88,
		Belt_Range = 38,
		Belt_Next = "neutrobaltium",
	},
	["neutronium"] = {
		Belt = false,
	},
	["neutrobaltium"] = {
		Belt = true,
		Belt_Speed = 110,
		Belt_Range = 50,
		Belt_Next = "neutrobaltium",
	},
}