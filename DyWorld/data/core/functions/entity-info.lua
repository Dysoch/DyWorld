require "data/core/functions/prefix"

Data_Entity = {
--------------------------------------- TIER 1 --------------------------------------
	["stone"] = {
		Belt = {
			Speed = 5,
			Range = 4,
			Next = "iron",
			Ingredients = {
				["stone-gear-wheel"] = 2,
				["stone-plate"] = 1,
			},
			Underground_Ingredients = {
				["stone-gear-wheel"] = 2,
				["stone-plate"] = 1,
			},
			Splitter_Ingredients = {
				["stone-gear-wheel"] = 2,
				["stone-plate"] = 1,
			},
			Loader_Ingredients = {
				["stone-gear-wheel"] = 2,
				["stone-plate"] = 1,
			},	
		},
		Assembler = {
			Speed_Mod = 0.5,
			Next = "iron",
			Ingredients = {
				["electronic-circuit"] = 2,
				["stone-plate"] = 5,
				["stone-gear-wheel"] = 4,
			},
		},
		Centrifuge = {
			Speed_Mod = 0.8,
			Next = "copper",
			Ingredients = {
				["stone-assembling-machine"] = 1,
				["stone-gear-wheel"] = 4,
				["stone-brick"] = 20,
				["iron-plate"] = 1,
			},
		},
		Drill = {
			Speed = 0.5,
			Range = 3,
			Next = "iron",
			Ingredients = {
				["simple-control-board"] = 5,
				["stone-plate"] = 10,
				["stone-gear-wheel"] = 5,
			},
		},
		Pipe = {
			Amount = 5,
			Range = 4,
			Next = "nickel",
			Ingredients = {
				["stone"] = 2,
			},
			Underground_Ingredients = {
				["stone-plate"] = 2,
			},
		},
		Speed_Module = {
			Speed_Boost = 0.1,
			Consumption_Boost = 0.65,
			Pollution_Boost = 0.1,
			Ingredients = {
				["electronic-circuit"] = 2,
				["stone-plate"] = 5,
				["stone-gear-wheel"] = 1,
			},
		},
		Effectivity_Module = {
			Consumption_Boost = -0.1,
			Pollution_Boost = 0.1,
			Ingredients = {
				["electronic-circuit"] = 2,
				["stone-plate"] = 5,
				["stone-gear-wheel"] = 1,
			},
		},
		Productivity_Module = {
			Speed_Boost = -0.4,
			Consumption_Boost = 0.5,
			Pollution_Boost = 0.25,
			Productivity_Boost = 0.02,
			Ingredients = {
				["electronic-circuit"] = 2,
				["stone-plate"] = 5,
				["stone-gear-wheel"] = 1,
			},
		},
		Pollution_1_Module = {
			Speed_Boost = -0.1,
			Pollution_Boost = -0.2,
			Ingredients = {
				["electronic-circuit"] = 2,
				["stone-plate"] = 5,
				["stone-gear-wheel"] = 1,
			},
		},
		Pollution_2_Module = {
			Consumption_Boost = 0.4,
			Pollution_Boost = 0.2,
			Ingredients = {
				["electronic-circuit"] = 2,
				["stone-plate"] = 5,
				["stone-gear-wheel"] = 1,
			},
		},
		Super_Module = {
			Speed_Boost = 0.1,
			Consumption_Boost = -0.15,
			Pollution_Boost = -0.05,
			Productivity_Boost = 0.02,
			Ingredients = {
				["basic-control-board"] = 50,
				["stone-speed-module"] = 10,
				["stone-productivity-module"] = 10,
				["stone-effectivity-module"] = 10,
				["stone-pollution-reduce-module"] = 10,
				["stone-pollution-increase-module"] = 10,
			},
		},
		Steam_Engine = {
			Next = "nickel",
			Fluid_Usage = 0.4,
			Effectivity = 0.75,
			Maximum_Temperature = 165,
			Ingredients = {
				["stone-pipe"] = 4,
				["stone"] = 50,
				["stone-gear-wheel"] = 1,
			},
		},
		Steam_Turbine = {
			Next = "iron",
			Fluid_Usage = 0.4,
			Effectivity = 0.75,
			Maximum_Temperature = 500,
			Ingredients = {
				["stone-steam-engine"] = 2,
				["stone-pipe"] = 2,
				["stone"] = 2,
				["stone-gear-wheel"] = 1,
			},
		},
		Pump = {
			Next = "copper",
			Speed = 150,
			Amount = 50,
			Ingredients = {
				["stone-plate"] = 2,
				["stone-pipe"] = 2,
				["stone"] = 2,
			},
		},
		Radar = {
			Next = "nickel",
			Active_Range = 2,
			Scan_Range = 10,
			Ingredients = {
				["simple-control-board"] = 4,
				["stone-plate"] = 5,
				["stone-brick"] = 3,
				["stone-gear-wheel"] = 1,
			},
		},
		Boiler = {
			Next = "iron",
			Max_Temp = 150,
			Effectivity = 0.9,
			Energy_Consumption_KW = 1500,
			Ingredients = {
				["stone-plate"] = 5,
				["stone-brick"] = 3,
				["stone-gear-wheel"] = 1,
			},
		},
	},
--------------------------------------- TIER 2 --------------------------------------
	["iron"] = {
		Belt = {
			Speed = 9,
			Range = 7,
			Previous = "stone",
			Next = "bronze",
			Ingredients = {
				["iron-gear-wheel"] = 4,
				["iron-plate"] = 5,
			},
			Underground_Ingredients = {
				["iron-plate"] = 5,
			},
			Splitter_Ingredients = {
				["basic-control-board"] = 1,
			},
			Loader_Ingredients = {
				["basic-control-board"] = 1,
			},
		},
		Drill = {
			Speed = 1,
			Range = 6,
			Previous = "stone",
			Next = "nickel",
			Ingredients = {
				["iron-gear-wheel"] = 5,
				["basic-control-board"] = 2,
				["rotor"] = 2,
			},
		},
		Pumpjack = {
			Speed = 1,
			Range = 3,
			--Previous = "iron",
			Next = "bronze",
			Ingredients = {
				["iron-plate"] = 10,
				["electric-mining-drill"] = 1,
				["iron-gear-wheel"] = 10,
				["stone-pipe"] = 5,
				["basic-control-board"] = 5,
			},
		},
		Assembler = {
			Speed_Mod = 1.11,
			Previous = "stone",
			Next = "tin",
			Ingredients = {
				["iron-gear-wheel"] = 4,
				["iron-plate"] = 20,
				["basic-control-board"] = 1,
			},
		},
		Furnace = {
			Speed_Mod = 1.11,
			Next = "steel",
			Ingredients = {
				["basic-control-board"] = 5,
				["iron-plate"] = 25,
				["iron-stick"] = 10,
				["copper-cable"] = 5,
				["rotor"] = 1,
			},
		},
		Wall = {
			Previous = "stone",
			Next = "iron",
			Ingredients = {
				["iron-plate"] = 10,
			},
			Gate_Ingredients = {
				["iron-wall"] = 2,
				["iron-plate"] = 10,
				["simple-control-board"] = 2,
			},
		},
		Boiler = {
			Previous = "stone",
			Next = "bronze",
			Max_Temp = 200,
			Effectivity = 1,
			Energy_Consumption_KW = 1900,
			Ingredients = {
				["basic-control-board"] = 4,
				["copper-plate"] = 1,
				["iron-plate"] = 5,
				["iron-gear-wheel"] = 1,
				["rotor"] = 1,
			},
		},
		Steam_Turbine = {
			Previous = "stone",
			Next = "lead",
			Fluid_Usage = 0.4,
			Effectivity = 1,
			Maximum_Temperature = 1000,
			Ingredients = {
				["nickel-pipe"] = 2,
				["rotor"] = 5,
				["iron-gear-wheel"] = 1,
			},
		},
	},
	["copper"] = {
		Centrifuge = {
			Speed_Mod = 1,
			Previous = "stone",
			Next = "lead",
			Ingredients = {
				["copper-plate"] = 10,
				["copper-cable"] = 15,
				["rotor"] = 5,
				["basic-control-board"] = 5,
			},
		},
		Solar = {
			Production = 90,
			Next = "silver",
			Ingredients = {
				["copper-plate"] = 10,
				["basic-control-board"] = 4,
			},
		},
		Accumulator = {
			Next = "bronze",
			--Previous = "copper",
			Buffer_MJ = 5,
			Ingredients = {
				["basic-control-board"] = 14,
				["copper-plate"] = 5,
				["iron-plate"] = 3,
				["copper-cable"] = 1,
			},
		},
		Pump = {
			Previous = "stone",
			Next = "steel",
			Speed = 150 * 2,
			Amount = 50 * 2,
			Ingredients = {
				["copper-plate"] = 2,
				["nickel-pipe"] = 2,
				["basic-control-board"] = 2,
			},
		},
	},
	["nickel"] = {
		Drill = {
			Speed = 1.5,
			Range = 7,
			Previous = "iron",
			Next = "lead",
			Ingredients = {
				["nickel-gear-wheel"] = 4,
				["nickel-plate"] = 10,
				["basic-control-board"] = 10,
				["rotor"] = 4,
			},
		},
		Steam_Engine = {
			Next = "steel",
			Previous = "stone",
			Fluid_Usage = 0.5,
			Effectivity = 0.75,
			Maximum_Temperature = 200,
			Ingredients = {
				["nickel-plate"] = 20,
				["nickel-gear-wheel"] = 5,
				["rotor"] = 5,
			},
		},
		Robot = {
			Speed = 0.05,
			Energy_Max_MJ = 1.5,
			Energy_Tick_KJ = 0.05,
			Energy_Move_KJ = 5,
			--Previous = "nickel",
			Roboport_Energy_Usage_KW = 50,
			Roboport_Charging_Energy_KW = 1000,
			Roboport_Input_MW = 5,
			Roboport_Buffer_MJ = 100,
			Roboport_Range_Logistic = 25,
			Roboport_Range_Construction = 55,
			Roboport_Slot_Count = 5,
			Roboport_Ingredients = {
				["nickel-plate"] = 50,
				["nickel-cable"] = 10,
				["nickel-gear-wheel"] = 10,
				["basic-control-board"] = 25,
			},
			Logistic_Ingredients = {
				["nickel-plate"] = 5,
				["nickel-cable"] = 1,
				["nickel-gear-wheel"] = 3,
				["basic-control-board"] = 5,
				["rotor"] = 2,
			},
			Construction_Ingredients = {
				["nickel-plate"] = 5,
				["nickel-cable"] = 3,
				["nickel-gear-wheel"] = 2,
				["basic-control-board"] = 5,
				["rotor"] = 2,
			},
		},
		Pipe = {
			Amount = 10,
			Range = 8,
			Previous = "stone",
			Next = "bronze",
			Ingredients = {
				["nickel-plate"] = 2,
			},
			Underground_Ingredients = {
				["nickel-plate"] = 10,
			},
		},
		Radar = {
			Previous = "stone",
			Next = "steel",
			Active_Range = 3,
			Scan_Range = 15,
			Ingredients = {
				["basic-control-board"] = 4,
				["nickel-plate"] = 5,
				["nickel-gear-wheel"] = 1,
			},
		},
	},
	["silver"] = {
		Solar = {
			Production = 170,
			Previous = "copper",
			Next = "gold",
			Ingredients = {
				["silver-plate"] = 10,
				["basic-control-board"] = 4,
			},
		},
		Speed_Module = {
			Speed_Boost = 0.25,
			Consumption_Boost = 0.95,
			Pollution_Boost = 0.2,
			Ingredients = {
				["electronic-circuit"] = 2,
				["silver-plate"] = 5,
				["stone-speed-module"] = 1,
			},
		},
		Effectivity_Module = {
			Consumption_Boost = -0.2,
			Pollution_Boost = 0.2,
			Ingredients = {
				["electronic-circuit"] = 2,
				["silver-plate"] = 5,
				["stone-effectivity-module"] = 1,
			},
		},
		Productivity_Module = {
			Speed_Boost = -0.6,
			Consumption_Boost = 0.6,
			Pollution_Boost = 0.35,
			Productivity_Boost = 0.05,
			Ingredients = {
				["electronic-circuit"] = 2,
				["silver-plate"] = 5,
				["stone-productivity-module"] = 1,
			},
		},
		Pollution_1_Module = {
			Speed_Boost = -0.2,
			Pollution_Boost = -0.3,
			Ingredients = {
				["electronic-circuit"] = 2,
				["silver-plate"] = 5,
				["stone-pollution-reduce-module"] = 1,
			},
		},
		Pollution_2_Module = {
			Consumption_Boost = 0.8,
			Pollution_Boost = 0.3,
			Ingredients = {
				["electronic-circuit"] = 2,
				["silver-plate"] = 5,
				["stone-pollution-increase-module"] = 1,
			},
		},
		Super_Module = {
			Speed_Boost = 0.3,
			Consumption_Boost = -0.35,
			Pollution_Boost = -0.15,
			Productivity_Boost = 0.07,
			Ingredients = {
				["electronic-control-board"] = 50,
				["silver-speed-module"] = 10,
				["silver-productivity-module"] = 10,
				["silver-effectivity-module"] = 10,
				["silver-pollution-reduce-module"] = 10,
				["silver-pollution-increase-module"] = 10,
			},
		},
	},
	["tin"] = {
		Assembler = {
			Speed_Mod = 1.21,
			Previous = "iron",
			Next = "lead",
			Ingredients = {
				["tin-gear-wheel"] = 4,
				["tin-plate"] = 20,
				["basic-control-board"] = 5,
				["rotor"] = 1,
			},
		},
		Refinery = {
			Speed_Mod = 1,
			--Previous = "neutrobaltium",
			Next = "stainless-steel",
			Ingredients = {
				["tin-assembling-machine"] = 1,
				["tin-gear-wheel"] = 4,
				["tin-plate"] = 50,
				["basic-control-board"] = 25,
			},
		},
		Chemical = {
			Speed_Mod = 1,
			--Previous = "neutrobaltium",
			Next = "invar",
			Ingredients = {
				["tin-assembling-machine"] = 1,
				["tin-gear-wheel"] = 4,
				["tin-plate"] = 25,
				["basic-control-board"] = 12,
			},
		},
	},
--------------------------------------- TIER 3 --------------------------------------
	["steel"] = {
		Belt = {
			Speed = 23,
			Range = 14,
			Previous = "bronze",
			Next = "stainless-steel",
			Ingredients = {
				["steel-gear-wheel"] = 4,
				["steel-plate"] = 5,
			},
			Underground_Ingredients = {
				["steel-plate"] = 5,
			},
			Splitter_Ingredients = {
				["electronic-control-board"] = 1,
			},
			Loader_Ingredients = {
				["electronic-control-board"] = 1,
			},
		},
		Steam_Engine = {
			Next = "cobalt",
			Previous = "nickel",
			Fluid_Usage = 0.6,
			Effectivity = 0.75,
			Maximum_Temperature = 240,
			Ingredients = {
				["steel-plate"] = 25,
				["steel-stick"] = 10,
				["steel-gear-wheel"] = 10,
				["heater"] = 5,
			},
		},
		Pump = {
			Previous = "copper",
			Next = "electrum",
			Speed = 150 * 3,
			Amount = 50 * 3,
			Ingredients = {
				["steel-plate"] = 2,
				["bronze-pipe"] = 2,
				["electronic-control-board"] = 2,
			},
		},
		Furnace = {
			Speed_Mod = 1.16,
			Previous = "iron",
			Next = "cobalt",
			Ingredients = {
				["electronic-control-board"] = 4,
				["steel-plate"] = 15,
				["heater"] = 2,
				["coil"] = 5,
			},
		},
		Radar = {
			Previous = "nickel",
			Next = "invar",
			Active_Range = 4,
			Scan_Range = 22,
			Ingredients = {
				["electronic-control-board"] = 4,
				["steel-plate"] = 5,
				["steel-gear-wheel"] = 1,
			},
		},
		Nuclear_Reactor = {
			--Previous = "steel",
			Next = "stainless-steel",
			Consumption_MW = 10,
			Max_Temperature = 1000,
			Specific_Heat_MJ = 10,
			Max_Transfer_GW = 10,
			Neighbour_Bonus = 1,
			Effectivity = 1,
			Ingredients = {
				["steel-plate"] = 250,
				["steel-stick"] = 50,
				["steel-gear-wheel"] = 50,
				["basic-control-board"] = 100,
				["glass"] = 250,
				["rotor"] = 5,
				["coil"] = 10,
				["frame"] = 10,
				["rubber"] = 50,
				["concrete"] = 250,
			},
		},
	},
	["gold"] = {
		Solar = {
			Production = 260,
			Previous = "silver",
			Next = "invar",
			Ingredients = {
				["gold-plate"] = 10,
				["electronic-control-board"] = 4,
				["frame"] = 1,
			},
		},
		Speed_Module = {
			Speed_Boost = 0.35,
			Consumption_Boost = 1.35,
			Pollution_Boost = 0.35,
			Ingredients = {
				["advanced-circuit"] = 5,
				["gold-plate"] = 5,
				["silver-speed-module"] = 1,
			},
		},
		Effectivity_Module = {
			Consumption_Boost = -0.35,
			Pollution_Boost = 0.4,
			Ingredients = {
				["advanced-circuit"] = 5,
				["gold-plate"] = 5,
				["silver-effectivity-module"] = 1,
			},
		},
		Productivity_Module = {
			Speed_Boost = -0.76,
			Consumption_Boost = 0.86,
			Pollution_Boost = 0.55,
			Productivity_Boost = 0.1,
			Ingredients = {
				["advanced-circuit"] = 5,
				["gold-plate"] = 5,
				["silver-productivity-module"] = 1,
			},
		},
		Pollution_1_Module = {
			Speed_Boost = -0.25,
			Pollution_Boost = -0.4,
			Ingredients = {
				["advanced-circuit"] = 5,
				["gold-plate"] = 5,
				["silver-pollution-reduce-module"] = 1,
			},
		},
		Pollution_2_Module = {
			Consumption_Boost = 0.68,
			Pollution_Boost = 0.4,
			Ingredients = {
				["advanced-circuit"] = 5,
				["gold-plate"] = 5,
				["silver-pollution-increase-module"] = 1,
			},
		},
		Super_Module = {
			Speed_Boost = 0.3,
			Consumption_Boost = -0.35,
			Pollution_Boost = -0.2,
			Productivity_Boost = 0.14,
			Ingredients = {
				["advanced-control-board"] = 50,
				["gold-speed-module"] = 10,
				["gold-productivity-module"] = 10,
				["gold-effectivity-module"] = 10,
				["gold-pollution-reduce-module"] = 10,
				["gold-pollution-increase-module"] = 10,
			},
		},
		Robot = {
			Speed = 0.08,
			Energy_Max_MJ = 2.5,
			Energy_Tick_KJ = 0.08,
			Energy_Move_KJ = 8,
			Previous = "nickel",
			Roboport_Energy_Usage_KW = 80,
			Roboport_Charging_Energy_KW = 2000,
			Roboport_Input_MW = 7,
			Roboport_Buffer_MJ = 200,
			Roboport_Range_Logistic = 35,
			Roboport_Range_Construction = 75,
			Roboport_Slot_Count = 6,
			Roboport_Ingredients = {
				["gold-plate"] = 50,
				["gold-cable"] = 25,
				["electronic-control-board"] = 25,
			},
			Logistic_Ingredients = {
				["gold-plate"] = 5,
				["engine-unit"] = 1,
				["frame"] = 1,
				["electronic-control-board"] = 5,
			},
			Construction_Ingredients = {
				["gold-plate"] = 5,
				["engine-unit"] = 1,
				["frame"] = 1,
				["electronic-control-board"] = 5,
			},
		},
	},
	["bronze"] = {
		Belt = {
			Speed = 15,
			Range = 10,
			Previous = "iron",
			Next = "steel",
			Ingredients = {
				["electronic-circuit"] = 1,
				["bronze-plate"] = 5,
			},
			Underground_Ingredients = {
				["bronze-plate"] = 5,
			},
			Splitter_Ingredients = {
				["electronic-control-board"] = 1,
			},
			Loader_Ingredients = {
				["electronic-control-board"] = 1,
			},
		},
		Pipe = {
			Amount = 15,
			Range = 14,
			Previous = "nickel",
			Next = "electrum",
			Ingredients = {
				["bronze-plate"] = 2,
			},
			Underground_Ingredients = {
				["bronze-plate"] = 10,
			},
		},
		Pumpjack = {
			Speed = 1.75,
			Range = 6,
			Previous = "iron",
			Next = "electrum",
			Ingredients = {
				["bronze-plate"] = 10,
				["bronze-gear-wheel"] = 10,
				["bronze-pipe"] = 5,
				["electronic-control-board"] = 3,
			},
		},
		Accumulator = {
			Previous = "copper",
			Next = "electrum",
			Buffer_MJ = 8,
			Ingredients = {
				["electronic-control-board"] = 14,
				["bronze-plate"] = 5,
				["bronze-cable"] = 1,
			},
		},
		Boiler = {
			Previous = "iron",
			Next = "arditium",
			Max_Temp = 300,
			Effectivity = 1,
			Energy_Consumption_KW = 2500,
			Ingredients = {
				["bronze-plate"] = 5,
				["bronze-gear-wheel"] = 1,
				["heater"] = 1,
			},
		},
	},
	["lead"] = {
		Drill = {
			Speed = 2.5,
			Range = 8,
			Previous = "nickel",
			Next = "cobalt",
			Ingredients = {
				["lead-gear-wheel"] = 4,
				["lead-plate"] = 10,
				["electronic-control-board"] = 5,
				["frame"] = 1,
			},
		},
		Assembler = {
			Speed_Mod = 1.29,
			Previous = "tin",
			Next = "invar",
			Ingredients = {
				["lead-gear-wheel"] = 4,
				["lead-plate"] = 20,
				["electronic-control-board"] = 1,
				["frame"] = 1,
			},
		},
		Centrifuge = {
			Speed_Mod = 1.08,
			Previous = "copper",
			Next = "cobalt",
			Ingredients = {
				["electronic-control-board"] = 5,
				["lead-plate"] = 25,
				["heater"] = 3,
				["frame"] = 1,
			},
		},
		Wall = {
			Previous = "iron",
			Next = "invar",
			Ingredients = {
				["lead-plate"] = 10,
			},
			Gate_Ingredients = {
				["lead-wall"] = 2,
				["lead-plate"] = 10,
				["basic-control-board"] = 2,
			},
		},
		Steam_Turbine = {
			Previous = "iron",
			Next = "cobalt",
			Fluid_Usage = 0.4,
			Effectivity = 1,
			Maximum_Temperature = 1500,
			Ingredients = {
				["bronze-pipe"] = 3,
				["rotor"] = 15,
				["lead-gear-wheel"] = 5,
			},
		},
	},
--------------------------------------- TIER 4 --------------------------------------
	["cobalt"] = {
		Drill = {
			Speed = 4,
			Range = 10,
			Previous = "lead",
			Next = "arditium",
			Ingredients = {
				["cobalt-gear-wheel"] = 4,
				["cobalt-plate"] = 10,
				["advanced-control-board"] = 5,
				["intake"] = 1,
			},
		},
		Centrifuge = {
			Speed_Mod = 1.2,
			Previous = "lead",
			Next = "stainless-steel",
			Ingredients = {
				["advanced-control-board"] = 5,
				["cobalt-plate"] = 25,
				["intake"] = 3,
				["housing"] = 1,
			},
		},
		Steam_Engine = {
			Next = "stainless-steel",
			Previous = "steel",
			Fluid_Usage = 0.7,
			Effectivity = 0.75,
			Maximum_Temperature = 270,
			Ingredients = {
				["cobalt-plate"] = 40,
				["cobalt-gear-wheel"] = 10,
				["intake"] = 4,
			},
		},
		Robot = {
			Speed = 0.11,
			Energy_Max_MJ = 4.5,
			Energy_Tick_KJ = 0.11,
			Energy_Move_KJ = 1,
			Previous = "gold",
			Roboport_Energy_Usage_KW = 110,
			Roboport_Charging_Energy_KW = 4000,
			Roboport_Input_MW = 14,
			Roboport_Buffer_MJ = 400,
			Roboport_Range_Logistic = 50,
			Roboport_Range_Construction = 105,
			Roboport_Slot_Count = 8,
			Roboport_Ingredients = {
				["cobalt-plate"] = 50,
				["cobalt-cable"] = 10,
				["cobalt-gear-wheel"] = 10,
				["advanced-control-board"] = 25,
			},
			Logistic_Ingredients = {
				["cobalt-plate"] = 5,
				["housing"] = 1,
				["flying-robot-frame"] = 1,
				["advanced-control-board"] = 5,
			},
			Construction_Ingredients = {
				["cobalt-plate"] = 5,
				["housing"] = 1,
				["flying-robot-frame"] = 1,
				["advanced-control-board"] = 5,
			},
		},
		Furnace = {
			Speed_Mod = 1.25,
			Previous = "steel",
			Next = "tungsten",
			Ingredients = {
				["advanced-control-board"] = 4,
				["cobalt-plate"] = 25,
				["heater"] = 5,
				["intake"] = 1,
			},
		},
		Steam_Turbine = {
			Previous = "lead",
			Next = "arditium",
			Fluid_Usage = 0.5,
			Effectivity = 1,
			Maximum_Temperature = 2000,
			Ingredients = {
				["electrum-pipe"] = 3,
				["intake"] = 5,
				["housing"] = 1,
				["cobalt-gear-wheel"] = 5,
			},
		},
	},
	["invar"] = {
		Assembler = {
			Speed_Mod = 1.33,
			Previous = "lead",
			Next = "electrum",
			Ingredients = {
				["invar-gear-wheel"] = 4,
				["invar-plate"] = 20,
				["advanced-control-board"] = 1,
				["intake"] = 1,
			},
		},
		Solar = {
			Production = 375,
			Previous = "gold",
			Next = "arditium",
			Ingredients = {
				["invar-plate"] = 10,
				["advanced-control-board"] = 4,
				["housing"] = 1,
			},
		},
		Wall = {
			Previous = "lead",
			Next = "stainless-steel",
			Ingredients = {
				["invar-plate"] = 10,
			},
			Gate_Ingredients = {
				["invar-wall"] = 2,
				["invar-plate"] = 10,
				["electronic-control-board"] = 2,
			},
		},
		Chemical = {
			Speed_Mod = 1.2,
			Previous = "tin",
			Next = "arditium-tungstenate",
			Ingredients = {
				["invar-gear-wheel"] = 4,
				["invar-plate"] = 25,
				["advanced-control-board"] = 12,
			},
		},
		Radar = {
			Previous = "steel",
			Next = "stainless-steel",
			Active_Range = 5,
			Scan_Range = 28,
			Ingredients = {
				["advanced-control-board"] = 2,
				["invar-plate"] = 25,
				["invar-gear-wheel"] = 13,
			},
		},
	},
	["electrum"] = {
		Assembler = {
			Speed_Mod = 1.39,
			Previous = "invar",
			Next = "arditium",
			Ingredients = {
				["electrum-cable"] = 4,
				["electrum-plate"] = 20,
				["advanced-control-board"] = 3,
				["housing"] = 1,
			},
		},
		Pipe = {
			Amount = 20,
			Range = 20,
			Previous = "bronze",
			Next = "arditium",
			Ingredients = {
				["electrum-plate"] = 2,
			},
			Underground_Ingredients = {
				["electrum-plate"] = 10,
			},
		},
		Pump = {
			Previous = "steel",
			Next = "stainless-steel",
			Speed = 150 * 4,
			Amount = 50 * 4,
			Ingredients = {
				["electrum-plate"] = 2,
				["electrum-pipe"] = 2,
				["advanced-control-board"] = 2,
			},
		},
		Pumpjack = {
			Speed = 3,
			Range = 9,
			Previous = "bronze",
			Next = "arditium",
			Ingredients = {
				["electrum-plate"] = 10,
				["electrum-pipe"] = 5,
				["advanced-control-board"] = 3,
			},
		},
		Accumulator = {
			Previous = "bronze",
			Next = "titanium",
			Buffer_MJ = 13,
			Ingredients = {
				["advanced-control-board"] = 14,
				["electrum-plate"] = 5,
				["electrum-cable"] = 1,
			},
		},
	},
--------------------------------------- TIER 5 --------------------------------------
	["stainless-steel"] = {
		Belt = {
			Speed = 32,
			Range = 17,
			Previous = "steel",
			Next = "titanium",
			Ingredients = {
				["stainless-steel-gear-wheel"] = 4,
				["stainless-steel-plate"] = 5,
			},
			Underground_Ingredients = {
				["stainless-steel-plate"] = 5,
			},
			Splitter_Ingredients = {
				["tough-control-board"] = 1,
				["logistic-unit"] = 1,
			},
			Loader_Ingredients = {
				["tough-control-board"] = 1,
				["logistic-unit"] = 1,
			},
		},
		Centrifuge = {
			Speed_Mod = 1.35,
			Previous = "cobalt",
			Next = "tungsten",
			Ingredients = {
				["tough-control-board"] = 5,
				["stainless-steel-plate"] = 25,
				["logistic-unit"] = 2,
				["stainless-steel-gear-wheel"] = 2,
			},
		},
		Steam_Engine = {
			Next = "titanium",
			Previous = "cobalt",
			Fluid_Usage = 0.8,
			Effectivity = 0.75,
			Maximum_Temperature = 310,
			Ingredients = {
				["stainless-steel-plate"] = 50,
				["stainless-steel-stick"] = 10,
				["tough-control-board"] = 5,
			},
		},
		Wall = {
			Previous = "invar",
			Next = "titanium",
			Ingredients = {
				["stainless-steel-plate"] = 10,
			},
			Gate_Ingredients = {
				["stainless-steel-wall"] = 2,
				["stainless-steel-plate"] = 10,
				["advanced-control-board"] = 2,
			},
		},
		Pump = {
			Previous = "electrum",
			Next = "tungsten",
			Speed = 150 * 5,
			Amount = 50 * 5,
			Ingredients = {
				["stainless-steel-plate"] = 2,
				["arditium-pipe"] = 2,
				["tough-control-board"] = 2,
			},
		},
		Refinery = {
			Speed_Mod = 1.25,
			Previous = "tin",
			Next = "arditium-tungstenate",
			Ingredients = {
				["stainless-steel-gear-wheel"] = 4,
				["stainless-steel-plate"] = 50,
				["tough-control-board"] = 25,
			},
		},
		Radar = {
			Previous = "invar",
			Next = "titanium",
			Active_Range = 6,
			Scan_Range = 37,
			Ingredients = {
				["tough-control-board"] = 4,
				["stainless-steel-plate"] = 15,
				["stainless-steel-gear-wheel"] = 3,
			},
		},
		Nuclear_Reactor = {
			Previous = "steel",
			Next = "tungsten",
			Consumption_MW = 20,
			Max_Temperature = 2000,
			Specific_Heat_MJ = 20,
			Max_Transfer_GW = 40,
			Neighbour_Bonus = 1,
			Effectivity = 1,
			Ingredients = {
				["stainless-steel-plate"] = 250,
				["stainless-steel-stick"] = 50,
				["advanced-control-board"] = 100,
				["housing"] = 10,
				["intake"] = 10,
				["concrete"] = 250,
			},
		},
	},
	["arditium"] = {
		Drill = {
			Speed = 6,
			Range = 10,
			Previous = "cobalt",
			Next = "titanium",
			Ingredients = {
				["arditium-gear-wheel"] = 6,
				["arditium-plate"] = 15,
				["tough-control-board"] = 5,
				["housing"] = 2,
				["intake"] = 1,
			},
		},
		Assembler = {
			Speed_Mod = 1.43,
			Previous = "electrum",
			Next = "tungsten",
			Ingredients = {
				["arditium-gear-wheel"] = 4,
				["arditium-plate"] = 20,
				["tough-control-board"] = 1,
				["logistic-unit"] = 1,
			},
		},
		Solar = {
			Production = 490,
			Previous = "invar",
			Next = "titanium",
			Ingredients = {
				["arditium-plate"] = 10,
				["tough-control-board"] = 4,
				["housing"] = 4,
			},
		},
		Pipe = {
			Amount = 30,
			Range = 25,
			Previous = "electrum",
			Next = "tungsten",
			Ingredients = {
				["arditium-plate"] = 2,
			},
			Underground_Ingredients = {
				["arditium-plate"] = 10,
			},
		},
		Pumpjack = {
			Speed = 5,
			Range = 12,
			Previous = "electrum",
			Next = "titanium",
			Ingredients = {
				["arditium-plate"] = 10,
				["arditium-gear-wheel"] = 4,
				["arditium-pipe"] = 5,
				["tough-control-board"] = 4,
			},
		},
		Robot = {
			Speed = 0.15,
			Energy_Max_MJ = 6,
			Energy_Tick_KJ = 0.15,
			Energy_Move_KJ = 1.5,
			Previous = "cobalt",
			Roboport_Energy_Usage_KW = 220,
			Roboport_Charging_Energy_KW = 8000,
			Roboport_Input_MW = 28,
			Roboport_Buffer_MJ = 800,
			Roboport_Range_Logistic = 60,
			Roboport_Range_Construction = 125,
			Roboport_Slot_Count = 8,
			Roboport_Ingredients = {
				["arditium-plate"] = 50,
				["arditium-gear-wheel"] = 10,
				["logistic-unit"] = 5,
				["tough-control-board"] = 25,
			},
			Logistic_Ingredients = {
				["arditium-plate"] = 5,
				["logistic-unit"] = 1,
				["tough-control-board"] = 5,
			},
			Construction_Ingredients = {
				["arditium-plate"] = 5,
				["logistic-unit"] = 1,
				["tough-control-board"] = 5,
			},
		},
		Steam_Turbine = {
			Previous = "cobalt",
			Next = "arditium-tungstenate",
			Fluid_Usage = 0.5,
			Effectivity = 1,
			Maximum_Temperature = 3000,
			Ingredients = {
				["arditium-pipe"] = 10,
				["intake"] = 15,
				["housing"] = 5,
				["arditium-gear-wheel"] = 5,
				["arditium-plate"] = 50,
			},
		},
		Boiler = {
			Previous = "bronze",
			Next = "titanium",
			Max_Temp = 400,
			Effectivity = 1,
			Energy_Consumption_KW = 2500,
			Ingredients = {
				["arditium-plate"] = 15,
				["arditium-gear-wheel"] = 1,
				["heater"] = 10,
			},
		},
	},
--------------------------------------- TIER 6 --------------------------------------
	["titanium"] = {
		Belt = {
			Speed = 42,
			Range = 21,
			Previous = "stainless-steel",
			Next = "tungsten",
			Ingredients = {
				["titanium-gear-wheel"] = 4,
				["titanium-plate"] = 5,
				["logistic-unit"] = 1,
			},
			Underground_Ingredients = {
				["titanium-plate"] = 5,
			},
			Splitter_Ingredients = {
				["processing-control-board"] = 1,
			},
			Loader_Ingredients = {
				["processing-control-board"] = 1,
			},
		},
		Drill = {
			Speed = 9,
			Range = 12,
			Previous = "arditium",
			Next = "electranium",
			Ingredients = {
				["titanium-gear-wheel"] = 10,
				["titanium-plate"] = 20,
				["processing-control-board"] = 5,
				["controller"] = 1,
			},
		},
		Solar = {
			Production = 620,
			Previous = "arditium",
			Next = "electranium",
			Ingredients = {
				["titanium-plate"] = 10,
				["processing-control-board"] = 4,
				["controller"] = 1,
			},
		},
		Steam_Engine = {
			Next = "electranium",
			Previous = "stainless-steel",
			Fluid_Usage = 0.9,
			Effectivity = 0.75,
			Maximum_Temperature = 360,
			Ingredients = {
				["titanium-plate"] = 50,
				["titanium-gear-wheel"] = 10,
				["controller"] = 1,
			},	
		},
		Wall = {
			Previous = "stainless-steel",
			Next = "arditium-tungstenate",
			Ingredients = {
				["titanium-plate"] = 10,
			},
			Gate_Ingredients = {
				["titanium-wall"] = 2,
				["titanium-plate"] = 10,
				["processing-control-board"] = 2,
			},
		},
		Pumpjack = {
			Speed = 7.5,
			Range = 16,
			Previous = "arditium",
			Next = "tungstvar",
			Ingredients = {
				["titanium-plate"] = 10,
				["titanium-gear-wheel"] = 4,
				["tungsten-pipe"] = 5,
				["processing-control-board"] = 6,
			},	
		},
		Radar = {
			Previous = "stainless-steel",
			Next = "arditium-tungstenate",
			Active_Range = 8,
			Scan_Range = 50,
			Ingredients = {
				["processing-control-board"] = 8,
				["titanium-plate"] = 5,
				["titanium-gear-wheel"] = 1,
			},
		},
		Accumulator = {
			Previous = "electrum",
			Next = "electranium",
			Buffer_MJ = 20,
			Ingredients = {
				["processing-control-board"] = 14,
				["titanium-plate"] = 5,
				["titanium-cable"] = 1,
			},
		},
		Boiler = {
			Previous = "arditium",
			Max_Temp = 500,
			Effectivity = 1,
			Energy_Consumption_KW = 2500,
			Ingredients = {
				["titanium-plate"] = 25,
				["titanium-gear-wheel"] = 5,
				["heater"] = 25,
			},
		},
	},
	["tungsten"] = {
		Belt = {
			Speed = 55,
			Range = 26,
			Previous = "titanium",
			Next = "arditium-tungstenate",
			Ingredients = {
				["tungsten-gear-wheel"] = 4,
				["tungsten-plate"] = 5,
			},
			Underground_Ingredients = {
				["tungsten-plate"] = 5,
			},
			Splitter_Ingredients = {
				["processing-control-board"] = 1,
			},
			Loader_Ingredients = {
				["processing-control-board"] = 1,
			},
		},
		Pipe = {
			Amount = 50,
			Range = 30,
			Previous = "arditium",
			Next = "electranium",
			Ingredients = {
				["tungsten-plate"] = 2,
			},
			Underground_Ingredients = {
				["tungsten-plate"] = 10,
			},
		},
		Pump = {
			Previous = "stainless-steel",
			Next = "arditium-tungstenate",
			Speed = 150 * 6,
			Amount = 50 * 6,
			Ingredients = {
				["tungsten-plate"] = 2,
				["tungsten-pipe"] = 2,
				["processing-control-board"] = 2,
			},
		},
		Assembler = {
			Speed_Mod = 1.56,
			Previous = "arditium",
			Next = "electranium",
			Ingredients = {
				["tungsten-gear-wheel"] = 4,
				["tungsten-plate"] = 20,
				["processing-control-board"] = 1,
				["controller"] = 1,
			},
		},
		Centrifuge = {
			Speed_Mod = 1.5,
			Previous = "stainless-steel",
			Next = "tungstvar",
			Ingredients = {
				["processing-control-board"] = 5,
				["tungsten-plate"] = 25,
				["tungsten-gear-wheel"] = 25,
				["controller"] = 5,
			},
		},
		Furnace = {
			Speed_Mod = 1.4,
			Previous = "cobalt",
			Next = "tungstvar",
			Ingredients = {
				["processing-control-board"] = 4,
				["tungsten-plate"] = 30,
				["heater"] = 10,
				["controller"] = 1,
			},
		},
		Nuclear_Reactor = {
			Previous = "stainless-steel",
			Next = "electranium",
			Consumption_MW = 40,
			Max_Temperature = 3000,
			Specific_Heat_MJ = 40,
			Max_Transfer_GW = 60,
			Neighbour_Bonus = 1,
			Effectivity = 1,
			Ingredients = {
				["tungsten-plate"] = 300,
				["tungsten-stick"] = 50,
				["tough-control-board"] = 100,
				["controller"] = 10,
				["concrete"] = 250,
			},
		},
	},
--------------------------------------- TIER 7 --------------------------------------
	["electranium"] = {
		Drill = {
			Speed = 12,
			Range = 15,
			Previous = "titanium",
			Next = "tungstvar",
			Ingredients = {
				["electranium-cable"] = 10,
				["electranium-plate"] = 25,
				["logic-control-board"] = 5,
			},
		},
		Pipe = {
			Amount = 80,
			Range = 40,
			Previous = "tungsten",
			Next = "tungstvar",
			Ingredients = {
				["electranium-plate"] = 2,
			},
			Underground_Ingredients = {
				["electranium-plate"] = 10,
			},
		},
		Assembler = {
			Speed_Mod = 1.54,
			Previous = "tungsten",
			Next = "neutronium",
			Ingredients = {
				["electranium-cable"] = 4,
				["electranium-plate"] = 20,
				["logic-control-board"] = 1,
			},
		},
		Solar = {
			Production = 860,
			Previous = "titanium",
			Next = "tungstvar",
			Ingredients = {
				["electranium-plate"] = 10,
				["logic-control-board"] = 8,
			},
		},
		Steam_Engine = {
			Next = "tungstvar",
			Previous = "titanium",
			Fluid_Usage = 1,
			Effectivity = 0.75,
			Maximum_Temperature = 400,
			Ingredients = {
				["electranium-plate"] = 50,
				["electranium-cable"] = 10,
				["electranium-stick"] = 10,
				["logic-control-board"] = 25,
			},	
		},
		Robot = {
			Speed = 0.25,
			Energy_Max_MJ = 12,
			Energy_Tick_KJ = 0.17,
			Energy_Move_KJ = 2,
			Previous = "arditium",
			Roboport_Energy_Usage_KW = 440,
			Roboport_Charging_Energy_KW = 16000,
			Roboport_Input_MW = 56,
			Roboport_Buffer_MJ = 1600,
			Roboport_Range_Logistic = 75,
			Roboport_Range_Construction = 150,
			Roboport_Slot_Count = 12,
			Roboport_Ingredients = {
				["electranium-plate"] = 50,
				["electranium-cable"] = 10,
				["controller"] = 5,
				["logic-control-board"] = 25,
			},
			Logistic_Ingredients = {
				["electranium-plate"] = 5,
				["controller"] = 1,
				["logic-control-board"] = 5,
			},
			Construction_Ingredients = {
				["electranium-plate"] = 5,
				["controller"] = 1,
				["logic-control-board"] = 5,
			},	
		},
		Accumulator = {
			Previous = "titanium",
			Next = "tungstvar",
			Buffer_MJ = 32,
			Ingredients = {
				["logic-control-board"] = 14,
				["electranium-plate"] = 5,
				["electranium-cable"] = 1,
			},
		},
		Nuclear_Reactor = {
			Previous = "tungsten",
			Next = "neutronium",
			Consumption_MW = 80,
			Max_Temperature = 4000,
			Specific_Heat_MJ = 80,
			Max_Transfer_GW = 80,
			Neighbour_Bonus = 1,
			Effectivity = 1,
			Ingredients = {
				["electranium-plate"] = 400,
				["electranium-stick"] = 80,
				["processing-control-board"] = 100,
				["controller"] = 25,
				["concrete"] = 250,
			},
		},
	},
	["arditium-tungstenate"] = {
		Belt = {
			Speed = 70,
			Range = 32,
			Previous = "tungsten",
			Next = "tungstvar",
			Ingredients = {
				["arditium-tungstenate-gear-wheel"] = 4,
				["arditium-tungstenate-plate"] = 5,
				["controller"] = 1,
			},
			Underground_Ingredients = {
				["arditium-tungstenate-plate"] = 5,
			},
			Splitter_Ingredients = {
				["logic-control-board"] = 1,
			},
			Loader_Ingredients = {
				["logic-control-board"] = 1,
			},
		},
		Wall = {
			Previous = "titanium",
			Next = "tungstvar",
			Ingredients = {
				["arditium-tungstenate-plate"] = 10,
			},
			Gate_Ingredients = {
				["arditium-tungstenate-wall"] = 2,
				["arditium-tungstenate-plate"] = 10,
				["logic-control-board"] = 5,
			},
		},
		Pump = {
			Previous = "tungsten",
			Next = "neutronium",
			Speed = 150 * 7,
			Amount = 50 * 7,
			Ingredients = {
				["arditium-tungstenate-plate"] = 2,
				["electranium-pipe"] = 2,
				["logic-control-board"] = 2,
			},
		},
		Refinery = {
			Speed_Mod = 1.5,
			Previous = "stainless-steel",
			Next = "neutrobaltium",
			Ingredients = {
				["arditium-tungstenate-gear-wheel"] = 4,
				["arditium-tungstenate-plate"] = 50,
				["logic-control-board"] = 25,
			},
		},
		Chemical = {
			Speed_Mod = 1.4,
			Previous = "invar",
			Next = "neutronium",
			Ingredients = {
				["arditium-tungstenate-gear-wheel"] = 4,
				["arditium-tungstenate-plate"] = 25,
				["logic-control-board"] = 12,
			},
		},
		Radar = {
			Previous = "titanium",
			Next = "neutrobaltium",
			Active_Range = 10,
			Scan_Range = 65,
			Ingredients = {
				["logic-control-board"] = 4,
				["arditium-tungstenate-plate"] = 5,
				["arditium-tungstenate-gear-wheel"] = 9,
			},
		},
		Steam_Turbine = {
			Previous = "arditium",
			Next = "neutronium",
			Fluid_Usage = 0.5,
			Effectivity = 1,
			Maximum_Temperature = 4000,
			Ingredients = {
				["electranium-pipe"] = 10,
				["rotor"] = 25,
				["controller"] = 5,
				["arditium-tungstenate-gear-wheel"] = 5,
				["arditium-tungstenate-plate"] = 50,
			},
		},
	},
--------------------------------------- TIER 8 --------------------------------------
	["tungstvar"] = {
		Belt = {
			Speed = 88,
			Range = 38,
			Previous = "arditium-tungstenate",
			Next = "neutrobaltium",
			Ingredients = {
				["arditium-tungstenate-gear-wheel"] = 8,
				["tungstvar-plate"] = 5,
			},
			Underground_Ingredients = {
				["tungstvar-plate"] = 5,
			},
			Splitter_Ingredients = {
				["super-control-board"] = 1,
			},
			Loader_Ingredients = {
				["super-control-board"] = 1,
			},
		},
		Pipe = {
			Amount = 100,
			Range = 50,
			Previous = "electranium",
			Next = "neutrobaltium",
			Ingredients = {
				["tungstvar-plate"] = 2,
			},
			Underground_Ingredients = {
				["tungstvar-plate"] = 10,
			},
		},
		Pumpjack = {
			Speed = 12,
			Range = 20,
			Previous = "titanium",
			Next = "neutrobaltium",
			Ingredients = {
				["tungstvar-plate"] = 10,
				["arditium-tungstenate-gear-wheel"] = 4,
				["tungstvar-pipe"] = 5,
				["super-control-board"] = 7,
			},	
		},
		Drill = {
			Speed = 15,
			Range = 20,
			Previous = "electranium",
			Next = "neutronium",
			Ingredients = {
				["tungstvar-stick"] = 20,
				["tungstvar-plate"] = 50,
				["super-control-board"] = 10,
			},
		},
		Centrifuge = {
			Speed_Mod = 1.8,
			Previous = "tungsten",
			Next = "neutrobaltium",
			Ingredients = {
				["super-control-board"] = 5,
				["tungstvar-plate"] = 25,
			},
		},
		Solar = {
			Production = 1175,
			Previous = "electranium",
			Next = "neutrobaltium",
			Ingredients = {
				["tungstvar-plate"] = 10,
				["super-control-board"] = 8,
			},
		},
		Steam_Engine = {
			Next = "neutronium",
			Previous = "electranium",
			Fluid_Usage = 1.1,
			Effectivity = 0.75,
			Maximum_Temperature = 430,
			Ingredients = {
				["tungstvar-plate"] = 50,
				["tungstvar-stick"] = 10,
				["housing"] = 10,
			},
		},
		Wall = {
			Previous = "arditium-tungstenate",
			Next = "neutronium",
			Ingredients = {
				["tungstvar-plate"] = 10,
			},
			Gate_Ingredients = {
				["tungstvar-wall"] = 2,
				["tungstvar-plate"] = 10,
				["super-control-board"] = 5,
			},	
		},	
		Furnace = {
			Speed_Mod = 1.6,
			Previous = "tungsten",
			Next = "neutrobaltium",
			Ingredients = {
				["super-control-board"] = 4,
				["tungstvar-plate"] = 40,
				["heater"] = 25,
			},
		},
		Accumulator = {
			Previous = "electranium",
			Next = "neutronium",
			Buffer_MJ = 48,
			Ingredients = {
				["super-control-board"] = 14,
				["tungstvar-plate"] = 5,
			},
		},
	},
--------------------------------------- TIER 9 --------------------------------------
	["neutronium"] = {
		Drill = {
			Speed = 19,
			Range = 22,
			Previous = "tungstvar",
			Next = "neutrobaltium",
			Ingredients = {
				["neutronium-stick"] = 20,
				["neutronium-plate"] = 50,
				["super-control-board"] = 25,
			},
		},
		Assembler = {
			Speed_Mod = 1.66,
			Previous = "electranium",
			Next = "neutrobaltium",
			Ingredients = {
				["neutronium-stick"] = 4,
				["neutronium-plate"] = 20,
				["extreme-control-board"] = 1,
			},
		},
		Steam_Engine = {
			Next = "neutrobaltium",
			Previous = "tungstvar",
			Fluid_Usage = 1.2,
			Effectivity = 0.75,
			Maximum_Temperature = 460,
			Ingredients = {
				["neutronium-plate"] = 50,
				["neutronium-stick"] = 10,
				["extreme-control-board"] = 15,
			},	
		},
		Wall = {
			Previous = "tungstvar",
			Next = "neutrobaltium",
			Ingredients = {
				["neutronium-plate"] = 10,
			},
			Gate_Ingredients = {
				["neutronium-wall"] = 2,
				["neutronium-plate"] = 10,
				["extreme-control-board"] = 10,
			},	
		},
		Pump = {
			Previous = "arditium-tungstenate",
			Next = "neutrobaltium",
			Speed = 150 * 9,
			Amount = 50 * 9,
			Ingredients = {
				["neutronium-plate"] = 2,
				["tungstvar-pipe"] = 2,
				["extreme-control-board"] = 2,
			},
		},
		Chemical = {
			Speed_Mod = 1.55,
			Previous = "arditium-tungstenate",
			Ingredients = {
				["neutronium-stick"] = 4,
				["neutronium-plate"] = 25,
				["extreme-control-board"] = 12,
			},
		},
		Accumulator = {
			Previous = "tungstvar",
			Buffer_MJ = 70,
			Ingredients = {
				["extreme-control-board"] = 14,
				["neutronium-plate"] = 5,
				["neutronium-stick"] = 5,
			},
		},
		Nuclear_Reactor = {
			Previous = "electranium",
			Consumption_MW = 160,
			Max_Temperature = 5000,
			Specific_Heat_MJ = 160,
			Max_Transfer_GW = 100,
			Neighbour_Bonus = 1,
			Effectivity = 1,
			Ingredients = {
				["neutronium-plate"] = 500,
				["neutronium-stick"] = 100,
				["super-control-board"] = 150,
				["controller"] = 50,
				["concrete"] = 250,
			},
		},
		Steam_Turbine = {
			Previous = "arditium-tungstenate",
			Fluid_Usage = 0.5,
			Effectivity = 1,
			Maximum_Temperature = 5000,
			Ingredients = {
				["tungstvar-pipe"] = 25,
				["super-control-board"] = 25,
				["controller"] = 15,
				["neutronium-plate"] = 50,
			},
		},
	},
--------------------------------------- TIER 10 -------------------------------------
	["neutrobaltium"] = {
		Belt = {
			Speed = 110,
			Range = 50,
			Previous = "tungstvar",
			Ingredients = {
				["neutrobaltium-gear-wheel"] = 4,
				["neutrobaltium-plate"] = 5,
			},
			Underground_Ingredients = {
				["neutrobaltium-plate"] = 25,
			},
			Splitter_Ingredients = {
				["quantum-control-board"] = 1,
			},
			Loader_Ingredients = {
				["quantum-control-board"] = 1,
			},
		},
		Robot = {
			Speed = 0.40,
			Energy_Max_MJ = 36,
			Energy_Tick_KJ = 0.19,
			Energy_Move_KJ = 1,
			Previous = "electranium",
			Roboport_Energy_Usage_KW = 880,
			Roboport_Charging_Energy_KW = 32000,
			Roboport_Input_MW = 112,
			Roboport_Buffer_MJ = 3200,
			Roboport_Range_Logistic = 130,
			Roboport_Range_Construction = 200,
			Roboport_Slot_Count = 14,
			Roboport_Ingredients = {
				["neutrobaltium-plate"] = 50,
				["neutrobaltium-cable"] = 15,
				["neutrobaltium-gear-wheel"] = 15,
				["controller"] = 10,
				["quantum-control-board"] = 25,
			},
			Logistic_Ingredients = {
				["neutrobaltium-plate"] = 10,
				["controller"] = 3,
				["quantum-control-board"] = 5,
			},
			Construction_Ingredients = {
				["neutrobaltium-plate"] = 10,
				["controller"] = 3,
				["quantum-control-board"] = 5,
			},	
		},
		Drill = {
			Speed = 25,
			Range = 25,
			Previous = "neutronium",
			Ingredients = {
				["neutrobaltium-gear-wheel"] = 20,
				["neutrobaltium-plate"] = 50,
				["quantum-control-board"] = 25,
			},
		},
		Assembler = {
			Speed_Mod = 1.8,
			Previous = "neutronium",
			Ingredients = {
				["neutrobaltium-gear-wheel"] = 4,
				["neutrobaltium-plate"] = 20,
				["quantum-control-board"] = 2,
			},
		},
		Refinery = {
			Speed_Mod = 1.8,
			Previous = "arditium-tungstenate",
			Ingredients = {
				["neutrobaltium-gear-wheel"] = 4,
				["neutrobaltium-plate"] = 50,
				["extreme-control-board"] = 25,
			},
		},
		Solar = {
			Production = 1500,
			Previous = "tungstvar",
			Ingredients = {
				["neutrobaltium-plate"] = 10,
				["quantum-control-board"] = 25,
			},
		},
		Centrifuge = {
			Speed_Mod = 2.5,
			Previous = "tungstvar",
			Ingredients = {
				["quantum-control-board"] = 5,
				["neutrobaltium-plate"] = 25,
			},
		},
		Steam_Engine = {
			Previous = "neutronium",
			Fluid_Usage = 1,
			Effectivity = 1.75,
			Maximum_Temperature = 500,
			Ingredients = {
				["neutrobaltium-plate"] = 50,
				["neutrobaltium-cable"] = 10,
				["neutrobaltium-gear-wheel"] = 10,
				["quantum-control-board"] = 25,
			},
		},
		Pipe = {
			Amount = 200,
			Range = 75,
			Previous = "tungstvar",
			Ingredients = {
				["neutrobaltium-plate"] = 2,
			},
			Underground_Ingredients = {
				["neutrobaltium-plate"] = 10,
			},
		},
		Pump = {
			Previous = "neutronium",
			Speed = 150 * 10,
			Amount = 50 * 10,
			Ingredients = {
				["neutrobaltium-plate"] = 2,
				["neutrobaltium-pipe"] = 2,
				["quantum-control-board"] = 2,
			},
		},
		Pumpjack = {
			Speed = 16,
			Range = 25,
			Previous = "tungstvar",
			Ingredients = {
				["neutrobaltium-plate"] = 10,
				["neutrobaltium-gear-wheel"] = 7,
				["neutrobaltium-pipe"] = 5,
				["quantum-control-board"] = 10,
			},	
		},
		Wall = {
			Previous = "neutronium",
			Ingredients = {
				["neutrobaltium-plate"] = 10,
			},
			Gate_Ingredients = {
				["neutrobaltium-wall"] = 2,
				["neutrobaltium-plate"] = 10,
				["quantum-control-board"] = 10,
			},
		},
		Furnace = {
			Speed_Mod = 2,
			Previous = "tungstvar",
			Ingredients = {
				["quantum-control-board"] = 5,
				["neutrobaltium-plate"] = 75,
				["heater"] = 50,
			},
		},
		Radar = {
			Previous = "arditium-tungstenate",
			Active_Range = 13,
			Scan_Range = 90,
			Ingredients = {
				["quantum-control-board"] = 20,
				["neutrobaltium-plate"] = 25,
				["neutrobaltium-gear-wheel"] = 15,
			},
		},
	},
	
}