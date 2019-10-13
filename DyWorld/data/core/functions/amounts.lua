-- You can change amounts here. These represent the amount of entities
-- are generated through its scripts.
-- EXAMPLE: if Greenhouses is at 10, 10 greenhouses will be generated
-- each with increasing strength compared to previous tier
-- DO NOT INCREASE HIGHER THEN 100!!! It breaks the game xD (crashes the game)

Character_Loot_Range = 15
-- Character Looting Range

Expensive_Modifier = 5
-- Makes expensive recipes x this amount (default: 5)

Air_Filter_Amount = 5
-- Air_Filter_Amount default: 5

Transport_Belt_Modifier = 1.35
-- Increases Transport Belt Speed

Greenhouses_Amount = 5
-- Greenhouse default: 5

Pasture_Amount = 5
-- Pasture default: 5

Metallurgy_Machines_Amount = 5
-- Metallurgy_Machines_Amount default: 5

 --- Metallurgy Amounts ---
 
Ore_To_Molten_Ore_Amount = 10

Ore_To_Molten_Ratio = 15 
-- default: 15 (aka, 1 ore is 15 molten fluid)

Molten_To_Plate_Molten_Amount = 100

Molten_To_Plate_Ratio = 10
-- default: 10 (aka, 10 fluid is 1 plate)
-- if all defaults, melting ores give a 2:3 ratio. 20 ore give 30 plates

----- Warfare Enemies Data -----

