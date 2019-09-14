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
				["stone-brick"] = 20,
				["iron-plate"] = 1,
			},
		},
		Drill = {
			Drill_Speed = 0.5,
			Drill_Range = 3,
			Drill_Next = "iron",
			Drill_Ingredients = {
				["simple-control-board"] = 5,
				["stone-plate"] = 10,
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
				["basic-control-board"] = 50,
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
			Radar_Next = "nickel",
			Radar_Active_Range = 2,
			Radar_Scan_Range = 10,
			Radar_Ingredients = {
				["simple-control-board"] = 4,
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
			Drill_Previous = "stone",
			Drill_Next = "nickel",
			Drill_Ingredients = {
				["iron-gear-wheel"] = 5,
				["basic-control-board"] = 2,
				["rotor"] = 2,
			},
		},
		Pumpjack = {
			Pumpjack_Speed = 1,
			Pumpjack_Range = 3,
			--Pumpjack_Previous = "iron",
			Pumpjack_Next = "bronze",
			Pumpjack_Ingredients = {
				["iron-plate"] = 10,
				["electric-mining-drill"] = 1,
				["iron-gear-wheel"] = 10,
				["stone-pipe"] = 5,
				["basic-control-board"] = 5,
			},
		},
		Assembler = {
			Assembler_Speed_Mod = 1.11,
			Assembler_Previous = "stone",
			Assembler_Next = "tin",
			Assembler_Ingredients = {
				["iron-gear-wheel"] = 4,
				["iron-plate"] = 20,
				["basic-control-board"] = 1,
			},
		},
		Furnace = {
			Furnace_Speed_Mod = 1.11,
			Furnace_Next = "steel",
			Furnace_Ingredients = {
				["basic-control-board"] = 5,
				["iron-plate"] = 25,
				["iron-stick"] = 10,
				["copper-cable"] = 5,
				["rotor"] = 1,
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
				["simple-control-board"] = 2,
			},
		},
		Boiler = {
			Boiler_Next = "iron",
			Boiler_Previous = "stone",
			Boiler_Max_Temp = 200,
			Boiler_Effectivity = 1,
			Boiler_Energy_Consumption_KW = 1900,
			Boiler_Ingredients = {
				["basic-control-board"] = 4,
				["copper-plate"] = 1,
				["iron-plate"] = 5,
				["iron-gear-wheel"] = 1,
				["rotor"] = 1,
			},
		},
	},
	["copper"] = {
		Centrifuge = {
			Centrifuge_Speed_Mod = 1,
			Centrifuge_Previous = "stone",
			Centrifuge_Next = "lead",
			Centrifuge_Ingredients = {
				["copper-plate"] = 10,
				["copper-cable"] = 15,
				["rotor"] = 5,
				["basic-control-board"] = 5,
			},
		},
		Solar = {
			Solar_Production = 90,
			Solar_Next = "silver",
			Solar_Ingredients = {
				["copper-plate"] = 10,
				["basic-control-board"] = 4,
			},
		},
		Accumulator = {
			Accumulator_Next = "bronze",
			--Accumulator_Previous = "copper",
			Accumulator_Buffer_MJ = 5,
			Accumulator_Ingredients = {
				["basic-control-board"] = 14,
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
			Drill_Previous = "iron",
			Drill_Next = "lead",
			Drill_Ingredients = {
				["nickel-gear-wheel"] = 4,
				["nickel-plate"] = 10,
				["basic-control-board"] = 10,
				["rotor"] = 4,
			},
		},
		Steam_Engine = {
			Steam_Engine_Next = "steel",
			Steam_Engine_Previous = "stone",
			Steam_Engine_Fluid_Usage = 0.5,
			Steam_Engine_Effectivity = 0.75,
			Steam_Engine_Maximum_Temperature = 165,
			Steam_Engine_Ingredients = {
				["nickel-plate"] = 20,
				["nickel-gear-wheel"] = 5,
				["rotor"] = 5,
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
				["nickel-plate"] = 5,
				["nickel-cable"] = 1,
				["nickel-gear-wheel"] = 3,
				["basic-control-board"] = 5,
				["rotor"] = 2,
			},
			Construction_Robot_Ingredients = {
				["nickel-plate"] = 5,
				["nickel-cable"] = 3,
				["nickel-gear-wheel"] = 2,
				["basic-control-board"] = 5,
				["rotor"] = 2,
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
		Radar = {
			Radar_Previous = "stone",
			Radar_Next = "steel",
			Radar_Active_Range = 3,
			Radar_Scan_Range = 15,
			Radar_Ingredients = {
				["basic-control-board"] = 4,
				["nickel-plate"] = 5,
				["nickel-gear-wheel"] = 1,
			},
		},
	},
	["silver"] = {
		Solar = {
			Solar_Production = 170,
			Solar_Previous = "copper",
			Solar_Next = "gold",
			Solar_Ingredients = {
				["silver-plate"] = 10,
				["basic-control-board"] = 4,
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
			Assembler_Speed_Mod = 1.21,
			Assembler_Previous = "iron",
			Assembler_Next = "lead",
			Assembler_Ingredients = {
				["tin-gear-wheel"] = 4,
				["tin-plate"] = 20,
				["basic-control-board"] = 5,
				["rotor"] = 1,
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
			Refinery_Speed_Mod = 1,
			--Refinery_Previous = "neutrobaltium",
			Refinery_Next = "stainless-steel",
			Refinery_Ingredients = {
				["tin-assembling-machine"] = 1,
				["tin-gear-wheel"] = 4,
				["tin-plate"] = 50,
				["basic-control-board"] = 25,
			},
		},
		Chemical = {
			Chemical_Speed_Mod = 1,
			--Chemical_Previous = "neutrobaltium",
			Chemical_Next = "invar",
			Chemical_Ingredients = {
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
				["steel-plate"] = 25,
				["steel-stick"] = 10,
				["steel-gear-wheel"] = 10,
				["heater"] = 5,
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
		Furnace = {
			Furnace_Speed_Mod = 1.16,
			Furnace_Previous = "iron",
			Furnace_Next = "cobalt",
			Furnace_Ingredients = {
				["electronic-control-board"] = 4,
				["steel-plate"] = 15,
				["heater"] = 2,
				["coil"] = 5,
			},
		},
		Radar = {
			Radar_Previous = "nickel",
			Radar_Next = "invar",
			Radar_Active_Range = 4,
			Radar_Scan_Range = 22,
			Radar_Ingredients = {
				["electronic-control-board"] = 4,
				["steel-plate"] = 5,
				["steel-gear-wheel"] = 1,
			},
		},
	},
	["gold"] = {
		Solar = {
			Solar_Production = 260,
			Solar_Previous = "silver",
			Solar_Next = "invar",
			Solar_Ingredients = {
				["gold-plate"] = 10,
				["electronic-control-board"] = 4,
				["frame"] = 1,
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
				["advanced-control-board"] = 50,
				["gold-speed-module"] = 10,
				["gold-productivity-module"] = 10,
				["gold-effectivity-module"] = 10,
				["gold-pollution-reduce-module"] = 10,
				["gold-pollution-increase-module"] = 10,
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
				["gold-cable"] = 25,
				["electronic-control-board"] = 25,
			},
			Logistic_Robot_Ingredients = {
				["gold-plate"] = 5,
				["engine-unit"] = 1,
				["frame"] = 1,
				["electronic-control-board"] = 5,
			},
			Construction_Robot_Ingredients = {
				["gold-plate"] = 5,
				["engine-unit"] = 1,
				["frame"] = 1,
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
				["bronze-plate"] = 10,
				["bronze-gear-wheel"] = 10,
				["bronze-pipe"] = 5,
				["electronic-control-board"] = 3,
			},
		},
		Accumulator = {
			Accumulator_Previous = "copper",
			Accumulator_Next = "electrum",
			Accumulator_Buffer_MJ = 8,
			Accumulator_Ingredients = {
				["electronic-control-board"] = 14,
				["bronze-plate"] = 5,
				["bronze-cable"] = 1,
			},
		},
	},
	["lead"] = {
		Drill = {
			Drill_Speed = 2.5,
			Drill_Range = 8,
			Drill_Previous = "nickel",
			Drill_Next = "cobalt",
			Drill_Ingredients = {
				["lead-gear-wheel"] = 4,
				["lead-plate"] = 10,
				["electronic-control-board"] = 5,
				["frame"] = 1,
			},
		},
		Assembler = {
			Assembler_Speed_Mod = 1.29,
			Assembler_Previous = "tin",
			Assembler_Next = "invar",
			Assembler_Ingredients = {
				["lead-gear-wheel"] = 4,
				["lead-plate"] = 20,
				["electronic-control-board"] = 1,
				["frame"] = 1,
			},
		},
		Centrifuge = {
			Centrifuge_Speed_Mod = 1.08,
			Centrifuge_Previous = "copper",
			Centrifuge_Next = "cobalt",
			Centrifuge_Ingredients = {
				["electronic-control-board"] = 5,
				["lead-plate"] = 25,
				["heater"] = 3,
				["frame"] = 1,
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
				["basic-control-board"] = 2,
			},
		},
	},
--------------------------------------- TIER 4 --------------------------------------
	["cobalt"] = {
		Drill = {
			Drill_Speed = 4,
			Drill_Range = 10,
			Drill_Previous = "lead",
			Drill_Next = "arditium",
			Drill_Ingredients = {
				["cobalt-gear-wheel"] = 4,
				["cobalt-plate"] = 10,
				["advanced-control-board"] = 5,
				["intake"] = 1,
			},
		},
		Centrifuge = {
			Centrifuge_Speed_Mod = 1.2,
			Centrifuge_Previous = "lead",
			Centrifuge_Next = "stainless-steel",
			Centrifuge_Ingredients = {
				["advanced-control-board"] = 5,
				["cobalt-plate"] = 25,
				["intake"] = 3,
				["housing"] = 1,
			},
		},
		Steam_Engine = {
			Steam_Engine_Next = "stainless-steel",
			Steam_Engine_Previous = "steel",
			Steam_Engine_Fluid_Usage = 0.7,
			Steam_Engine_Effectivity = 0.75,
			Steam_Engine_Maximum_Temperature = 165,
			Steam_Engine_Ingredients = {
				["cobalt-plate"] = 40,
				["cobalt-gear-wheel"] = 10,
				["intake"] = 4,
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
				["cobalt-cable"] = 10,
				["cobalt-gear-wheel"] = 10,
				["advanced-control-board"] = 25,
			},
			Logistic_Robot_Ingredients = {
				["cobalt-plate"] = 5,
				["housing"] = 1,
				["flying-robot-frame"] = 1,
				["advanced-control-board"] = 5,
			},
			Construction_Robot_Ingredients = {
				["cobalt-plate"] = 5,
				["housing"] = 1,
				["flying-robot-frame"] = 1,
				["advanced-control-board"] = 5,
			},
		},
		Furnace = {
			Furnace_Speed_Mod = 1.25,
			Furnace_Previous = "steel",
			Furnace_Next = "tungsten",
			Furnace_Ingredients = {
				["advanced-control-board"] = 4,
				["cobalt-plate"] = 25,
				["heater"] = 5,
				["intake"] = 1,
			},
		},
	},
	["invar"] = {
		Assembler = {
			Assembler_Speed_Mod = 1.33,
			Assembler_Previous = "lead",
			Assembler_Next = "electrum",
			Assembler_Ingredients = {
				["invar-gear-wheel"] = 4,
				["invar-plate"] = 20,
				["advanced-control-board"] = 1,
				["intake"] = 1,
			},
		},
		Solar = {
			Solar_Production = 375,
			Solar_Previous = "gold",
			Solar_Next = "arditium",
			Solar_Ingredients = {
				["invar-plate"] = 10,
				["advanced-control-board"] = 4,
				["housing"] = 1,
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
				["electronic-control-board"] = 2,
			},
		},
		Chemical = {
			Chemical_Speed_Mod = 1.2,
			Chemical_Previous = "tin",
			Chemical_Next = "arditium-tungstenate",
			Chemical_Ingredients = {
				["invar-gear-wheel"] = 4,
				["invar-plate"] = 25,
				["advanced-control-board"] = 12,
			},
		},
		Radar = {
			Radar_Previous = "steel",
			Radar_Next = "stainless-steel",
			Radar_Active_Range = 5,
			Radar_Scan_Range = 28,
			Radar_Ingredients = {
				["advanced-control-board"] = 2,
				["invar-plate"] = 25,
				["invar-gear-wheel"] = 13,
			},
		},
	},
	["electrum"] = {
		Assembler = {
			Assembler_Speed_Mod = 1.39,
			Assembler_Previous = "invar",
			Assembler_Next = "arditium",
			Assembler_Ingredients = {
				["electrum-cable"] = 4,
				["electrum-plate"] = 20,
				["advanced-control-board"] = 3,
				["housing"] = 1,
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
				["electrum-plate"] = 10,
				["electrum-pipe"] = 5,
				["advanced-control-board"] = 3,
			},
		},
		Accumulator = {
			Accumulator_Previous = "bronze",
			Accumulator_Next = "titanium",
			Accumulator_Buffer_MJ = 13,
			Accumulator_Ingredients = {
				["advanced-control-board"] = 14,
				["electrum-plate"] = 5,
				["electrum-cable"] = 1,
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
			Centrifuge_Previous = "cobalt",
			Centrifuge_Next = "tungsten",
			Centrifuge_Ingredients = {
				["tough-control-board"] = 5,
				["stainless-steel-plate"] = 25,
				["logistic-unit"] = 2,
				["stainless-steel-gear-wheel"] = 2,
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
				["tough-control-board"] = 5,
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
				["advanced-control-board"] = 2,
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
		Refinery = {
			Refinery_Speed_Mod = 1.25,
			Refinery_Previous = "tin",
			Refinery_Next = "arditium-tungstenate",
			Refinery_Ingredients = {
				["stainless-steel-gear-wheel"] = 4,
				["stainless-steel-plate"] = 50,
				["tough-control-board"] = 25,
			},
		},
		Radar = {
			Radar_Previous = "invar",
			Radar_Next = "titanium",
			Radar_Active_Range = 6,
			Radar_Scan_Range = 37,
			Radar_Ingredients = {
				["tough-control-board"] = 4,
				["stainless-steel-plate"] = 15,
				["stainless-steel-gear-wheel"] = 3,
			},
		},
	},
	["arditium"] = {
		Drill = {
			Drill_Speed = 6,
			Drill_Range = 10,
			Drill_Previous = "cobalt",
			Drill_Next = "titanium",
			Drill_Ingredients = {
				["arditium-gear-wheel"] = 6,
				["arditium-plate"] = 15,
				["tough-control-board"] = 5,
				["housing"] = 2,
				["intake"] = 1,
			},
		},
		Assembler = {
			Assembler_Speed_Mod = 1.43,
			Assembler_Previous = "electrum",
			Assembler_Next = "tungsten",
			Assembler_Ingredients = {
				["arditium-gear-wheel"] = 4,
				["arditium-plate"] = 20,
				["tough-control-board"] = 1,
				["logistic-unit"] = 1,
			},
		},
		Solar = {
			Solar_Production = 490,
			Solar_Previous = "invar",
			Solar_Next = "titanium",
			Solar_Ingredients = {
				["arditium-plate"] = 10,
				["tough-control-board"] = 4,
				["housing"] = 4,
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
				["arditium-plate"] = 10,
				["arditium-gear-wheel"] = 4,
				["arditium-pipe"] = 5,
				["tough-control-board"] = 4,
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
				["arditium-gear-wheel"] = 10,
				["logistic-unit"] = 5,
				["tough-control-board"] = 25,
			},
			Logistic_Robot_Ingredients = {
				["arditium-plate"] = 5,
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
			Drill_Previous = "arditium",
			Drill_Next = "electranium",
			Drill_Ingredients = {
				["titanium-gear-wheel"] = 10,
				["titanium-plate"] = 20,
				["processing-control-board"] = 5,
				["controller"] = 1,
			},
		},
		Solar = {
			Solar_Production = 620,
			Solar_Previous = "arditium",
			Solar_Next = "electranium",
			Solar_Ingredients = {
				["titanium-plate"] = 10,
				["processing-control-board"] = 4,
				["controller"] = 1,
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
				["titanium-gear-wheel"] = 10,
				["controller"] = 1,
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
				["processing-control-board"] = 2,
			},
		},
		Pumpjack = {
			Pumpjack_Speed = 7.5,
			Pumpjack_Range = 16,
			Pumpjack_Previous = "arditium",
			Pumpjack_Next = "tungstvar",
			Pumpjack_Ingredients = {
				["titanium-plate"] = 10,
				["titanium-gear-wheel"] = 4,
				["tungsten-pipe"] = 5,
				["processing-control-board"] = 6,
			},	
		},
		Radar = {
			Radar_Previous = "stainless-steel",
			Radar_Next = "arditium-tungstenate",
			Radar_Active_Range = 8,
			Radar_Scan_Range = 50,
			Radar_Ingredients = {
				["processing-control-board"] = 8,
				["titanium-plate"] = 5,
				["titanium-gear-wheel"] = 1,
			},
		},
		Accumulator = {
			Accumulator_Previous = "electrum",
			Accumulator_Next = "electranium",
			Accumulator_Buffer_MJ = 20,
			Accumulator_Ingredients = {
				["processing-control-board"] = 14,
				["titanium-plate"] = 5,
				["titanium-cable"] = 1,
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
			Assembler_Previous = "arditium",
			Assembler_Next = "electranium",
			Assembler_Ingredients = {
				["tungsten-gear-wheel"] = 4,
				["tungsten-plate"] = 20,
				["processing-control-board"] = 1,
				["controller"] = 1,
			},
		},
		Centrifuge = {
			Centrifuge_Speed_Mod = 1.5,
			Centrifuge_Previous = "stainless-steel",
			Centrifuge_Next = "tungstvar",
			Centrifuge_Ingredients = {
				["processing-control-board"] = 5,
				["tungsten-plate"] = 25,
				["tungsten-gear-wheel"] = 25,
				["controller"] = 5,
			},
		},
		Furnace = {
			Furnace_Speed_Mod = 1.4,
			Furnace_Previous = "cobalt",
			Furnace_Next = "tungstvar",
			Furnace_Ingredients = {
				["processing-control-board"] = 4,
				["tungsten-plate"] = 30,
				["heater"] = 10,
				["controller"] = 1,
			},
		},
	},
--------------------------------------- TIER 7 --------------------------------------
	["electranium"] = {
		Drill = {
			Drill_Speed = 12,
			Drill_Range = 15,
			Drill_Previous = "titanium",
			Drill_Next = "tungstvar",
			Drill_Ingredients = {
				["electranium-cable"] = 10,
				["electranium-plate"] = 25,
				["logic-control-board"] = 5,
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
			Assembler_Previous = "tungsten",
			Assembler_Next = "neutronium",
			Assembler_Ingredients = {
				["electranium-cable"] = 4,
				["electranium-plate"] = 20,
				["logic-control-board"] = 1,
			},
		},
		Solar = {
			Solar_Production = 860,
			Solar_Previous = "titanium",
			Solar_Next = "tungstvar",
			Solar_Ingredients = {
				["electranium-plate"] = 10,
				["logic-control-board"] = 8,
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
				["logic-control-board"] = 25,
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
				["electranium-cable"] = 10,
				["controller"] = 5,
				["logic-control-board"] = 25,
			},
			Logistic_Robot_Ingredients = {
				["electranium-plate"] = 5,
				["controller"] = 1,
				["logic-control-board"] = 5,
			},
			Construction_Robot_Ingredients = {
				["electranium-plate"] = 5,
				["controller"] = 1,
				["logic-control-board"] = 5,
			},	
		},
		Accumulator = {
			Accumulator_Previous = "titanium",
			Accumulator_Next = "tungstvar",
			Accumulator_Buffer_MJ = 32,
			Accumulator_Ingredients = {
				["logic-control-board"] = 14,
				["electranium-plate"] = 5,
				["electranium-cable"] = 1,
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
				["logic-control-board"] = 5,
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
		Refinery = {
			Refinery_Speed_Mod = 1.5,
			Refinery_Previous = "stainless-steel",
			Refinery_Next = "neutrobaltium",
			Refinery_Ingredients = {
				["arditium-tungstenate-gear-wheel"] = 4,
				["arditium-tungstenate-plate"] = 50,
				["logic-control-board"] = 25,
			},
		},
		Chemical = {
			Chemical_Speed_Mod = 1.4,
			Chemical_Previous = "invar",
			Chemical_Next = "neutronium",
			Chemical_Ingredients = {
				["arditium-tungstenate-gear-wheel"] = 4,
				["arditium-tungstenate-plate"] = 25,
				["logic-control-board"] = 12,
			},
		},
		Radar = {
			Radar_Previous = "titanium",
			Radar_Next = "neutrobaltium",
			Radar_Active_Range = 10,
			Radar_Scan_Range = 65,
			Radar_Ingredients = {
				["logic-control-board"] = 4,
				["arditium-tungstenate-plate"] = 5,
				["arditium-tungstenate-gear-wheel"] = 9,
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
				["tungstvar-plate"] = 10,
				["arditium-tungstenate-gear-wheel"] = 4,
				["tungstvar-pipe"] = 5,
				["super-control-board"] = 7,
			},	
		},
		Drill = {
			Drill_Speed = 15,
			Drill_Range = 20,
			Drill_Previous = "electranium",
			Drill_Next = "neutronium",
			Drill_Ingredients = {
				["tungstvar-stick"] = 20,
				["tungstvar-plate"] = 50,
				["super-control-board"] = 10,
			},
		},
		Centrifuge = {
			Centrifuge_Speed_Mod = 1.8,
			Centrifuge_Previous = "tungsten",
			Centrifuge_Next = "neutrobaltium",
			Centrifuge_Ingredients = {
				["super-control-board"] = 5,
				["tungstvar-plate"] = 25,
			},
		},
		Solar = {
			Solar_Production = 1175,
			Solar_Previous = "electranium",
			Solar_Next = "neutrobaltium",
			Solar_Ingredients = {
				["tungstvar-plate"] = 10,
				["super-control-board"] = 8,
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
				["housing"] = 10,
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
				["super-control-board"] = 5,
			},	
		},	
		Furnace = {
			Furnace_Speed_Mod = 1.6,
			Furnace_Previous = "tungsten",
			Furnace_Next = "neutrobaltium",
			Furnace_Ingredients = {
				["super-control-board"] = 4,
				["tungstvar-plate"] = 40,
				["heater"] = 25,
			},
		},
		Accumulator = {
			Accumulator_Previous = "electranium",
			Accumulator_Next = "neutronium",
			Accumulator_Buffer_MJ = 48,
			Accumulator_Ingredients = {
				["super-control-board"] = 14,
				["tungstvar-plate"] = 5,
			},
		},
	},
--------------------------------------- TIER 9 --------------------------------------
	["neutronium"] = {
		Drill = {
			Drill_Speed = 19,
			Drill_Range = 22,
			Drill_Previous = "tungstvar",
			Drill_Next = "neutrobaltium",
			Drill_Ingredients = {
				["neutronium-stick"] = 20,
				["neutronium-plate"] = 50,
				["super-control-board"] = 25,
			},
		},
		Assembler = {
			Assembler_Speed_Mod = 1.66,
			Assembler_Previous = "electranium",
			Assembler_Next = "neutrobaltium",
			Assembler_Ingredients = {
				["neutronium-stick"] = 4,
				["neutronium-plate"] = 20,
				["extreme-control-board"] = 1,
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
				["extreme-control-board"] = 15,
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
				["extreme-control-board"] = 10,
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
		Chemical = {
			Chemical_Speed_Mod = 1.55,
			Chemical_Previous = "arditium-tungstenate",
			Chemical_Next = "neutronium",
			Chemical_Ingredients = {
				["neutronium-stick"] = 4,
				["neutronium-plate"] = 25,
				["extreme-control-board"] = 12,
			},
		},
		Accumulator = {
			Accumulator_Previous = "tungstvar",
			Accumulator_Next = "neutronium",
			Accumulator_Buffer_MJ = 70,
			Accumulator_Ingredients = {
				["extreme-control-board"] = 14,
				["neutronium-plate"] = 5,
				["neutronium-stick"] = 5,
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
				["neutrobaltium-cable"] = 15,
				["neutrobaltium-gear-wheel"] = 15,
				["controller"] = 10,
				["quantum-control-board"] = 25,
			},
			Logistic_Robot_Ingredients = {
				["neutrobaltium-plate"] = 10,
				["controller"] = 3,
				["quantum-control-board"] = 5,
			},
			Construction_Robot_Ingredients = {
				["neutrobaltium-plate"] = 10,
				["controller"] = 3,
				["quantum-control-board"] = 5,
			},	
		},
		Drill = {
			Drill_Speed = 25,
			Drill_Range = 25,
			Drill_Previous = "neutronium",
			Drill_Next = "neutrobaltium",
			Drill_Ingredients = {
				["neutrobaltium-gear-wheel"] = 20,
				["neutrobaltium-plate"] = 50,
				["quantum-control-board"] = 25,
			},
		},
		Assembler = {
			Assembler_Speed_Mod = 1.8,
			Assembler_Previous = "neutronium",
			Assembler_Next = "neutrobaltium",
			Assembler_Ingredients = {
				["neutrobaltium-gear-wheel"] = 4,
				["neutrobaltium-plate"] = 20,
				["quantum-control-board"] = 2,
			},
		},
		Refinery = {
			Refinery_Speed_Mod = 1.8,
			Refinery_Previous = "arditium-tungstenate",
			Refinery_Next = "neutrobaltium",
			Refinery_Ingredients = {
				["neutrobaltium-gear-wheel"] = 4,
				["neutrobaltium-plate"] = 50,
				["extreme-control-board"] = 25,
			},
		},
		Solar = {
			Solar_Production = 1500,
			Solar_Previous = "tungstvar",
			Solar_Next = "neutrobaltium",
			Solar_Ingredients = {
				["neutrobaltium-plate"] = 10,
				["quantum-control-board"] = 25,
			},
		},
		Centrifuge = {
			Centrifuge_Speed_Mod = 2.5,
			Centrifuge_Previous = "tungstvar",
			Centrifuge_Next = "neutrobaltium",
			Centrifuge_Ingredients = {
				["quantum-control-board"] = 5,
				["neutrobaltium-plate"] = 25,
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
				["quantum-control-board"] = 25,
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
				["neutrobaltium-plate"] = 10,
				["neutrobaltium-gear-wheel"] = 7,
				["neutrobaltium-pipe"] = 5,
				["quantum-control-board"] = 10,
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
				["quantum-control-board"] = 10,
			},
		},
		Furnace = {
			Furnace_Speed_Mod = 2,
			Furnace_Previous = "tungstvar",
			Furnace_Next = "neutrobaltium",
			Furnace_Ingredients = {
				["quantum-control-board"] = 5,
				["neutrobaltium-plate"] = 75,
				["heater"] = 50,
			},
		},
		Radar = {
			Radar_Previous = "arditium-tungstenate",
			Radar_Next = "neutrobaltium",
			Radar_Active_Range = 13,
			Radar_Scan_Range = 90,
			Radar_Ingredients = {
				["quantum-control-board"] = 20,
				["neutrobaltium-plate"] = 25,
				["neutrobaltium-gear-wheel"] = 15,
			},
		},
	},
	
}