require "data/core/functions/prefix"

Data_Warfare = {
--------------------------------------- TIER 1 --------------------------------------
	["stone"] = {
		Gun_Turret = {
			Range = 15,
			Dmg_Mod = 1,
			Shoot_Speed = (60 / 5),
			Next = "iron",
			Ingredients = {
				["stone-gear-wheel"] = 2,
				["stone-plate"] = 15,
				["gunpowder"] = 15,
			},
		},
	},
--------------------------------------- TIER 2 --------------------------------------
	["iron"] = {
		Gun_Turret = {
			Range = 20,
			Dmg_Mod = 1.25,
			Shoot_Speed = (60 / 8),
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
			},
		},
	},
	["silver"] = {
	},
	["tin"] = {
	},
--------------------------------------- TIER 3 --------------------------------------
	["steel"] = {
	},
	["gold"] = {
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
			Shoot_Speed = (60 / 12),
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
			Shoot_Speed = (60 / 17),
			Previous = "lead",
			Next = "arditium",
			Ingredients = {
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
			},
		},
	},
	["electrum"] = {
	},
--------------------------------------- TIER 5 --------------------------------------
	["stainless-steel"] = {
	},
	["arditium"] = {
		Gun_Turret = {
			Range = 50,
			Dmg_Mod = 2,
			Shoot_Speed = (60 / 22),
			Previous = "invar",
			Ingredients = {
				["basic-control-board"] = 2,
				["iron-gear-wheel"] = 2,
				["iron-plate"] = 15,
			},
		},
	},
--------------------------------------- TIER 6 --------------------------------------
	["titanium"] = {
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
	},
--------------------------------------- TIER 7 --------------------------------------
	["electranium"] = {
	},
	["arditium-tungstenate"] = {
	},
--------------------------------------- TIER 8 --------------------------------------
	["tungstvar"] = {
	},
--------------------------------------- TIER 9 --------------------------------------
	["neutronium"] = {
	},
--------------------------------------- TIER 10 -------------------------------------
	["neutrobaltium"] = {
	},
	
}