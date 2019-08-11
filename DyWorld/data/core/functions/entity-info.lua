require "data/core/functions/prefix"

Data_Entity = {
--------------------------------------- TIER 1 --------------------------------------
	["stone"] = {
		Belt = {
			Belt_Speed = 5,
			Belt_Range = 4,
			Belt_Next = "iron",
			Belt_Ingredients = {
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
			Assembler_Speed_Mod = 0.5,
			Assembler_Next = "iron",
			Assembler_Ingredients = {
				["electronic-circuit"] = 2,
				["stone-plate"] = 5,
				["stone-gear-wheel"] = 4,
			},
		},
		Centrifuge = {
			Centrifuge_Speed_Mod = 0.8,
			Centrifuge_Next = "copper",
			Centrifuge_Ingredients = {
				["stone-assembling-machine"] = 1,
				["stone-gear-wheel"] = 4,
				["stone-brick"] = 4,
				["iron-plate"] = 1,
			},
		},
		Drill = {
			Drill_Speed = 0.5,
			Drill_Range = 3,
			Drill_Next = "iron",
			Drill_Ingredients = {
				["electronic-circuit"] = 2,
				["stone-plate"] = 8,
				["stone-gear-wheel"] = 5,
			},
		},
		Pipe = {
			Pipe_Amount = 5,
			Pipe_Range = 4,
			Pipe_Next = "nickel",
			Pipe_Ingredients = {
				["stone"] = 2,
			},
			Pipe_Underground_Ingredients = {
				["stone-plate"] = 2,
			},
		},
		Speed_Module = {
			Speed_Module_Speed_Boost = 0.1,
			Speed_Module_Consumption_Boost = 0.65,
			Speed_Module_Pollution_Boost = 0.1,
			Speed_Module_Ingredients = {
				["electronic-circuit"] = 2,
				["stone-plate"] = 5,
				["stone-gear-wheel"] = 1,
			},
		},
		Effectivity_Module = {
			Effectivity_Module_Consumption_Boost = -0.1,
			Effectivity_Module_Pollution_Boost = 0.1,
			Effectivity_Module_Ingredients = {
				["electronic-circuit"] = 2,
				["stone-plate"] = 5,
				["stone-gear-wheel"] = 1,
			},
		},
		Productivity_Module = {
			Productivity_Module_Speed_Boost = -0.4,
			Productivity_Module_Consumption_Boost = 0.5,
			Productivity_Module_Pollution_Boost = 0.25,
			Productivity_Module_Productivity_Boost = 0.02,
			Productivity_Module_Ingredients = {
				["electronic-circuit"] = 2,
				["stone-plate"] = 5,
				["stone-gear-wheel"] = 1,
			},
		},
		Pollution_1_Module = {
			Pollution_1_Module_Speed_Boost = -0.1,
			Pollution_1_Module_Pollution_Boost = -0.2,
			Pollution_1_Module_Ingredients = {
				["electronic-circuit"] = 2,
				["stone-plate"] = 5,
				["stone-gear-wheel"] = 1,
			},
		},
		Pollution_2_Module = {
			Pollution_2_Module_Consumption_Boost = 0.4,
			Pollution_2_Module_Pollution_Boost = 0.2,
			Pollution_2_Module_Ingredients = {
				["electronic-circuit"] = 2,
				["stone-plate"] = 5,
				["stone-gear-wheel"] = 1,
			},
		},
		Super_Module = {
			Super_Module_Speed_Boost = 0.1,
			Super_Module_Consumption_Boost = -0.15,
			Super_Module_Pollution_Boost = -0.05,
			Super_Module_Productivity_Boost = 0.02,
			Super_Module_Ingredients = {
				["advanced-circuit"] = 5,
				["stone-speed-module"] = 10,
				["stone-productivity-module"] = 10,
				["stone-effectivity-module"] = 10,
				["stone-pollution-reduce-module"] = 10,
				["stone-pollution-increase-module"] = 10,
			},
		},
		Steam_Engine = {
			Steam_Engine_Next = "nickel",
			Steam_Engine_Fluid_Usage = 0.4,
			Steam_Engine_Effectivity = 0.75,
			Steam_Engine_Maximum_Temperature = 165,
			Steam_Engine_Ingredients = {
				["stone-pipe"] = 4,
				["stone"] = 50,
				["stone-gear-wheel"] = 1,
			},
		},
		Steam_Turbine = {
			Steam_Turbine_Next = "stone",
			Steam_Turbine_Fluid_Usage = 0.4,
			Steam_Turbine_Effectivity = 0.75,
			Steam_Turbine_Maximum_Temperature = 500,
			Steam_Turbine_Ingredients = {
				["stone-steam-engine"] = 2,
				["stone-pipe"] = 2,
				["stone"] = 2,
				["stone-gear-wheel"] = 1,
			},
		},
		Pump = {
			Pump_Next = "copper",
			Pump_Speed = 150,
			Pump_Amount = 50,
			Pump_Ingredients = {
				["stone-plate"] = 2,
				["stone-pipe"] = 2,
				["stone"] = 2,
			},
		},
		Radar = {
			Radar_Next = "stone",
			Radar_Active_Range = 2,
			Radar_Scan_Range = 10,
			Radar_Ingredients = {
				["electronic-circuit"] = 4,
				["stone-plate"] = 5,
				["stone-brick"] = 3,
				["stone-gear-wheel"] = 1,
			},
		},
		Boiler = {
			Boiler_Next = "iron",
			Boiler_Max_Temp = 150,
			Boiler_Effectivity = 0.9,
			Boiler_Energy_Consumption_KW = 1500,
			Boiler_Ingredients = {
				["stone-plate"] = 5,
				["stone-brick"] = 3,
				["stone-gear-wheel"] = 1,
			},
		},
	},
--------------------------------------- TIER 2 --------------------------------------
	["iron"] = {
		Belt = {
			Belt_Speed = 9,
			Belt_Range = 7,
			Belt_Previous = "stone",
			Belt_Next = "bronze",
			Belt_Ingredients = {
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
			Drill_Speed = 1,
			Drill_Range = 6,
			Drill_Next = "nickel",
			Drill_Ingredients = {
				["electric-mining-drill"] = 1,
				["iron-gear-wheel"] = 4,
				["transport-belt"] = 2,
			},
		},
		Pumpjack = {
			Pumpjack_Speed = 1,
			Pumpjack_Range = 3,
			--Pumpjack_Previous = "iron",
			Pumpjack_Next = "bronze",
			Pumpjack_Ingredients = {
				["electric-mining-drill"] = 1,
				["iron-gear-wheel"] = 4,
				["transport-belt"] = 2,
				["basic-control-board"] = 3,
			},
		},
		Assembler = {
			Assembler_Speed_Mod = 1.11,
			Assembler_Next = "tin",
			Assembler_Ingredients = {
				["stone-assembling-machine"] = 1,
				["iron-gear-wheel"] = 4,
			},
		},
		Furnace = {
			Furnace_Speed_Mod = 1.11,
			Furnace_Next = "iron",
			Furnace_Ingredients = {
				["assembling-machine-1"] = 1,
				["iron-gear-wheel"] = 4,
			},
		},
		Wall = {
			Wall_Previous = "stone",
			Wall_Next = "iron",
			Wall_Ingredients = {
				["iron-plate"] = 10,
			},
			Gate_Ingredients = {
				["iron-wall"] = 2,
				["iron-plate"] = 10,
			},
		},
		Boiler = {
			Boiler_Next = "iron",
			Boiler_Previous = "stone",
			Boiler_Max_Temp = 165,
			Boiler_Effectivity = 1,
			Boiler_Energy_Consumption_KW = 1900,
			Boiler_Ingredients = {
				["electronic-circuit"] = 4,
				["copper-plate"] = 1,
				["iron-plate"] = 5,
				["iron-gear-wheel"] = 1,
			},
		},
	},
	["copper"] = {
		Centrifuge = {
			Centrifuge_Speed_Mod = 1,
			Centrifuge_Next = "lead",
			Centrifuge_Ingredients = {
				["stone-centrifuge"] = 1,
				["copper-plate"] = 10,
			},
		},
		Solar = {
			Solar_Production = 90,
			Solar_Next = "silver",
			Solar_Ingredients = {
				["copper-plate"] = 4,
			},
		},
		Radar = {
			Radar_Next = "copper",
			Radar_Previous = "stone",
			Radar_Active_Range = 3,
			Radar_Scan_Range = 15,
			Radar_Ingredients = {
				["electronic-circuit"] = 14,
				["copper-plate"] = 5,
				["iron-plate"] = 3,
				["copper-cable"] = 1,
			},
		},
		Accumulator = {
			Accumulator_Next = "copper",
			--Accumulator_Previous = "stone",
			Accumulator_Buffer_MJ = 5,
			Accumulator_Ingredients = {
				["electronic-circuit"] = 14,
				["copper-plate"] = 5,
				["iron-plate"] = 3,
				["copper-cable"] = 1,
			},
		},
		Pump = {
			Pump_Previous = "stone",
			Pump_Next = "steel",
			Pump_Speed = 150 * 2,
			Pump_Amount = 50 * 2,
			Pump_Ingredients = {
				["copper-plate"] = 2,
				["nickel-pipe"] = 2,
				["basic-control-board"] = 2,
			},
		},
	},
	["nickel"] = {
		Drill = {
			Drill_Speed = 1.5,
			Drill_Range = 7,
			Drill_Next = "lead",
			Drill_Ingredients = {
				["iron-gear-wheel"] = 4,
				["transport-belt"] = 2,
				["iron-electric-mining-drill"] = 1,
			},
		},
		Steam_Engine = {
			Steam_Engine_Next = "steel",
			Steam_Engine_Previous = "stone",
			Steam_Engine_Fluid_Usage = 0.5,
			Steam_Engine_Effectivity = 0.75,
			Steam_Engine_Maximum_Temperature = 165,
			Steam_Engine_Ingredients = {
				["nickel-plate"] = 50,
				["nickel-cable"] = 10,
				["nickel-gear-wheel"] = 10,
				["electronic-circuit"] = 5,
			},
		},
		Robot = {
			Robot_Speed = 0.05,
			Robot_Energy_Max_MJ = 1.5,
			Robot_Energy_Tick_KJ = 0.05,
			Robot_Energy_Move_KJ = 5,
			--Robot_Previous = "nickel",
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
			Logistic_Robot_Ingredients = {
				["nickel-plate"] = 3,
				["nickel-cable"] = 1,
				["nickel-gear-wheel"] = 3,
				["basic-control-board"] = 5,
			},
			Construction_Robot_Ingredients = {
				["nickel-plate"] = 5,
				["nickel-cable"] = 3,
				["nickel-gear-wheel"] = 2,
				["basic-control-board"] = 5,
			},
		},
		Pipe = {
			Pipe_Amount = 10,
			Pipe_Range = 8,
			Pipe_Previous = "stone",
			Pipe_Next = "bronze",
			Pipe_Ingredients = {
				["nickel-plate"] = 2,
			},
			Pipe_Underground_Ingredients = {
				["nickel-plate"] = 10,
			},
		},
	},
	["silver"] = {
		Solar = {
			Solar_Production = 140,
			Solar_Next = "gold",
			Solar_Ingredients = {
				["silver-plate"] = 4,
			},
		},
		Speed_Module = {
			Speed_Module_Speed_Boost = 0.25,
			Speed_Module_Consumption_Boost = 0.95,
			Speed_Module_Pollution_Boost = 0.2,
			Speed_Module_Ingredients = {
				["electronic-circuit"] = 2,
				["silver-plate"] = 5,
				["stone-speed-module"] = 1,
			},
		},
		Effectivity_Module = {
			Effectivity_Module_Consumption_Boost = -0.2,
			Effectivity_Module_Pollution_Boost = 0.2,
			Effectivity_Module_Ingredients = {
				["electronic-circuit"] = 2,
				["silver-plate"] = 5,
				["stone-effectivity-module"] = 1,
			},
		},
		Productivity_Module = {
			Productivity_Module_Speed_Boost = -0.6,
			Productivity_Module_Consumption_Boost = 0.6,
			Productivity_Module_Pollution_Boost = 0.35,
			Productivity_Module_Productivity_Boost = 0.05,
			Productivity_Module_Ingredients = {
				["electronic-circuit"] = 2,
				["silver-plate"] = 5,
				["stone-productivity-module"] = 1,
			},
		},
		Pollution_1_Module = {
			Pollution_1_Module_Speed_Boost = -0.2,
			Pollution_1_Module_Pollution_Boost = -0.3,
			Pollution_1_Module_Ingredients = {
				["electronic-circuit"] = 2,
				["silver-plate"] = 5,
				["stone-pollution-reduce-module"] = 1,
			},
		},
		Pollution_2_Module = {
			Pollution_2_Module_Consumption_Boost = 0.8,
			Pollution_2_Module_Pollution_Boost = 0.3,
			Pollution_2_Module_Ingredients = {
				["electronic-circuit"] = 2,
				["silver-plate"] = 5,
				["stone-pollution-increase-module"] = 1,
			},
		},
		Super_Module = {
			Super_Module_Speed_Boost = 0.3,
			Super_Module_Consumption_Boost = -0.35,
			Super_Module_Pollution_Boost = -0.15,
			Super_Module_Productivity_Boost = 0.07,
			Super_Module_Ingredients = {
				["advanced-circuit"] = 5,
				["silver-speed-module"] = 2,
				["silver-productivity-module"] = 2,
				["silver-effectivity-module"] = 2,
				["silver-pollution-reduce-module"] = 2,
				["silver-pollution-increase-module"] = 2,
			},
		},
	},
	["tin"] = {
		Assembler = {
			Assembler_Speed_Mod = 1.21,
			Assembler_Next = "lead",
			Assembler_Ingredients = {
				["iron-assembling-machine"] = 1,
				["tin-gear-wheel"] = 4,
			},
		},
		Nuclear_Reactor = {
			--Nuclear_Reactor_Previous = "tin",
			Nuclear_Reactor_Next = "tin",
			Nuclear_Reactor_Consumption_MW = 40,
			Nuclear_Reactor_Max_Temperature = 1000,
			Nuclear_Reactor_Specific_Heat_MJ = 10,
			Nuclear_Reactor_Max_Transfer_GW = 10,
			Nuclear_Reactor_Neighbour_Bonus = 1,
			Nuclear_Reactor_Effectivity = 1,
			Nuclear_Reactor_Ingredients = {
				["iron-assembling-machine"] = 1,
				["tin-gear-wheel"] = 4,
			},
		},
		Refinery = {
			Refinery_Speed_Mod = 1.8,
			Refinery_Next = "neutrobaltium",
			Refinery_Ingredients = {
				["tin-assembling-machine"] = 1,
				["tin-gear-wheel"] = 4,
			},
		},
		Chemical = {
			Chemical_Speed_Mod = 1.8,
			Chemical_Next = "neutrobaltium",
			Chemical_Ingredients = {
				["tin-assembling-machine"] = 1,
				["tin-gear-wheel"] = 4,
			},
		},
	},
--------------------------------------- TIER 3 --------------------------------------
	["steel"] = {
		Belt = {
			Belt_Speed = 23,
			Belt_Range = 14,
			Belt_Previous = "bronze",
			Belt_Next = "stainless-steel",
			Belt_Ingredients = {
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
			Steam_Engine_Next = "cobalt",
			Steam_Engine_Previous = "nickel",
			Steam_Engine_Fluid_Usage = 0.6,
			Steam_Engine_Effectivity = 0.75,
			Steam_Engine_Maximum_Temperature = 165,
			Steam_Engine_Ingredients = {
				["steel-plate"] = 50,
				["steel-stick"] = 10,
				["steel-gear-wheel"] = 10,
				["electronic-circuit"] = 5,
			},
		},
		Pump = {
			Pump_Previous = "copper",
			Pump_Next = "electrum",
			Pump_Speed = 150 * 3,
			Pump_Amount = 50 * 3,
			Pump_Ingredients = {
				["steel-plate"] = 2,
				["bronze-pipe"] = 2,
				["electronic-control-board"] = 2,
			},
		},
	},
	["gold"] = {
		Solar = {
			Solar_Production = 165,
			Solar_Next = "invar",
			Solar_Ingredients = {
				["gold-plate"] = 4,
			},
		},
		Speed_Module = {
			Speed_Module_Speed_Boost = 0.35,
			Speed_Module_Consumption_Boost = 1.35,
			Speed_Module_Pollution_Boost = 0.35,
			Speed_Module_Ingredients = {
				["advanced-circuit"] = 5,
				["gold-plate"] = 5,
				["silver-speed-module"] = 1,
			},
		},
		Effectivity_Module = {
			Effectivity_Module_Consumption_Boost = -0.35,
			Effectivity_Module_Pollution_Boost = 0.4,
			Effectivity_Module_Ingredients = {
				["advanced-circuit"] = 5,
				["gold-plate"] = 5,
				["silver-effectivity-module"] = 1,
			},
		},
		Productivity_Module = {
			Productivity_Module_Speed_Boost = -0.76,
			Productivity_Module_Consumption_Boost = 0.86,
			Productivity_Module_Pollution_Boost = 0.55,
			Productivity_Module_Productivity_Boost = 0.1,
			Productivity_Module_Ingredients = {
				["advanced-circuit"] = 5,
				["gold-plate"] = 5,
				["silver-productivity-module"] = 1,
			},
		},
		Pollution_1_Module = {
			Pollution_1_Module_Speed_Boost = -0.25,
			Pollution_1_Module_Pollution_Boost = -0.4,
			Pollution_1_Module_Ingredients = {
				["advanced-circuit"] = 5,
				["gold-plate"] = 5,
				["silver-pollution-reduce-module"] = 1,
			},
		},
		Pollution_2_Module = {
			Pollution_2_Module_Consumption_Boost = 0.68,
			Pollution_2_Module_Pollution_Boost = 0.4,
			Pollution_2_Module_Ingredients = {
				["advanced-circuit"] = 5,
				["gold-plate"] = 5,
				["silver-pollution-increase-module"] = 1,
			},
		},
		Super_Module = {
			Super_Module_Speed_Boost = 0.3,
			Super_Module_Consumption_Boost = -0.35,
			Super_Module_Pollution_Boost = -0.2,
			Super_Module_Productivity_Boost = 0.14,
			Super_Module_Ingredients = {
				["advanced-circuit"] = 15,
				["gold-speed-module"] = 2,
				["gold-productivity-module"] = 2,
				["gold-effectivity-module"] = 2,
				["gold-pollution-reduce-module"] = 2,
				["gold-pollution-increase-module"] = 2,
			},
		},
		Robot = {
			Robot_Speed = 0.08,
			Robot_Energy_Max_MJ = 2.5,
			Robot_Energy_Tick_KJ = 0.08,
			Robot_Energy_Move_KJ = 8,
			Robot_Previous = "nickel",
			Roboport_Energy_Usage_KW = 80,
			Roboport_Charging_Energy_KW = 2000,
			Roboport_Input_MW = 7,
			Roboport_Buffer_MJ = 200,
			Roboport_Range_Logistic = 35,
			Roboport_Range_Construction = 75,
			Roboport_Slot_Count = 6,
			Roboport_Ingredients = {
				["gold-plate"] = 50,
				["electronic-control-board"] = 25,
			},
			Logistic_Robot_Ingredients = {
				["gold-plate"] = 3,
				["flying-robot-frame"] = 1,
				["electronic-control-board"] = 5,
			},
			Construction_Robot_Ingredients = {
				["gold-plate"] = 5,
				["flying-robot-frame"] = 1,
				["electronic-control-board"] = 5,
			},
		},
	},
	["bronze"] = {
		Belt = {
			Belt_Speed = 15,
			Belt_Range = 10,
			Belt_Previous = "iron",
			Belt_Next = "steel",
			Belt_Ingredients = {
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
			Pipe_Amount = 15,
			Pipe_Range = 14,
			Pipe_Previous = "nickel",
			Pipe_Next = "electrum",
			Pipe_Ingredients = {
				["bronze-plate"] = 2,
			},
			Pipe_Underground_Ingredients = {
				["bronze-plate"] = 10,
			},
		},
		Pumpjack = {
			Pumpjack_Speed = 1.75,
			Pumpjack_Range = 6,
			Pumpjack_Previous = "iron",
			Pumpjack_Next = "electrum",
			Pumpjack_Ingredients = {
				["bronze-gear-wheel"] = 4,
				["bronze-pipe"] = 2,
				["electronic-control-board"] = 3,
			},
		},
	},
	["lead"] = {
		Drill = {
			Drill_Speed = 2.5,
			Drill_Range = 8,
			Drill_Next = "cobalt",
			Drill_Ingredients = {
				["iron-gear-wheel"] = 4,
				["transport-belt"] = 2,
				["nickel-electric-mining-drill"] = 1,
			},
		},
		Assembler = {
			Assembler_Speed_Mod = 1.29,
			Assembler_Next = "invar",
			Assembler_Ingredients = {
				["tin-assembling-machine"] = 1,
				["iron-gear-wheel"] = 4,
			},
		},
		Centrifuge = {
			Centrifuge_Speed_Mod = 1.08,
			Centrifuge_Next = "cobalt",
			Centrifuge_Ingredients = {
				["copper-centrifuge"] = 1,
				["stone-gear-wheel"] = 4,
				["stone-brick"] = 4,
				["iron-plate"] = 1,
			},
		},
		Wall = {
			Wall_Previous = "iron",
			Wall_Next = "invar",
			Wall_Ingredients = {
				["lead-plate"] = 10,
			},
			Gate_Ingredients = {
				["lead-wall"] = 2,
				["lead-plate"] = 10,
			},
		},
	},
--------------------------------------- TIER 4 --------------------------------------
	["cobalt"] = {
		Drill = {
			Drill_Speed = 4,
			Drill_Range = 10,
			Drill_Next = "arditium",
			Drill_Ingredients = {
				["iron-gear-wheel"] = 4,
				["transport-belt"] = 2,
				["lead-electric-mining-drill"] = 1,
			},
		},
		Centrifuge = {
			Centrifuge_Speed_Mod = 1.2,
			Centrifuge_Next = "stainless-steel",
			Centrifuge_Ingredients = {
				["lead-centrifuge"] = 1,
				["stone-gear-wheel"] = 4,
				["stone-brick"] = 4,
				["iron-plate"] = 1,
			},
		},
		Steam_Engine = {
			Steam_Engine_Next = "stainless-steel",
			Steam_Engine_Previous = "steel",
			Steam_Engine_Fluid_Usage = 0.7,
			Steam_Engine_Effectivity = 0.75,
			Steam_Engine_Maximum_Temperature = 165,
			Steam_Engine_Ingredients = {
				["cobalt-plate"] = 50,
				["cobalt-cable"] = 10,
				["cobalt-gear-wheel"] = 10,
				["electronic-circuit"] = 25,
			},
		},
		Robot = {
			Robot_Speed = 0.11,
			Robot_Energy_Max_MJ = 4.5,
			Robot_Energy_Tick_KJ = 0.11,
			Robot_Energy_Move_KJ = 1,
			Robot_Previous = "gold",
			Roboport_Energy_Usage_KW = 110,
			Roboport_Charging_Energy_KW = 4000,
			Roboport_Input_MW = 14,
			Roboport_Buffer_MJ = 400,
			Roboport_Range_Logistic = 50,
			Roboport_Range_Construction = 105,
			Roboport_Slot_Count = 8,
			Roboport_Ingredients = {
				["cobalt-plate"] = 50,
				["advanced-control-board"] = 25,
			},
			Logistic_Robot_Ingredients = {
				["cobalt-plate"] = 3,
				["housing"] = 1,
				["advanced-control-board"] = 5,
			},
			Construction_Robot_Ingredients = {
				["cobalt-plate"] = 5,
				["housing"] = 1,
				["advanced-control-board"] = 5,
			},
		},
	},
	["invar"] = {
		Assembler = {
			Assembler_Speed_Mod = 1.33,
			Assembler_Next = "electrum",
			Assembler_Ingredients = {
				["lead-assembling-machine"] = 1,
				["iron-gear-wheel"] = 4,
			},
		},
		Solar = {
			Solar_Production = 210,
			Solar_Next = "arditium",
			Solar_Ingredients = {
				["invar-plate"] = 4,
			},
		},
		Wall = {
			Wall_Previous = "lead",
			Wall_Next = "stainless-steel",
			Wall_Ingredients = {
				["invar-plate"] = 10,
			},
			Gate_Ingredients = {
				["invar-wall"] = 2,
				["invar-plate"] = 10,
			},
		},
	},
	["electrum"] = {
		Assembler = {
			Assembler_Speed_Mod = 1.39,
			Assembler_Next = "arditium",
			Assembler_Ingredients = {
				["invar-assembling-machine"] = 1,
				["iron-gear-wheel"] = 4,
			},
		},
		Pipe = {
			Pipe_Amount = 20,
			Pipe_Range = 20,
			Pipe_Previous = "bronze",
			Pipe_Next = "arditium",
			Pipe_Ingredients = {
				["electrum-plate"] = 2,
			},
			Pipe_Underground_Ingredients = {
				["electrum-plate"] = 10,
			},
		},
		Pump = {
			Pump_Previous = "steel",
			Pump_Next = "stainless-steel",
			Pump_Speed = 150 * 4,
			Pump_Amount = 50 * 4,
			Pump_Ingredients = {
				["electrum-plate"] = 2,
				["electrum-pipe"] = 2,
				["advanced-control-board"] = 2,
			},
		},
		Pumpjack = {
			Pumpjack_Speed = 3,
			Pumpjack_Range = 9,
			Pumpjack_Previous = "bronze",
			Pumpjack_Next = "arditium",
			Pumpjack_Ingredients = {
				["electrum-plate"] = 4,
				["electrum-pipe"] = 2,
				["electronic-control-board"] = 3,
			},
		},
	},
--------------------------------------- TIER 5 --------------------------------------
	["stainless-steel"] = {
		Belt = {
			Belt_Speed = 32,
			Belt_Range = 17,
			Belt_Previous = "steel",
			Belt_Next = "titanium",
			Belt_Ingredients = {
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
			Centrifuge_Speed_Mod = 1.35,
			Centrifuge_Next = "tungsten",
			Centrifuge_Ingredients = {
				["cobalt-centrifuge"] = 1,
				["stone-gear-wheel"] = 4,
				["stone-brick"] = 4,
				["iron-plate"] = 1,
			},
		},
		Steam_Engine = {
			Steam_Engine_Next = "titanium",
			Steam_Engine_Previous = "cobalt",
			Steam_Engine_Fluid_Usage = 0.8,
			Steam_Engine_Effectivity = 0.75,
			Steam_Engine_Maximum_Temperature = 165,
			Steam_Engine_Ingredients = {
				["stainless-steel-plate"] = 50,
				["stainless-steel-stick"] = 10,
				["stainless-steel-gear-wheel"] = 10,
				["electronic-circuit"] = 25,
			},
		},
		Wall = {
			Wall_Previous = "invar",
			Wall_Next = "titanium",
			Wall_Ingredients = {
				["stainless-steel-plate"] = 10,
			},
			Gate_Ingredients = {
				["stainless-steel-wall"] = 2,
				["stainless-steel-plate"] = 10,
			},
		},
		Pump = {
			Pump_Previous = "electrum",
			Pump_Next = "tungsten",
			Pump_Speed = 150 * 5,
			Pump_Amount = 50 * 5,
			Pump_Ingredients = {
				["stainless-steel-plate"] = 2,
				["arditium-pipe"] = 2,
				["tough-control-board"] = 2,
			},
		},
	},
	["arditium"] = {
		Drill = {
			Drill_Speed = 6,
			Drill_Range = 10,
			Drill_Next = "titanium",
			Drill_Ingredients = {
				["iron-gear-wheel"] = 4,
				["transport-belt"] = 2,
				["cobalt-electric-mining-drill"] = 1,
			},
		},
		Assembler = {
			Assembler_Speed_Mod = 1.43,
			Assembler_Next = "tungsten",
			Assembler_Ingredients = {
				["electrum-assembling-machine"] = 1,
				["iron-gear-wheel"] = 4,
			},
		},
		Solar = {
			Solar_Production = 300,
			Solar_Next = "titanium",
			Solar_Ingredients = {
				["arditium-plate"] = 4,
			},
		},
		Pipe = {
			Pipe_Amount = 30,
			Pipe_Range = 25,
			Pipe_Previous = "electrum",
			Pipe_Next = "tungsten",
			Pipe_Ingredients = {
				["arditium-plate"] = 2,
			},
			Pipe_Underground_Ingredients = {
				["arditium-plate"] = 10,
			},
		},
		Pumpjack = {
			Pumpjack_Speed = 5,
			Pumpjack_Range = 12,
			Pumpjack_Previous = "electrum",
			Pumpjack_Next = "titanium",
			Pumpjack_Ingredients = {
				["arditium-plate"] = 4,
				["arditium-pipe"] = 2,
				["tough-control-board"] = 3,
			},
		},
		Robot = {
			Robot_Speed = 0.15,
			Robot_Energy_Max_MJ = 6,
			Robot_Energy_Tick_KJ = 0.15,
			Robot_Energy_Move_KJ = 1.5,
			Robot_Previous = "cobalt",
			Roboport_Energy_Usage_KW = 220,
			Roboport_Charging_Energy_KW = 8000,
			Roboport_Input_MW = 28,
			Roboport_Buffer_MJ = 800,
			Roboport_Range_Logistic = 60,
			Roboport_Range_Construction = 125,
			Roboport_Slot_Count = 8,
			Roboport_Ingredients = {
				["arditium-plate"] = 50,
				["logistic-unit"] = 5,
				["tough-control-board"] = 25,
			},
			Logistic_Robot_Ingredients = {
				["arditium-plate"] = 3,
				["logistic-unit"] = 1,
				["tough-control-board"] = 5,
			},
			Construction_Robot_Ingredients = {
				["arditium-plate"] = 5,
				["logistic-unit"] = 1,
				["tough-control-board"] = 5,
			},
		},
	},
--------------------------------------- TIER 6 --------------------------------------
	["titanium"] = {
		Belt = {
			Belt_Speed = 42,
			Belt_Range = 21,
			Belt_Previous = "stainless-steel",
			Belt_Next = "tungsten",
			Belt_Ingredients = {
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
			Drill_Speed = 9,
			Drill_Range = 12,
			Drill_Next = "electranium",
			Drill_Ingredients = {
				["iron-gear-wheel"] = 4,
				["transport-belt"] = 2,
				["arditium-electric-mining-drill"] = 1,
			},
		},
		Solar = {
			Solar_Production = 140,
			Solar_Next = "electranium",
			Solar_Ingredients = {
				["titanium-plate"] = 4,
			},
		},
		Steam_Engine = {
			Steam_Engine_Next = "electranium",
			Steam_Engine_Previous = "stainless-steel",
			Steam_Engine_Fluid_Usage = 0.9,
			Steam_Engine_Effectivity = 0.75,
			Steam_Engine_Maximum_Temperature = 165,
			Steam_Engine_Ingredients = {
				["titanium-plate"] = 50,
				["titanium-cable"] = 10,
				["titanium-gear-wheel"] = 10,
				["electronic-circuit"] = 25,
			},	
		},
		Wall = {
			Wall_Previous = "stainless-steel",
			Wall_Next = "arditium-tungstenate",
			Wall_Ingredients = {
				["titanium-plate"] = 10,
			},
			Gate_Ingredients = {
				["titanium-wall"] = 2,
				["titanium-plate"] = 10,
			},
		},
		Pumpjack = {
			Pumpjack_Speed = 7.5,
			Pumpjack_Range = 16,
			Pumpjack_Previous = "arditium",
			Pumpjack_Next = "tungstvar",
			Pumpjack_Ingredients = {
				["titanium-plate"] = 4,
				["tungsten-pipe"] = 2,
				["processing-control-board"] = 3,
			},	
		},
	},
	["tungsten"] = {
		Belt = {
			Belt_Speed = 55,
			Belt_Range = 26,
			Belt_Previous = "titanium",
			Belt_Next = "arditium-tungstenate",
			Belt_Ingredients = {
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
			Pipe_Amount = 50,
			Pipe_Range = 30,
			Pipe_Previous = "arditium",
			Pipe_Next = "electranium",
			Pipe_Ingredients = {
				["tungsten-plate"] = 2,
			},
			Pipe_Underground_Ingredients = {
				["tungsten-plate"] = 10,
			},
		},
		Pump = {
			Pump_Previous = "stainless-steel",
			Pump_Next = "arditium-tungstenate",
			Pump_Speed = 150 * 6,
			Pump_Amount = 50 * 6,
			Pump_Ingredients = {
				["tungsten-plate"] = 2,
				["tungsten-pipe"] = 2,
				["processing-control-board"] = 2,
			},
		},
		Assembler = {
			Assembler_Speed_Mod = 1.56,
			Assembler_Next = "electranium",
			Assembler_Ingredients = {
				["arditium-assembling-machine"] = 1,
				["iron-gear-wheel"] = 4,
			},
		},
		Centrifuge = {
			Centrifuge_Speed_Mod = 1.5,
			Centrifuge_Next = "tungstvar",
			Centrifuge_Ingredients = {
				["stainless-steel-centrifuge"] = 1,
				["stone-gear-wheel"] = 4,
				["stone-brick"] = 4,
				["iron-plate"] = 1,
			},
		},
	},
--------------------------------------- TIER 7 --------------------------------------
	["electranium"] = {
		Drill = {
			Drill_Speed = 12,
			Drill_Range = 15,
			Drill_Next = "tungstvar",
			Drill_Ingredients = {
				["iron-gear-wheel"] = 4,
				["transport-belt"] = 2,
				["titanium-electric-mining-drill"] = 1,
			},
		},
		Pipe = {
			Pipe_Amount = 80,
			Pipe_Range = 40,
			Pipe_Previous = "tungsten",
			Pipe_Next = "tungstvar",
			Pipe_Ingredients = {
				["electranium-plate"] = 2,
			},
			Pipe_Underground_Ingredients = {
				["electranium-plate"] = 10,
			},
		},
		Assembler = {
			Assembler_Speed_Mod = 1.54,
			Assembler_Next = "neutronium",
			Assembler_Ingredients = {
				["tungsten-assembling-machine"] = 1,
				["iron-gear-wheel"] = 4,
			},
		},
		Solar = {
			Solar_Production = 420,
			Solar_Next = "tungstvar",
			Solar_Ingredients = {
				["electranium-plate"] = 4,
			},
		},
		Steam_Engine = {
			Steam_Engine_Next = "tungstvar",
			Steam_Engine_Previous = "titanium",
			Steam_Engine_Fluid_Usage = 1,
			Steam_Engine_Effectivity = 0.75,
			Steam_Engine_Maximum_Temperature = 165,
			Steam_Engine_Ingredients = {
				["electranium-plate"] = 50,
				["electranium-cable"] = 10,
				["electranium-stick"] = 10,
				["electronic-circuit"] = 25,
			},	
		},
		Robot = {
			Robot_Speed = 0.25,
			Robot_Energy_Max_MJ = 12,
			Robot_Energy_Tick_KJ = 0.17,
			Robot_Energy_Move_KJ = 2,
			Robot_Previous = "arditium",
			Roboport_Energy_Usage_KW = 440,
			Roboport_Charging_Energy_KW = 16000,
			Roboport_Input_MW = 56,
			Roboport_Buffer_MJ = 1600,
			Roboport_Range_Logistic = 75,
			Roboport_Range_Construction = 150,
			Roboport_Slot_Count = 12,
			Roboport_Ingredients = {
				["electranium-plate"] = 50,
				["controller"] = 5,
				["logic-control-board"] = 25,
			},
			Logistic_Robot_Ingredients = {
				["electranium-plate"] = 3,
				["controller"] = 1,
				["logic-control-board"] = 5,
			},
			Construction_Robot_Ingredients = {
				["electranium-plate"] = 5,
				["controller"] = 1,
				["logic-control-board"] = 5,
			},	
		},
	},
	["arditium-tungstenate"] = {
		Belt = {
			Belt_Speed = 70,
			Belt_Range = 32,
			Belt_Previous = "tungsten",
			Belt_Next = "tungstvar",
			Belt_Ingredients = {
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
			Wall_Previous = "titanium",
			Wall_Next = "tungstvar",
			Wall_Ingredients = {
				["arditium-tungstenate-plate"] = 10,
			},
			Gate_Ingredients = {
				["arditium-tungstenate-wall"] = 2,
				["arditium-tungstenate-plate"] = 10,
			},
		},
		Pump = {
			Pump_Previous = "tungsten",
			Pump_Next = "neutronium",
			Pump_Speed = 150 * 7,
			Pump_Amount = 50 * 7,
			Pump_Ingredients = {
				["arditium-tungstenate-plate"] = 2,
				["electranium-pipe"] = 2,
				["logic-control-board"] = 2,
			},
		},
	},
--------------------------------------- TIER 8 --------------------------------------
	["tungstvar"] = {
		Belt = {
			Belt_Speed = 88,
			Belt_Range = 38,
			Belt_Previous = "arditium-tungstenate",
			Belt_Next = "neutrobaltium",
			Belt_Ingredients = {
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
			Pipe_Amount = 100,
			Pipe_Range = 50,
			Pipe_Previous = "electranium",
			Pipe_Next = "neutrobaltium",
			Pipe_Ingredients = {
				["tungstvar-plate"] = 2,
			},
			Pipe_Underground_Ingredients = {
				["tungstvar-plate"] = 10,
			},
		},
		Pumpjack = {
			Pumpjack_Speed = 12,
			Pumpjack_Range = 20,
			Pumpjack_Previous = "titanium",
			Pumpjack_Next = "neutrobaltium",
			Pumpjack_Ingredients = {
				["tungstvar-plate"] = 4,
				["tungstvar-pipe"] = 2,
				["super-control-board"] = 3,
			},	
		},
		Drill = {
			Drill_Speed = 15,
			Drill_Range = 20,
			Drill_Next = "neutronium",
			Drill_Ingredients = {
				["iron-gear-wheel"] = 4,
				["transport-belt"] = 2,
				["electranium-electric-mining-drill"] = 1,
			},
		},
		Centrifuge = {
			Centrifuge_Speed_Mod = 1.8,
			Centrifuge_Next = "neutrobaltium",
			Centrifuge_Ingredients = {
				["tungsten-centrifuge"] = 1,
				["stone-gear-wheel"] = 4,
				["stone-brick"] = 4,
				["iron-plate"] = 1,
			},
		},
		Solar = {
			Solar_Production = 650,
			Solar_Next = "neutrobaltium",
			Solar_Ingredients = {
				["tungstvar-plate"] = 4,
			},
		},
		Steam_Engine = {
			Steam_Engine_Next = "neutronium",
			Steam_Engine_Previous = "electranium",
			Steam_Engine_Fluid_Usage = 1.1,
			Steam_Engine_Effectivity = 0.75,
			Steam_Engine_Maximum_Temperature = 165,
			Steam_Engine_Ingredients = {
				["tungstvar-plate"] = 50,
				["tungstvar-stick"] = 10,
				["electronic-circuit"] = 25,
			},
		},
		Wall = {
			Wall_Previous = "arditium-tungstenate",
			Wall_Next = "neutronium",
			Wall_Ingredients = {
				["tungstvar-plate"] = 10,
			},
			Gate_Ingredients = {
				["tungstvar-wall"] = 2,
				["tungstvar-plate"] = 10,
			},	
		},	
	},
--------------------------------------- TIER 9 --------------------------------------
	["neutronium"] = {
		Drill = {
			Drill_Speed = 19,
			Drill_Range = 22,
			Drill_Next = "neutrobaltium",
			Drill_Ingredients = {
				["iron-gear-wheel"] = 4,
				["transport-belt"] = 2,
				["tungstvar-electric-mining-drill"] = 1,
			},
		},
		Assembler = {
			Assembler_Speed_Mod = 1.66,
			Assembler_Next = "neutrobaltium",
			Assembler_Ingredients = {
				["electranium-assembling-machine"] = 1,
				["iron-gear-wheel"] = 4,
			},
		},
		Steam_Engine = {
			Steam_Engine_Next = "neutrobaltium",
			Steam_Engine_Previous = "tungstvar",
			Steam_Engine_Fluid_Usage = 1.2,
			Steam_Engine_Effectivity = 0.75,
			Steam_Engine_Maximum_Temperature = 165,
			Steam_Engine_Ingredients = {
				["neutronium-plate"] = 50,
				["neutronium-stick"] = 10,
				["electronic-circuit"] = 25,
			},	
		},
		Wall = {
			Wall_Previous = "tungstvar",
			Wall_Next = "neutrobaltium",
			Wall_Ingredients = {
				["neutronium-plate"] = 10,
			},
			Gate_Ingredients = {
				["neutronium-wall"] = 2,
				["neutronium-plate"] = 10,
			},	
		},
		Pump = {
			Pump_Previous = "arditium-tungstenate",
			Pump_Next = "neutrobaltium",
			Pump_Speed = 150 * 9,
			Pump_Amount = 50 * 9,
			Pump_Ingredients = {
				["neutronium-plate"] = 2,
				["tungstvar-pipe"] = 2,
				["extreme-control-board"] = 2,
			},
		},
	},
--------------------------------------- TIER 10 -------------------------------------
	["neutrobaltium"] = {
		Belt = {
			Belt_Speed = 110,
			Belt_Range = 50,
			Belt_Previous = "tungstvar",
			Belt_Next = "neutrobaltium",
			Belt_Ingredients = {
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
			Robot_Speed = 0.40,
			Robot_Energy_Max_MJ = 36,
			Robot_Energy_Tick_KJ = 0.19,
			Robot_Energy_Move_KJ = 1,
			Robot_Previous = "electranium",
			Roboport_Energy_Usage_KW = 880,
			Roboport_Charging_Energy_KW = 32000,
			Roboport_Input_MW = 112,
			Roboport_Buffer_MJ = 3200,
			Roboport_Range_Logistic = 130,
			Roboport_Range_Construction = 200,
			Roboport_Slot_Count = 14,
			Roboport_Ingredients = {
				["neutrobaltium-plate"] = 50,
				["controller"] = 5,
				["quantum-control-board"] = 25,
			},
			Logistic_Robot_Ingredients = {
				["neutrobaltium-plate"] = 3,
				["controller"] = 1,
				["quantum-control-board"] = 5,
			},
			Construction_Robot_Ingredients = {
				["neutrobaltium-plate"] = 5,
				["controller"] = 1,
				["quantum-control-board"] = 5,
			},	
		},
		Drill = {
			Drill_Speed = 25,
			Drill_Range = 25,
			Drill_Next = "neutrobaltium",
			Drill_Ingredients = {
				["iron-gear-wheel"] = 4,
				["transport-belt"] = 2,
				["neutronium-electric-mining-drill"] = 1,
			},
		},
		Assembler = {
			Assembler_Speed_Mod = 1.8,
			Assembler_Next = "neutrobaltium",
			Assembler_Ingredients = {
				["neutronium-assembling-machine"] = 1,
				["iron-gear-wheel"] = 4,
			},
		},
		Refinery = {
			Refinery_Speed_Mod = 1.8,
			Refinery_Next = "neutrobaltium",
			Refinery_Ingredients = {
				["neutronium-assembling-machine"] = 1,
				["iron-gear-wheel"] = 4,
			},
		},
		Chemical = {
			Chemical_Speed_Mod = 1.8,
			Chemical_Next = "neutrobaltium",
			Chemical_Ingredients = {
				["neutronium-assembling-machine"] = 1,
				["iron-gear-wheel"] = 4,
			},
		},
		Solar = {
			Solar_Production = 900,
			Solar_Next = "neutrobaltium",
			Solar_Ingredients = {
				["neutrobaltium-plate"] = 4,
			},
		},
		Centrifuge = {
			Centrifuge_Speed_Mod = 2.5,
			Centrifuge_Next = "neutrobaltium",
			Centrifuge_Ingredients = {
				["tungstvar-centrifuge"] = 1,
				["stone-gear-wheel"] = 4,
				["stone-brick"] = 4,
				["neutrobaltium-plate"] = 1,
			},
		},
		Steam_Engine = {
			Steam_Engine_Next = "neutrobaltium",
			Steam_Engine_Previous = "neutronium",
			Steam_Engine_Fluid_Usage = 1,
			Steam_Engine_Effectivity = 1.75,
			Steam_Engine_Maximum_Temperature = 165,
			Steam_Engine_Ingredients = {
				["neutrobaltium-plate"] = 50,
				["neutrobaltium-cable"] = 10,
				["neutrobaltium-gear-wheel"] = 10,
				["electronic-circuit"] = 25,
			},
		},
		Pipe = {
			Pipe_Amount = 200,
			Pipe_Range = 75,
			Pipe_Previous = "tungstvar",
			Pipe_Next = "neutrobaltium",
			Pipe_Ingredients = {
				["neutrobaltium-plate"] = 2,
			},
			Pipe_Underground_Ingredients = {
				["neutrobaltium-plate"] = 10,
			},
		},
		Pump = {
			Pump_Previous = "neutronium",
			Pump_Next = "neutrobaltium",
			Pump_Speed = 150 * 10,
			Pump_Amount = 50 * 10,
			Pump_Ingredients = {
				["neutrobaltium-plate"] = 2,
				["neutrobaltium-pipe"] = 2,
				["quantum-control-board"] = 2,
			},
		},
		Pumpjack = {
			Pumpjack_Speed = 16,
			Pumpjack_Range = 25,
			Pumpjack_Previous = "tungstvar",
			Pumpjack_Next = "neutrobaltium",
			Pumpjack_Ingredients = {
				["neutrobaltium-plate"] = 4,
				["neutrobaltium-pipe"] = 2,
				["quantum-control-board"] = 3,
			},	
		},
		Wall = {
			Wall_Previous = "neutronium",
			Wall_Next = "neutrobaltium",
			Wall_Ingredients = {
				["neutrobaltium-plate"] = 10,
			},
			Gate_Ingredients = {
				["neutrobaltium-wall"] = 2,
				["neutrobaltium-plate"] = 10,
			},
		},
	},
	
}