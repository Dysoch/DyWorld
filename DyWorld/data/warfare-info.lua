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
			--Previous = "lead",
			--Next = "arditium",
			Ingredients = {
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
				["turret-base-2x2"] = 1,
			},
		},
	},
	["silver"] = {
		Chaingun_Turret = {
			Range = 20,
			Dmg_Mod = 0.6,
			Shoot_Speed = (60 / 100),
			--Previous = "stone",
			Next = "steel",
			Ingredients = {
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
				["turret-base-3x3"] = 1,
			},
		},
	},
	["tin"] = {
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
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
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
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
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
			--Previous = "lead",
			--Next = "arditium",
			Ingredients = {
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
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
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
			},
		},
	},
--------------------------------------- TIER 4 --------------------------------------
	["cobalt"] = {
		Shotgun_Turret = {
			Range = 33,
			Dmg_Mod = 0.75,
			Shoot_Speed = (60 / 1.5),
			--Previous = "lead",
			--Next = "arditium",
			Ingredients = {
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
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
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
			},
		},
		Chaingun_Turret = {
			Range = 30,
			Dmg_Mod = 0.9,
			Shoot_Speed = (60 / 200),
			Previous = "steel",
			Next = "titanium",
			Ingredients = {
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
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
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
				["turret-base-5x5"] = 1,
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
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
				["turret-base-3x3"] = 1,
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
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
			},
		},
		Beam_Turret = {
			Range = 40,
			Damage = 30,
			Previous = "gold",
			Next = "arditium-tungstenate",
			Ingredients = {
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
				["diamond"] = 15,
				["glass"] = 10,
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
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
			},
		},
	},
	["tungsten"] = {
		Shotgun_Turret = {
			Range = 40,
			Dmg_Mod = 1,
			Shoot_Speed = (60 / 2),
			--Previous = "lead",
			--Next = "arditium",
			Ingredients = {
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
			},
		},
		Cannon_Turret = {
			Range = 90,
			Dmg_Mod = 2,
			Shoot_Speed = (60 / 0.5),
			Previous = "electrum",
			Next = "electranium",
			Ingredients = {
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
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
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
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
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
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
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
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
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
				["diamond"] = 50,
				["glass"] = 15,
			},
		},
	},
--------------------------------------- TIER 10 -------------------------------------
	["neutrobaltium"] = {
	},
	
}