Damages = {
	-- Tier 1 --
	["water"] = {
		Color = {r=0.12, g=0.12, b=1, a=1},
		Tier = 1,
		Health = 50,
		Spawn_Distance = 1.5,
		Opposite = "lightning",
		Range = 10,
		Enemy_Speed = 1,
		Enemy_Pollution = 0.1,
		Dying_Explosion = false,
		Dying_Splash = false,
		Ammo_Damage = 5,
		Ammo_Range = 10,
	},
	-- Tier 2 --
	["earth"] = {
		Color = {r=0.49, g=0.9, b=0.9, a=1},
		Tier = 2,
		Health = 70,
		Spawn_Distance = 2,
		Opposite = "explosion",
		Range = 5,
		Enemy_Speed = 0.1,
		Enemy_Pollution = 1,
		Dying_Explosion = false,
		Dying_Splash = false,
		Ammo_Damage = 2.5,
		Ammo_Range = 15,
	},
	-- Tier 3 --
	["electric"] = {
		Color = {r=0.49, g=0.46, b=0.9, a=1},
		Tier = 3,
		Health = 90,
		Spawn_Distance = 2.5,
		Opposite = "earth",
		Range = 25,
		Enemy_Speed = 2,
		Enemy_Pollution = 2.6,
		Dying_Explosion = false,
		Dying_Splash = true,
		Ammo_Damage = 5,
		Ammo_Range = 20,
	},
	-- Tier 4 --
	["chemical"] = {
		Color = {r=0.24, g=0.42, b=0.24, a=1},
		Tier = 4,
		Health = 100,
		Spawn_Distance = 3,
		Opposite = "impact",
		Range = 30,
		Enemy_Speed = 1.1,
		Enemy_Pollution = 5,
		Dying_Explosion = false,
		Dying_Splash = true,
		Ammo_Damage = 40,
		Ammo_Range = 27,
	},
	-- Tier 5 --
	["poison"] = {
		Color = {r=0.49, g=1, b=0.51, a=1},
		Tier = 5,
		Health = 50,
		Spawn_Distance = 3.5,
		Opposite = "water",
		Range = 24,
		Enemy_Speed = 0.8,
		Enemy_Pollution = 0.9,
		Dying_Explosion = false,
		Dying_Splash = true,
		Ammo_Damage = 7.5,
		Ammo_Range = 30,
	},
	-- Tier 6 --
	["fire"] = {
		Color = {r=1, g=0.12, b=0.12, a=1},
		Tier = 6,
		Health = 110,
		Spawn_Distance = 4,
		Opposite = "water",
		Range = 40,
		Enemy_Speed = 1.25,
		Enemy_Pollution = 0.6,
		Dying_Explosion = false,
		Dying_Splash = true,
		Ammo_Damage = 9,
		Ammo_Range = 75,
	},
	-- Tier 7 --
	["physical"] = {
		Color = {r=0.49, g=0.46, b=0.51, a=1},
		Tier = 7,
		Health = 250,
		Spawn_Distance = 4.5,
		Opposite = "laser",
		Range = 20,
		Enemy_Speed = 1,
		Enemy_Pollution = 1,
		Dying_Explosion = false,
		Dying_Splash = false,
		Ammo_Damage = 5,
		Ammo_Range = 25,
	},
	-- Tier 8 --
	["impact"] = {
		Color = {r=0.49, g=0.46, b=0.51, a=1},
		Tier = 8,
		Health = 500,
		Spawn_Distance = 5,
		Opposite = "chemical",
		Range = 20,
		Enemy_Speed = 1,
		Enemy_Pollution = 2.78,
		Dying_Explosion = false,
		Dying_Splash = false,
		Ammo_Damage = 100,
		Ammo_Range = 20,
	},
	-- Tier 9 --
	["explosion"] = {
		Color = {r=0.75, g=0.46, b=0.39, a=1},
		Tier = 9,
		Health = 50,
		Spawn_Distance = 5.5,
		Opposite = "sonic",
		Range = 30,
		Enemy_Speed = 1.32,
		Enemy_Pollution = 1.3,
		Dying_Explosion = true,
		Dying_Splash = false,
		Ammo_Damage = 25,
		Ammo_Range = 60,
	},
	-- Tier 10 --
	["sonic"] = {
		Color = {r=0.7, g=0.7, b=0.7, a=1},
		Tier = 10,
		Health = 125,
		Spawn_Distance = 6,
		Opposite = "explosion",
		Range = 50,
		Enemy_Speed = 2.5,
		Enemy_Pollution = 3.75,
		Dying_Explosion = true,
		Dying_Splash = false,
		Ammo_Damage = 1000,
		Ammo_Range = 50,
	},
	-- Tier 11 --
	["fusion"] = {
		Color = {r=0.02, g=0.12, b=0.4, a=1},
		Tier = 11,
		Health = 1000,
		Spawn_Distance = 6.5,
		Opposite = "plasma",
		Range = 35,
		Enemy_Speed = 1.5,
		Enemy_Pollution = 10,
		Dying_Explosion = true,
		Dying_Splash = true,
		Ammo_Damage = 85,
		Ammo_Range = 30,
	},
	-- Tier 12 --
	["laser"] = {
		Color = {r=1, g=1, b=0.51, a=1},
		Tier = 12,
		Health = 350,
		Spawn_Distance = 7,
		Opposite = "sonic",
		Range = 60,
		Enemy_Speed = 3,
		Enemy_Pollution = 1,
		Dying_Explosion = false,
		Dying_Splash = false,
		Ammo_Damage = 100,
		Ammo_Range = 75,
	},
	-- Tier 13 --
	["lightning"] = {
		Color = {r=0.12, g=0.12, b=0.8, a=1},
		Tier = 13,
		Health = 75,
		Spawn_Distance = 7,
		Opposite = "earth",
		Range = 75,
		Enemy_Speed = 4,
		Enemy_Pollution = 4.6,
		Dying_Explosion = false,
		Dying_Splash = true,
		Ammo_Damage = 5,
		Ammo_Range = 100,
	},
	-- Tier 14 --
	["acid"] = {
		Color = {r=0.49, g=1, b=0.51, a=1},
		Tier = 14,
		Health = 40,
		Spawn_Distance = 7.5,
		Opposite = "explosion",
		Range = 24,
		Enemy_Speed = 1.4,
		Enemy_Pollution = 0.8,
		Dying_Explosion = false,
		Dying_Splash = true,
		Ammo_Damage = 35,
		Ammo_Range = 32,
	},
	-- Tier 15 --
	["plasma"] = {
		Color = {r=0.12, g=0.8, b=0.8, a=1},
		Tier = 15,
		Health = 90,
		Spawn_Distance = 7.5,
		Opposite = "fusion",
		Range = 30,
		Enemy_Speed = 0.7,
		Enemy_Pollution = 1.5,
		Dying_Explosion = false,
		Dying_Splash = true,
		Ammo_Damage = 90,
		Ammo_Range = 80,
	},
	-- Tier 16 --
	["gas"] = {
		Color = {r=0.32, g=0.23, b=0.32, a=1},
		Tier = 16,
		Health = 300,
		Spawn_Distance = 8,
		Opposite = "sonic",
		Range = 15,
		Enemy_Speed = 0.6,
		Enemy_Pollution = 7.5,
		Dying_Explosion = false,
		Dying_Splash = true,
		Ammo_Damage = 45,
		Ammo_Range = 30,
	},
	-- Tier 17 --
	["fungal"] = {
		Color = {r=0.8, g=1, b=0.51, a=1},
		Tier = 17,
		Health = 100,
		Spawn_Distance = 8,
		Opposite = "fire",
		Range = 10,
		Enemy_Speed = 0.125,
		Enemy_Pollution = 1.75,
		Dying_Explosion = false,
		Dying_Splash = true,
		Ammo_Damage = 7.5,
		Ammo_Range = 25,
	},
	-- Tier 18 --
	["lava"] = {
		Color = {r=1, g=0.30, b=0.30, a=1},
		Tier = 18,
		Health = 2500,
		Spawn_Distance = 8.5,
		Opposite = "ice",
		Range = 10,
		Enemy_Speed = 0.2,
		Enemy_Pollution = 2.1,
		Dying_Explosion = false,
		Dying_Splash = true,
		Ammo_Damage = 150,
		Ammo_Range = 30,
	},
	-- Tier 19 --
	["fission"] = {
		Color = {r=0.02, g=0.02, b=0.02, a=1},
		Tier = 19,
		Health = 250,
		Spawn_Distance = 9,
		Opposite = "plasma",
		Range = 15,
		Enemy_Speed = 1.69,
		Enemy_Pollution = 3.5,
		Dying_Explosion = true,
		Dying_Splash = true,
		Ammo_Damage = 75,
		Ammo_Range = 30,
	},
	-- Tier 20 --
	["nuclear"] = {
		Color = {r=0.49, g=1, b=0.51, a=1},
		Tier = 20,
		Health = 5000,
		Spawn_Distance = 10,
		Opposite = "earth",
		Range = 50,
		Enemy_Speed = 1.45,
		Enemy_Pollution = 5,
		Dying_Explosion = true,
		Dying_Splash = true,
		Ammo_Damage = 250,
		Ammo_Range = 80,
	},
	["ice"] = {
		Color = {r=0.34, g=0.12, b=0.7, a=1},
		Tier = 20,
		Health = 10,
		Spawn_Distance = 9.5,
		Opposite = "lava",
		Range = 10,
		Enemy_Speed = 0.32,
		Enemy_Pollution = 0.5,
		Dying_Explosion = false,
		Dying_Splash = false,
		Ammo_Damage = 10,
		Ammo_Range = 20,
	},
}