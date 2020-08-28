require "data/core/functions/prefix"

Data_Warfare = {
--------------------------------------- TIER 1 --------------------------------------
	["stone"] = {
		Gun_Turret = {
			Range = 15,
			Dmg_Mod = 1,
			Shoot_Speed = (60 / 1),
			Next = "iron",
			Ingredients = {
				["stone-gear-wheel"] = 2,
				["stone-plate"] = 15,
				["gunpowder"] = 15,
				["turret-base-2x2"] = 1,
			},
		},
	},
--------------------------------------- TIER 2 --------------------------------------
	["iron"] = {
		Gun_Turret = {
			Range = 20,
			Dmg_Mod = 1.25,
			Shoot_Speed = (60 / 2),
			Previous = "stone",
			Next = "lead",
			Ingredients = {
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
			},
		},
	},
	["copper"] = {
	},
	["nickel"] = {
		Shotgun_Turret = {
			Range = 15,
			Dmg_Mod = 0.25,
			Shoot_Speed = (60 / 0.5),
			Next = "bronze",
			Ingredients = {
				["basic-control-board"] = 5,
				["nickel-gear-wheel"] = 2,
				["nickel-plate"] = 15,
				["turret-base-2x2"] = 1,
			},
		},
	},
	["silver"] = {
		Chaingun_Turret = {
			Range = 20,
			Dmg_Mod = 0.6,
			Shoot_Speed = (60 / 100),
			Next = "steel",
			Ingredients = {
				["basic-control-board"] = 8,
				["simple-motor"] = 2,
				["silver-plate"] = 25,
				["turret-base-3x3"] = 1,
			},
		},
	},
	["tin"] = {
		Laser_Turret = {
			Range = 30,
			Damage = 5,
			--Previous = "lead",
			Next = "lead",
			Ingredients = {
				["basic-control-board"] = 15,
				["iron-gear-wheel"] = 2,
				["tin-plate"] = 25,
				["copper-plate"] = 5,
				["turret-base-2x2"] = 1,
				["glass"] = 15,
			},
		},
	},
--------------------------------------- TIER 3 --------------------------------------
	["steel"] = {
		Chaingun_Turret = {
			Range = 25,
			Dmg_Mod = 0.75,
			Shoot_Speed = (60 / 150),
			Previous = "silver",
			Next = "invar",
			Ingredients = {
				["electronic-control-board"] = 5,
				["frame"] = 1,
				["electronic-motor"] = 5,
				["steel-plate"] = 75,
			},
		},
	},
	["gold"] = {
		Beam_Turret = {
			Range = 30,
			Damage = 15,
			--Previous = "lead",
			Next = "arditium",
			Ingredients = {
				["electronic-control-board"] = 2,
				["electronic-motor"] = 2,
				["gold-plate"] = 15,
				["diamond"] = 5,
				["glass"] = 10,
			},
		},
	},
	["bronze"] = {
		Shotgun_Turret = {
			Range = 24,
			Dmg_Mod = 0.5,
			Shoot_Speed = (60 / 1),
			Previous = "nickel",
			Next = "cobalt",
			Ingredients = {
				["electronic-control-board"] = 2,
				["bronze-gear-wheel"] = 2,
				["bronze-plate"] = 15,
				["rubber"] = 15,
			},
		},
	},
	["lead"] = {
		Gun_Turret = {
			Range = 28,
			Dmg_Mod = 1.5,
			Shoot_Speed = (60 / 3.5),
			Previous = "iron",
			Next = "invar",
			Ingredients = {
				["electronic-control-board"] = 2,
				["lead-gear-wheel"] = 2,
				["lead-plate"] = 15,
			},
		},
		Laser_Turret = {
			Range = 45,
			Damage = 15,
			Previous = "tin",
			Next = "electrum",
			Ingredients = {
				["electronic-control-board"] = 15,
				["lead-plate"] = 25,
				["glass"] = 25,
				["battery"] = 5,
			},
		},
	},
--------------------------------------- TIER 4 --------------------------------------
	["cobalt"] = {
		Shotgun_Turret = {
			Range = 33,
			Dmg_Mod = 0.75,
			Shoot_Speed = (60 / 1.5),
			Previous = "bronze",
			Next = "tungsten",
			Ingredients = {
				["advanced-control-board"] = 2,
				["cobalt-gear-wheel"] = 2,
				["cobalt-plate"] = 50,
				["housing"] = 1,
				["intake"] = 1,
			},
		},
	},
	["invar"] = {
		Gun_Turret = {
			Range = 39,
			Dmg_Mod = 1.75,
			Shoot_Speed = (60 / 5),
			Previous = "lead",
			Next = "arditium",
			Ingredients = {
				["advanced-control-board"] = 2,
				["invar-gear-wheel"] = 2,
				["invar-plate"] = 15,
				["housing"] = 1,
				["intake"] = 1,
			},
		},
		Chaingun_Turret = {
			Range = 30,
			Dmg_Mod = 0.9,
			Shoot_Speed = (60 / 200),
			Previous = "steel",
			Next = "titanium",
			Ingredients = {
				["advanced-control-board"] = 2,
				["electronic-motor"] = 2,
				["invar-plate"] = 150,
				["housing"] = 1,
				["intake"] = 1,
			},
		},
	},
	["electrum"] = {
		Cannon_Turret = {
			Range = 80,
			Dmg_Mod = 1,
			Shoot_Speed = (60 / 0.25),
			--Previous = "lead",
			Next = "tungsten",
			Ingredients = {
				["advanced-control-board"] = 2,
				["frame"] = 5,
				["electrum-plate"] = 50,
				["turret-base-5x5"] = 1,
				["housing"] = 1,
				["intake"] = 1,
			},
		},
		Laser_Turret = {
			Range = 60,
			Damage = 50,
			Previous = "lead",
			Ingredients = {
				["advanced-control-board"] = 25,
				["electrum-plate"] = 25,
				["battery"] = 25,
				["housing"] = 1,
				["intake"] = 1,
			},
		},
	},
--------------------------------------- TIER 5 --------------------------------------
	["stainless-steel"] = {
		Rocket_Turret = {
			Range = 80,
			Dmg_Mod = 1,
			Shoot_Speed = (60 / 0.5),
			--Previous = "lead",
			--Next = "arditium",
			Ingredients = {
				["tough-control-board"] = 2,
				["tough-motor"] = 5,
				["stainless-steel-plate"] = 15,
				["turret-base-3x3"] = 1,
				["logistic-unit"] = 1,
			},
		},
	},
	["arditium"] = {
		Gun_Turret = {
			Range = 50,
			Dmg_Mod = 2,
			Shoot_Speed = (60 / 6),
			Previous = "invar",
			Ingredients = {
				["tough-control-board"] = 2,
				["tough-motor"] = 5,
				["arditium-plate"] = 15,
				["logistic-unit"] = 1,
			},
		},
		Beam_Turret = {
			Range = 40,
			Damage = 30,
			Previous = "gold",
			Next = "arditium-tungstenate",
			Ingredients = {
				["tough-control-board"] = 2,
				["tough-motor"] = 5,
				["arditium-plate"] = 15,
				["diamond"] = 15,
				["glass"] = 10,
				["logistic-unit"] = 1,
			},
		},
	},
--------------------------------------- TIER 6 --------------------------------------
	["titanium"] = {
		Chaingun_Turret = {
			Range = 35,
			Dmg_Mod = 1.05,
			Shoot_Speed = (60 / 250),
			Previous = "invar",
			Ingredients = {
				["processing-control-board"] = 2,
				["tough-motor"] = 5,
				["titanium-plate"] = 150,
				["controller"] = 1,
			},
		},
	},
	["tungsten"] = {
		Shotgun_Turret = {
			Range = 40,
			Dmg_Mod = 1,
			Shoot_Speed = (60 / 2),
			Previous = "cobalt",
			Ingredients = {
				["processing-control-board"] = 2,
				["tough-motor"] = 5,
				["tungsten-plate"] = 150,
				["controller"] = 1,
			},
		},
		Cannon_Turret = {
			Range = 90,
			Dmg_Mod = 2,
			Shoot_Speed = (60 / 0.5),
			Previous = "electrum",
			Next = "electranium",
			Ingredients = {
				["processing-control-board"] = 2,
				["tough-motor"] = 5,
				["tungsten-plate"] = 150,
				["controller"] = 1,
			},
		},
	},
--------------------------------------- TIER 7 --------------------------------------
	["electranium"] = {
		Cannon_Turret = {
			Range = 100,
			Dmg_Mod = 5,
			Shoot_Speed = (60 / 0.75),
			Previous = "tungsten",
			Next = "tungstvar",
			Ingredients = {
				["logic-control-board"] = 2,
				["electranium-plate"] = 15,
			},
		},
	},
	["arditium-tungstenate"] = {
		Beam_Turret = {
			Range = 60,
			Damage = 50,
			Previous = "arditium",
			Next = "neutronium",
			Ingredients = {
				["logic-control-board"] = 2,
				["arditium-tungstenate-plate"] = 15,
				["diamond"] = 30,
				["glass"] = 10,
			},
		},
	},
--------------------------------------- TIER 8 --------------------------------------
	["tungstvar"] = {
		Cannon_Turret = {
			Range = 120,
			Dmg_Mod = 10,
			Shoot_Speed = (60 / 1),
			Previous = "electranium",
			Ingredients = {
				["super-control-board"] = 2,
				["tungstvar-plate"] = 15,
			},
		},
	},
--------------------------------------- TIER 9 --------------------------------------
	["neutronium"] = {
		Beam_Turret = {
			Range = 75,
			Damage = 100,
			Previous = "arditium-tungstenate",
			Ingredients = {
				["extreme-control-board"] = 2,
				["extreme-motor"] = 2,
				["neutronium-plate"] = 15,
				["diamond"] = 50,
				["glass"] = 15,
			},
		},
	},
--------------------------------------- TIER 10 -------------------------------------
	["neutrobaltium"] = {
	},
	
}