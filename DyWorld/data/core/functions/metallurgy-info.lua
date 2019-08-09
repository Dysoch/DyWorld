require "data/core/functions/prefix"

Data_Metallurgy = {
	["iron"] = {
		Ore = true,
		Stick = true,
		Gear = true,
		Molten = true,
		Slag_Output = {
			["copper"] = 13,
			["nickel"] = 17,
			["silver"] = 11,
		},
		Melting_Point = 1538,
		Boiling_Point = 2862,
	},
	["copper"] = {
		Ore = true,
		Cable = true,
		Molten = true,
		Slag_Output = {
			["iron"] = 13,
			["tin"] = 17,
			["gold"] = 7,
		},
		Melting_Point = 1084,
		Boiling_Point = 2562,
	},
	["steel"] = {
		Stick = true,
		Molten = true,
		Slag_Output = {
			["iron"] = 23,
			["tin"] = 17,
		},
		Mixed = true,
		Mixed_Formula = {
			["iron"] = 10,
		},
		Mixed_Item = {
			["coal"] = 1,
		},
		Gear = true,
		Tech_Processing = true,
		Melting_Point = 1425,
		Boiling_Point = 2862,
	},
	["nickel"] = {
		Ore = true,
		Molten = true,
		Slag_Output = {
			["iron"] = 23,
			["silver"] = 17,
		},
		Cable = true,
		Gear = true,
		Stick = true,
		Tech_Processing = true,
		Melting_Point = 1455,
		Boiling_Point = 2730,
	},
	["silver"] = {
		Ore = true,
		Molten = true,
		Slag_Output = {
			["lead"] = 19,
			["nickel"] = 17,
		},
		Stick = true,
		Tech_Processing = true,
		Melting_Point = 961,
		Boiling_Point = 2212,
	},
	["tin"] = {
		Ore = true,
		Molten = true,
		Slag_Output = {
			["copper"] = 19,
		},
		Cable = true,
		Gear = true,
		Tech_Processing = true,
		Melting_Point = 232,
		Boiling_Point = 2600,
	},
	["gold"] = {
		Ore = true,
		Molten = true,
		Slag_Output = {
			["silver"] = 19,
			["iron"] = 19,
			["lead"] = 19,
		},
		Cable = true,
		Stick = true,
		Tech_Processing = true,
		Melting_Point = 1063,
		Boiling_Point = 2800,
	},
	["bronze"] = {
		Cable = true,
		Molten = true,
		Slag_Output = {
			["copper"] = 30,
			["tin"] = 10,
			["lead"] = 5,
		},
		Mixed = true,
		Mixed_Formula = {
			["copper"] = 12,
			["tin"] = 2,
		},
		Mixed_Item = {
			["stone"] = 3,
		},
		Stick = true,
		Gear = true,
		Melting_Point = 658,
		Boiling_Point = 2581,
	},
	["lead"] = {
		Ore = true,
		Molten = true,
		Slag_Output = {
			["silver"] = 30,
		},
		Stick = true,
		Gear = true,
		Tech_Processing = true,
		Melting_Point = 327,
		Boiling_Point = 1750,
	},
	["cobalt"] = {
		Ore = true,
		Molten = true,
		Slag_Output = {
			["silver"] = 30,
			["tin"] = 10,
		},
		Cable = true,
		Stick = true,
		Gear = true,
		Tech_Processing = true,
		Melting_Point = 1495,
		Boiling_Point = 2870,
	},
	["invar"] = {
		Cable = true,
		Molten = true,
		Slag_Output = {
			["iron"] = 30,
			["lead"] = 10,
			["nickel"] = 10,
		},
		Mixed = true,
		Mixed_Formula = {
			["iron"] = 9,
			["nickel"] = 4,
		},
		Mixed_Item = {
			["resin"] = 5,
		},
		Stick = true,
		Gear = true,
		Melting_Point = 1427,
		Boiling_Point = 100000, --N/A
	},
	["electrum"] = {
		Cable = true,
		Molten = true,
		Slag_Output = {
			["gold"] = 30,
			["silver"] = 10,
		},
		Mixed = true,
		Mixed_Formula = {
			["gold"] = 10,
			["silver"] = 4,
		},
		Mixed_Item = {
			["sand"] = 6,
		},
		Stick = true,
		Melting_Point = 100, --N/A
		Boiling_Point = 100000, --N/A
	},
	["stainless-steel"] = {
		Stick = true,
		Molten = true,
		Slag_Output = {
			["steel"] = 30,
			["lead"] = 10,
			["nickel"] = 10,
		},
		Mixed = true,
		Mixed_Formula = {
			["steel"] = 10,
			["nickel"] = 4,
		},
		Mixed_Item = {
			["coal"] = 15,
		},
		Gear = true,
		Melting_Point = 1643,
		Boiling_Point = 2766,
	},
	["arditium"] = {
		Ore = true,
		Molten = true,
		Slag_Output = {
			["gold"] = 30,
			["silver"] = 10,
		},
		Gear = true,
		Tech_Processing = true,
		Melting_Point = 754,
		Boiling_Point = 2289,
	},
	["titanium"] = {
		Ore = true,
		Molten = true,
		Slag_Output = {
			["tungsten"] = 30,
			["lead"] = 10,
		},
		Cable = true,
		Stick = true,
		Gear = true,
		Tech_Processing = true,
		Melting_Point = 1668,
		Boiling_Point = 3287,
	},
	["tungsten"] = {
		Ore = true,
		Molten = true,
		Slag_Output = {
			["titanium"] = 30,
			["lead"] = 10,
		},
		Stick = true,
		Gear = true,
		Tech_Processing = true,
		Melting_Point = 3422,
		Boiling_Point = 5555,
	},
	["electranium"] = {
		Cable = true,
		Molten = true,
		Slag_Output = {
			["electrum"] = 30,
			["arditium"] = 10,
			["lead"] = 10,
		},
		Mixed = true,
		Mixed_Formula = {
			["electrum"] = 8,
			["arditium"] = 6,
		},
		Mixed_Item = {
			["coal"] = 4,
		},
		Stick = true,
		Melting_Point = 512,
		Boiling_Point = 3078,
	},
	["arditium-tungstenate"] = {
		Stick = true,
		Molten = true,
		Slag_Output = {
			["tungsten"] = 30,
			["arditium"] = 10,
		},
		Mixed = true,
		Mixed_Formula = {
			["arditium"] = 10,
			["tungsten"] = 4,
		},
		Mixed_Item = {
			["uranium-ore"] = 6,
		},
		Gear = true,
		Melting_Point = 901,
		Boiling_Point = 7563,
	},
	["tungstvar"] = {
		Stick = true,
		Molten = true,
		Slag_Output = {
			["tungsten"] = 30,
			["invar"] = 10,
		},
		Mixed = true,
		Mixed_Formula = {
			["invar"] = 7,
			["tungsten"] = 7,
		},
		Mixed_Item = {
			["sulfur"] = 14,
		},
		Melting_Point = 2189,
		Boiling_Point = 9146,
	},
	["neutronium"] = {
		Ore = true,
		Molten = true,
		Slag_Output = {
			["copper"] = 30,
			["iron"] = 10,
			["bronze"] = 5,
		},
		Stick = true,
		Tech_Processing = true,
		Melting_Point = 4389,
		Boiling_Point = 12489,
	},
	["neutrobaltium"] = {
		Cable = true,
		Molten = true,
		Slag_Output = {
			["neutronium"] = 30,
			["tungstvar"] = 10,
			["cobalt"] = 5,
		},
		Mixed = true,
		Mixed_Formula = {
			["neutronium"] = 8,
			["tungstvar"] = 2,
			["arditium-tungstenate"] = 3,
			["cobalt"] = 4,
		},
		Mixed_Item = {
			["rocket-fuel"] = 10,
		},
		Stick = true,
		Gear = true,
		Melting_Point = 3147,
		Boiling_Point = 21896,
	},
}