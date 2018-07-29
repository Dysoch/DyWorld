dyworld_prefix = "dyworld-"
dy = "dyworld-"
dyworld_prefix_intermediate = "dyworld-intermediate-"
dyworld_debug_prefix = "dyworld-debug-"
primitive = "primitive"
basic = "basic"
intermediate = "intermediate"
enhanced = "enhanced"
advanced = "advanced"
godlike = "godlike"

-- amount of tiers for entities
-- can only be max of Color_Tier!!!!!!!!!!!!
Tiered_Entities = 9
Max_Tiers = 6

-- graphical
dyworld_path_icon = "__DyWorld__/graphics/icons/"
dyworld_path_fluid = "__DyWorld__/graphics/fluids/"
dyworld_path_tech = "__DyWorld__/graphics/technology/"
dyworld_path_entity = "__DyWorld__/graphics/entity/"
dyworld_path_tile = "__DyWorld__/graphics/tiles/"
dyworld_path_concrete = "__DyWorld__/graphics/terrain/concrete/"
dyworld_path_item_group = "__DyWorld__/graphics/item-group/"
dyworld_path_icon_temp = "__DyWorld__/graphics/icons/temp.png"

-- color tiers
Color_Tier = {
	[1] = {r=128, g=0, b=128}, --purple
	[2] = {r=255, g=255, b=0}, --yellow
	[3] = {r=165, g=42, b=42}, --brown
	[4] = {r=0, g=255, b=0}, --green
	[5] = {r=0, g=0, b=255}, --blue
	[6] = {r=255, g=0, b=0}, --red
	[7] = {r=0, g=255, b=255}, --cyan
	[8] = {r=255, g=165, b=0}, --orange
	[9] = {r=255, g=192, b=203}, --pink
	["Dirty"] = {r = 165, g = 165, b = 165},
}

Material_Colors = {
	Rubber = {r=128, g=128, b=128},
	Chitin = {r=228, g=128, b=128},
	Obsidian = {r=105, g=105, b=105},
	Wood = {r=182, g=155, b=76},
	Stone = {r=139, g=141, b=122},
	
	Iron = {r=82, g=174, b=212}, -- 52aed4
	Copper = {r=212, g=119, b=82}, -- d47752
	Chromium = {r=200, g=56, b=60}, -- c8383c
	Tin = {r=39, g=105, b=135}, -- 276987
	Silver = {r=170, g=170, b=170}, -- aaaaaa
	Lead = {r=105, g=213, b=212}, -- 69d5d4
	Gold = {r=134, g=128, b=34}, -- 868022
	Tungsten = {r=87, g=87, b=87}, -- 575757
	Zinc = {r=97, g=208, b=92}, -- 61d05c
	Nickel = {r=92, g=114, b=208}, -- 5c72d0
	Aluminium = {r=150, g=150, b=150}, -- 969696
	Lithium = {r=204, g=204, b=217}, -- ccccd9
	Titanium = {r=57, g=61, b=112}, -- 393d70
	Uranium = {r=21, g=121, b=10}, -- 15790a
	
	Steel = {r=229, g=227, b=227}, -- e5e3e3
	
	Stainless_Steel = {r=196, g=124, b=126}, -- c47c7e
	Bronze = {r=126, g=112, b=109}, -- 7e706d
	Billon = {r=191, g=145, b=126}, -- bf917e
	Copper_Tungsten = {r=137, g=135, b=142}, -- 89878e
	Copper_Hydride = {r=212, g=179, b=123}, -- d4b37b
	
	Lithium_Titaniate = {r=142, g=142, b=160}, -- 8e8ea0
	Elinvar = {r=125, g=115, b=160}, -- 7d73a0
	
	Stainless_Copilinvar_Tungstate = {r=153, g=124, b=143}, -- 997c8f
}

Material_Resistances = {
	Rubber = {
	  {type = "physical", decrease = 0, percent = -100},
	  {type = "impact", decrease = 0, percent = -100},
      {type = "poison", decrease = 0, percent = 25},
      {type = "explosion", decrease = 0, percent = -100},
      {type = "radiation", decrease = 0, percent = -100},
      {type = "fire", decrease = 0, percent = 35},
      {type = "laser", decrease = 0, percent = 10},
      {type = "acid", decrease = 0, percent = -50},
      {type = "electric", decrease = 5000, percent = 100}
	},
	Chitin = {
	  {type = "physical", decrease = 1, percent = 0},
	  {type = "impact", decrease = 1, percent = 0},
      {type = "poison", decrease = 0, percent = 10},
      {type = "explosion", decrease = -5, percent = 0},
      {type = "radiation", decrease = 0, percent = -100},
      {type = "fire", decrease = 0, percent = -25},
      {type = "laser", decrease = 0, percent = 2},
      {type = "acid", decrease = 5, percent = 75},
      {type = "electric", decrease = 2, percent = 0}
	},
	Obsidian = {
	  {type = "physical", decrease = 10, percent = 0},
	  {type = "impact", decrease = 10, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 5, percent = 0},
      {type = "radiation", decrease = 0, percent = 15},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Wood = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "radiation", decrease = 0, percent = 15},
      {type = "fire", decrease = 0, percent = -100},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	Stone = {
	  {type = "physical", decrease = 0, percent = 0},
	  {type = "impact", decrease = 0, percent = 0},
      {type = "poison", decrease = 0, percent = 0},
      {type = "explosion", decrease = 0, percent = 0},
      {type = "radiation", decrease = 0, percent = 15},
      {type = "fire", decrease = 0, percent = 0},
      {type = "laser", decrease = 0, percent = 0},
      {type = "acid", decrease = 0, percent = 0},
      {type = "electric", decrease = 0, percent = 0}
	},
	
	Iron = {
	  {type = "physical", decrease = 5, percent = 5},
	  {type = "impact", decrease = 5, percent = 10},
      {type = "poison", decrease = 0, percent = 2.5},
      {type = "explosion", decrease = 0, percent = 15},
      {type = "radiation", decrease = 0, percent = 15},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 45},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	Copper = {
	  {type = "physical", decrease = 5, percent = 5},
	  {type = "impact", decrease = 5, percent = 10},
      {type = "poison", decrease = 0, percent = 2.5},
      {type = "explosion", decrease = 0, percent = 15},
      {type = "radiation", decrease = 0, percent = 15},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 45},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	Chromium = {
	  {type = "physical", decrease = 5, percent = 5},
	  {type = "impact", decrease = 5, percent = 10},
      {type = "poison", decrease = 0, percent = 2.5},
      {type = "explosion", decrease = 0, percent = 15},
      {type = "radiation", decrease = 0, percent = 15},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 45},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	Tin = {
	  {type = "physical", decrease = 5, percent = 5},
	  {type = "impact", decrease = 5, percent = 10},
      {type = "poison", decrease = 0, percent = 2.5},
      {type = "explosion", decrease = 0, percent = 15},
      {type = "radiation", decrease = 0, percent = 15},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 45},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	Silver = {
	  {type = "physical", decrease = 5, percent = 5},
	  {type = "impact", decrease = 5, percent = 10},
      {type = "poison", decrease = 0, percent = 2.5},
      {type = "explosion", decrease = 0, percent = 15},
      {type = "radiation", decrease = 0, percent = 15},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 45},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	Lead = {
	  {type = "physical", decrease = 5, percent = 5},
	  {type = "impact", decrease = 5, percent = 10},
      {type = "poison", decrease = 0, percent = 2.5},
      {type = "explosion", decrease = 0, percent = 15},
      {type = "radiation", decrease = 0, percent = 15},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 45},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	Gold = {
	  {type = "physical", decrease = 5, percent = 5},
	  {type = "impact", decrease = 5, percent = 10},
      {type = "poison", decrease = 0, percent = 2.5},
      {type = "explosion", decrease = 0, percent = 15},
      {type = "radiation", decrease = 0, percent = 15},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 45},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	Tungsten = {
	  {type = "physical", decrease = 5, percent = 5},
	  {type = "impact", decrease = 5, percent = 10},
      {type = "poison", decrease = 0, percent = 2.5},
      {type = "explosion", decrease = 0, percent = 15},
      {type = "radiation", decrease = 0, percent = 15},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 45},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	Zinc = {
	  {type = "physical", decrease = 5, percent = 5},
	  {type = "impact", decrease = 5, percent = 10},
      {type = "poison", decrease = 0, percent = 2.5},
      {type = "explosion", decrease = 0, percent = 15},
      {type = "radiation", decrease = 0, percent = 15},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 45},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	Nickel = {
	  {type = "physical", decrease = 5, percent = 5},
	  {type = "impact", decrease = 5, percent = 10},
      {type = "poison", decrease = 0, percent = 2.5},
      {type = "explosion", decrease = 0, percent = 15},
      {type = "radiation", decrease = 0, percent = 15},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 45},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	Aluminium = {
	  {type = "physical", decrease = 5, percent = 5},
	  {type = "impact", decrease = 5, percent = 10},
      {type = "poison", decrease = 0, percent = 2.5},
      {type = "explosion", decrease = 0, percent = 15},
      {type = "radiation", decrease = 0, percent = 15},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 45},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	Lithium = {
	  {type = "physical", decrease = 5, percent = 5},
	  {type = "impact", decrease = 5, percent = 10},
      {type = "poison", decrease = 0, percent = 2.5},
      {type = "explosion", decrease = 0, percent = 15},
      {type = "radiation", decrease = 0, percent = 15},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 45},
      {type = "acid", decrease = 5000, percent = 100},
      {type = "electric", decrease = 0, percent = -50},
	},
	Titanium = {
	  {type = "physical", decrease = 5, percent = 10},
	  {type = "impact", decrease = 5, percent = 20},
      {type = "poison", decrease = 0, percent = 5},
      {type = "explosion", decrease = 0, percent = 30},
      {type = "radiation", decrease = 0, percent = 15},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 45},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	Uranium = {
	  {type = "physical", decrease = 5, percent = 5},
	  {type = "impact", decrease = 5, percent = 10},
      {type = "poison", decrease = 0, percent = 2.5},
      {type = "explosion", decrease = 0, percent = 15},
      {type = "radiation", decrease = 5000, percent = 100},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 45},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	
	Steel = {
	  {type = "physical", decrease = 5, percent = 10},
	  {type = "impact", decrease = 5, percent = 20},
      {type = "poison", decrease = 0, percent = 5},
      {type = "explosion", decrease = 0, percent = 30},
      {type = "radiation", decrease = 0, percent = 15},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 45},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	
	Stainless_Steel = {
	  {type = "physical", decrease = 5, percent = 15},
	  {type = "impact", decrease = 5, percent = 25},
      {type = "poison", decrease = 0, percent = 7.5},
      {type = "explosion", decrease = 0, percent = 25},
      {type = "radiation", decrease = 0, percent = 35},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 50},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	Bronze = {
	  {type = "physical", decrease = 5, percent = 15},
	  {type = "impact", decrease = 5, percent = 25},
      {type = "poison", decrease = 0, percent = 7.5},
      {type = "explosion", decrease = 0, percent = 25},
      {type = "radiation", decrease = 0, percent = 35},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 50},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	Billon = {
	  {type = "physical", decrease = 5, percent = 15},
	  {type = "impact", decrease = 5, percent = 25},
      {type = "poison", decrease = 0, percent = 7.5},
      {type = "explosion", decrease = 0, percent = 25},
      {type = "radiation", decrease = 0, percent = 35},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 50},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	Copper_Tungsten = {
	  {type = "physical", decrease = 5, percent = 15},
	  {type = "impact", decrease = 5, percent = 25},
      {type = "poison", decrease = 0, percent = 7.5},
      {type = "explosion", decrease = 0, percent = 25},
      {type = "radiation", decrease = 0, percent = 35},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 50},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	Copper_Hydride = {
	  {type = "physical", decrease = 5, percent = 15},
	  {type = "impact", decrease = 5, percent = 25},
      {type = "poison", decrease = 0, percent = 7.5},
      {type = "explosion", decrease = 0, percent = 25},
      {type = "radiation", decrease = 0, percent = 35},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 50},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	
	Elinvar = {
	  {type = "physical", decrease = 5, percent = 15},
	  {type = "impact", decrease = 5, percent = 25},
      {type = "poison", decrease = 0, percent = 7.5},
      {type = "explosion", decrease = 0, percent = 25},
      {type = "radiation", decrease = 0, percent = 35},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 50},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	Lithium_Titaniate = {
	  {type = "physical", decrease = 5, percent = 15},
	  {type = "impact", decrease = 5, percent = 25},
      {type = "poison", decrease = 0, percent = 7.5},
      {type = "explosion", decrease = 0, percent = 25},
      {type = "radiation", decrease = 0, percent = 35},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 50},
      {type = "acid", decrease = 0, percent = -25},
      {type = "electric", decrease = 0, percent = -50},
	},
	
	Stainless_Copilinvar_Tungstate = {
	  {type = "physical", decrease = 5, percent = 25},
	  {type = "impact", decrease = 5, percent = 45},
      {type = "poison", decrease = 0, percent = 15},
      {type = "explosion", decrease = 0, percent = 25},
      {type = "radiation", decrease = 0, percent = 35},
      {type = "fire", decrease = 0, percent = 80},
      {type = "laser", decrease = 0, percent = 50},
      {type = "acid", decrease = 0, percent = -12},
      {type = "electric", decrease = 0, percent = -75},
	},
}

-- Material Formulas to calculate everything
function DyWorld_Material_Formulas(TYPE, TABLE, OPT, OPT2)
	if TYPE == 1 then
		-- Belt Speed
		--return ((Materials[TABLE].Elasticity / 2) + Materials[TABLE].Density) / 426.67
		return ((((5 * OPT) + ((Materials[TABLE].Density * 0.25) + (Materials[TABLE].Hardness * 0.35) + (Materials[TABLE].Elasticity * 0.3))) * OPT2) / 426.67)
	elseif TYPE == 2 then
		-- Belt & Pipe Range
		--return math.floor((Materials[TABLE].Strength_Ultimate / Materials[TABLE].Elasticity) + 2)
		return ((3 * OPT) + math.floor((Materials[TABLE].Density * 0.1) + (Materials[TABLE].Hardness * 0.125) + (Materials[TABLE].Elasticity * 0.25)))
	elseif TYPE == 3 then
		-- Health
		return math.floor((Materials[TABLE].Density * Materials[TABLE].Hardness) + Materials[TABLE].Strength_Yield)
	elseif TYPE == 4 then
		-- Pipe Capacity
		--return math.floor((Materials[TABLE].Density * Materials[TABLE].Hardness) * Materials[TABLE].Elasticity)
		if ((250 - (40 * OPT)) - math.floor((Materials[TABLE].Density + Materials[TABLE].Hardness) * 0.5)) <= 2.5 then
			return 2.5
		else
			return ((250 - (40 * OPT)) - math.floor((Materials[TABLE].Density + Materials[TABLE].Hardness) * 0.5))
		end
	elseif TYPE == 5 then
		-- Turret / Ammo Range
		if Materials[TABLE].Tier == 1 then
			if math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density) >= 15 then
				return 15
			else
				if math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density) <= 0 then
					return (math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density) * -1 ) * 2
				else
					return math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density)
				end
			end
		elseif Materials[TABLE].Tier == 2 then
			if math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density) >= 30 then
				return 30
			else
				if math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density) <= 0 then
					return (math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density) * -1 ) * 2
				else
					return math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density)
				end
			end
		elseif Materials[TABLE].Tier == 3 then
			if math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density) >= 50 then
				return 50
			else
				if math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density) <= 0 then
					return (math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density) * -1 ) * 2
				else
					return math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density)
				end
			end
		elseif Materials[TABLE].Tier == 4 then
			if math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density) >= 80 then
				return 80
			else
				if math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density) <= 0 then
					return (math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density) * -1 ) * 2
				else
					return math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density)
				end
			end
		elseif Materials[TABLE].Tier == 5 then
			if math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density) >= 150 then
				return 150
			else
				if math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density) <= 0 then
					return (math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density) * -1 ) * 2
				else
					return math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density)
				end
			end
		elseif Materials[TABLE].Tier == 6 then
			if math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density) >= 250 then
				return 250
			else
				if math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density) <= 0 then
					return (math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density) * -1 ) * 2
				else
					return math.floor(((Materials[TABLE].Hardness * 1.5)+(Materials[TABLE].Elasticity * 3)) - Materials[TABLE].Density)
				end
			end
		end
	elseif TYPE == 6 then
		-- Turret Shoot Speed
		return Round(((Materials[TABLE].Hardness * 0.5)+ (Materials[TABLE].Elasticity * 0.3) * (Materials[TABLE].Density * 0.1)), 2)
	elseif TYPE == 7 then
		-- Turret Shoot Arc & Mag Size
		return math.floor(70 + Materials[TABLE].Elasticity)
	elseif TYPE == 8 then
		-- Ammo Damage
		return Round((((Materials[TABLE].Hardness * 1.25 * Materials[TABLE].Tier)+(Materials[TABLE].Elasticity * 0.5 * Materials[TABLE].Tier)) + (Materials[TABLE].Density * 0.1 * Materials[TABLE].Tier)), 2)
		--return Round(( damage (hardness * 1,25 * tier)+(elasticity * 0,5 *tier)  - (density * 1.2 * tier)), 2)
	elseif TYPE == 9 then
		-- Inserter Speed
		return Round((((Materials[TABLE].Hardness * 1.25) / (Materials[TABLE].Density * 1.5)) / OPT2), 2)
	elseif TYPE == 10 then
		-- Solar Power
		return math.floor(((OPT * 100) * Materials[TABLE].Conductivity) - Materials[TABLE].Density )
	elseif TYPE == 11 then
		-- Pole/Relay Supply Area
		return Round(((OPT * 1) + (Materials[TABLE].Density * 0.05) + (Materials[TABLE].Hardness * 0.125) + (Materials[TABLE].Elasticity * 0.0125) + (Materials[TABLE].Conductivity * 0.25)), 0)
	elseif TYPE == 12 then
		-- Pole Wire Reach
			if Round(((OPT * 2.5) + (Materials[TABLE].Density * 0.05) + (Materials[TABLE].Hardness * 0.125) + (Materials[TABLE].Elasticity * 0.0125) + (Materials[TABLE].Conductivity * 0.25)), 0) * 2 >= 64 then
				return 64
			else
				return Round(((OPT * 2.5) + (Materials[TABLE].Density * 0.05) + (Materials[TABLE].Hardness * 0.125) + (Materials[TABLE].Elasticity * 0.0125) + (Materials[TABLE].Conductivity * 0.25)), 0) * 2
			end
	elseif TYPE == 13 then
		-- Inventory Size
		return Round((((OPT * 10) + ((Materials[TABLE].Density * 0.5) + (Materials[TABLE].Hardness * 0.5) + (Materials[TABLE].Elasticity * 0.5))) * OPT2), 0)
	elseif TYPE == 14 then
		-- Module: Productivity
			if ((Materials[TABLE].Hardness * Materials[TABLE].Density) / 250) >= 2.5 then
				return 2.5
			else
				return ((Materials[TABLE].Hardness * Materials[TABLE].Density) / 250)
			end
	elseif TYPE == 15 then
		-- Module: Energy
			if ((Materials[TABLE].Conductivity * (Materials[TABLE].Hardness * Materials[TABLE].Density)) / 500) >= 2.5 then
				return 2.5
			else
				return ((Materials[TABLE].Conductivity * (Materials[TABLE].Hardness * Materials[TABLE].Density)) / 500)
			end
	elseif TYPE == 16 then
		-- Module: Speed
			if ((Materials[TABLE].Elasticity * Materials[TABLE].Density) / 1000) >= 2.5 then
				return 2.5
			else
				return ((Materials[TABLE].Elasticity * Materials[TABLE].Density) / 1000)
			end
	elseif TYPE == 17 then
		-- Module: Pollution
			if (((Materials[TABLE].Hardness * Materials[TABLE].Density) * Materials[TABLE].Elasticity) / 1000) >= 2.5 then
				return 2.5
			else
				return (((Materials[TABLE].Hardness * Materials[TABLE].Density) * Materials[TABLE].Elasticity) / 1000)
			end
	elseif TYPE == 18 then
		-- Pipe Capacity
		return math.floor((Materials[TABLE].Density * Materials[TABLE].Hardness) * Materials[TABLE].Elasticity)
	elseif TYPE == 19 then
		-- Assembler Speed
		return Round(((OPT * 0.1) + (Materials[TABLE].Density * 0.05) + (Materials[TABLE].Hardness * 0.125) + (Materials[TABLE].Elasticity * 0.0125)), 2)
	elseif TYPE == 20 then
		-- Power Usage
		return tostring(math.floor(((OPT * 50) + ((Materials[TABLE].Conductivity) * ((Materials[TABLE].Density * 0.125) + (Materials[TABLE].Hardness * 0.2) + (Materials[TABLE].Elasticity * 0.05)))) * OPT2)).."kW"
	elseif TYPE == 21 then
		-- Pump Speed
		return math.floor((OPT * 100) + ((Materials[TABLE].Conductivity * 0.1) + ((Materials[TABLE].Density * 0.1) + (Materials[TABLE].Hardness * 0.5) + (Materials[TABLE].Elasticity * 0.5))))
	elseif TYPE == 22 then
		-- Roboport Range
		return math.floor((OPT * 15) + ((Materials[TABLE].Conductivity * 0.15) + ((Materials[TABLE].Density * 0.25) + (Materials[TABLE].Hardness * 0.1) + (Materials[TABLE].Elasticity * 0.124))))
	elseif TYPE == 23 then
		-- Mining Hardness
		return Round(((OPT) + (Materials[TABLE].Hardness * (1 + (OPT * 0.25)))), 2)
	elseif TYPE == 24 then
		-- Mining Time
		return Round(((OPT ) + ((Materials[TABLE].Density * 0.1) * (Materials[TABLE].Hardness * 0.1))), 2)
	elseif TYPE == 25 then
		-- Power Usage
		return tostring(math.floor(((OPT * 50) + ((Materials[TABLE].Conductivity) * ((Materials[TABLE].Density * 0.125) + (Materials[TABLE].Hardness * 0.2) + (Materials[TABLE].Elasticity * 0.05)))) * OPT2)).."kJ"
	end
end

-- Material Properties (for metallurgy and other stuff)
Materials = {
	Stone = {
		Tier = 1,
		Density = 12.55,
		Hardness = 5,
		Elasticity = 1,
		Conductivity = 0,
		Strength_Yield = 1,
		Strength_Ultimate = 15,
		Melting_Point = 100,
		Boiling_Point = 5000,
		Icon = {icon = "__base__/graphics/icons/stone.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/stone.png"},
	},
	Rubber = {
		Tier = 3,
		Density = 1.2,
		Hardness = 5,
		Elasticity = 100,
		Conductivity = 0,
		Strength_Yield = 5,
		Strength_Ultimate = 35,
		Melting_Point = nil,
		Boiling_Point = nil,
		Icon = {icon = dyworld_path_icon.."rubber.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/rubber.png"},
	},
	Chitin = {
		Tier = 1,
		Density = 0.6,
		Hardness = 2,
		Elasticity = 51,
		Conductivity = 0,
		Strength_Yield = 7,
		Strength_Ultimate = 61,
		Melting_Point = nil,
		Boiling_Point = nil,
		Icon = {icon = dyworld_path_icon.."chitin.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/chitin.png"},
	},
	Obsidian = {
		Tier = 2,
		Density = 3.6,
		Hardness = 6,
		Elasticity = 13.5,
		Conductivity = 0,
		Strength_Yield = 300,
		Strength_Ultimate = 450,
		Melting_Point = nil,
		Boiling_Point = nil,
		Icon = {icon = dyworld_path_icon.."obsidian.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/obsidian.png"},
	},
	Wood = {
		Tier = 1,
		Density = 7.5,
		Hardness = 2.25,
		Elasticity = 11,
		Conductivity = 0,
		Strength_Yield = 1,
		Strength_Ultimate = 40,
		Melting_Point = nil,
		Boiling_Point = nil,
		Icon = {icon = "__base__/graphics/icons/wood.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/wood.png"},
	},
	-- Basic
	Iron = {
		Tier = 1,
		Density = 7.874,
		Hardness = 4,
		Elasticity = 28.5,
		Conductivity = 1.04,
		Strength_Yield = 130,
		Strength_Ultimate = 200,
		Melting_Point = 1538,
		Boiling_Point = 2862,
		Icon = {icon = dyworld_path_icon.."plate/iron.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/iron.png"},
	},
	Copper = {
		Tier = 1,
		Density = 8.94,
		Hardness = 3,
		Elasticity = 17,
		Conductivity = 5.98,
		Strength_Yield = 70,
		Strength_Ultimate = 220,
		Melting_Point = 1084,
		Boiling_Point = 2562,
		Icon = {icon = dyworld_path_icon.."plate/copper.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/copper.png"},
	},
	Chromium = {
		Tier = 3,
		Density = 7.19,
		Hardness = 8.5,
		Elasticity = 36,
		Conductivity = 5.1,
		Strength_Yield = 160,
		Strength_Ultimate = 280,
		Melting_Point = 1860,
		Boiling_Point = 2670,
		Icon = {icon = dyworld_path_icon.."plate/chromium.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/chromium.png"},
	},
	Tin = {
		Tier = 2,
		Density = 7.28,
		Hardness = 1.5,
		Elasticity = 47,
		Conductivity = 8.7,
		Strength_Yield = 9,
		Strength_Ultimate = 19,
		Melting_Point = 232,
		Boiling_Point = 2600,
		Icon = {icon = dyworld_path_icon.."plate/tin.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/tin.png"},
	},
	Silver = {
		Tier = 2,
		Density = 10.49,
		Hardness = 2.75,
		Elasticity = 10.5,
		Conductivity = 6.3,
		Strength_Yield = 55,
		Strength_Ultimate = 360,
		Melting_Point = 961,
		Boiling_Point = 2212,
		Icon = {icon = dyworld_path_icon.."plate/silver.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/silver.png"},
	},
	Gold = {
		Tier = 2,
		Density = 19.32,
		Hardness = 2.75,
		Elasticity = 10.8,
		Conductivity = 4.52,
		Strength_Yield = 190,
		Strength_Ultimate = 220,
		Melting_Point = 1063,
		Boiling_Point = 2800,
		Icon = {icon = dyworld_path_icon.."plate/gold.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/gold.png"},
	},
	Lead = {
		Tier = 2,
		Density = 11.34,
		Hardness = 1.5,
		Elasticity = 2,
		Conductivity = 4.87,
		Strength_Yield = 19,
		Strength_Ultimate = 32,
		Melting_Point = 327,
		Boiling_Point = 1750,
		Icon = {icon = dyworld_path_icon.."plate/lead.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/lead.png"},
	},
	Tungsten = {
		Tier = 3,
		Density = 19.25,
		Hardness = 7.5,
		Elasticity = 40.5,
		Conductivity = 1.82,
		Strength_Yield = 500,
		Strength_Ultimate = 1000,
		Melting_Point = 3422,
		Boiling_Point = 5000,
		Icon = {icon = dyworld_path_icon.."plate/tungsten.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/tungsten.png"},
	},
	Lithium = {
		Tier = 2,
		Density = 0.534,
		Hardness = 0.6,
		Elasticity = 40.5,
		Conductivity = 82.5,
		Strength_Yield = 4.9,
		Strength_Ultimate = 4.2,
		Melting_Point = 453,
		Boiling_Point = 1620,
		Icon = {icon = dyworld_path_icon.."plate/lithium.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/lithium.png"},
	},
	Titanium = {
		Tier = 3,
		Density = 4.56,
		Hardness = 6.0,
		Elasticity = 38.75,
		Conductivity = 1.64,
		Strength_Yield = 116,
		Strength_Ultimate = 44,
		Melting_Point = 1668,
		Boiling_Point = 3287,
		Icon = {icon = dyworld_path_icon.."plate/titanium.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/titanium.png"},
	},
	Zinc = {
		Tier = 2,
		Density = 7.14,
		Hardness = 2.5,
		Elasticity = 12,
		Conductivity = 11.6,
		Strength_Yield = 43,
		Strength_Ultimate = 108,
		Melting_Point = 419,
		Boiling_Point = 907,
		Icon = {icon = dyworld_path_icon.."plate/zinc.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/zinc.png"},
	},
	Nickel = {
		Tier = 2,
		Density = 8.91,
		Hardness = 4,
		Elasticity = 31,
		Conductivity = 9.09,
		Strength_Yield = 76,
		Strength_Ultimate = 200,
		Melting_Point = 1455,
		Boiling_Point = 2730,
		Icon = {icon = dyworld_path_icon.."plate/nickel.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/nickel.png"},
	},
	Aluminium = {
		Tier = 2,
		Density = 2.7,
		Hardness = 2.75,
		Elasticity = 10,
		Conductivity = 2.37,
		Strength_Yield = 26,
		Strength_Ultimate = 70,
		Melting_Point = 660,
		Boiling_Point = 2470,
		Icon = {icon = dyworld_path_icon.."plate/aluminium.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/aluminium.png"},
	},
	Uranium = {
		Tier = 4,
		Density = 19.1,
		Hardness = 6.0,
		Elasticity = 1.9,
		Conductivity = 0,
		Strength_Yield = 205,
		Strength_Ultimate = 111,
		Melting_Point = 1132,
		Boiling_Point = 4131,
		Icon = {icon = dyworld_path_icon.."plate/uranium.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/uranium.png"},
	},
	-- Simple Alloy
	Steel = {
		Tier = 3,
		Density = 11.81,
		Hardness = 6,
		Elasticity = 42.75,
		Conductivity = 1.56,
		Strength_Yield = 195,
		Strength_Ultimate = 300,
		Melting_Point = 1425,
		Boiling_Point = 2862,
		Icon = {icon = "__base__/graphics/icons/steel-plate.png", scale = 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/steel.png"},
	},
	-- Alloy
	Stainless_Steel = {
		-- mix of steel and chromium
		Tier = 4,
		Density = 19,
		Hardness = 14.5,
		Elasticity = 78.75,
		Conductivity = 6.66,
		Strength_Yield = 355,
		Strength_Ultimate = 580,
		Melting_Point = 1643,
		Boiling_Point = 2766,
		Icon = {icon = dyworld_path_icon.."alloy/stainless-steel.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/stainless-steel.png"},
	},
	Bronze = {
		-- mix of copper and tin
		Tier = 4,
		Density = 16.22,
		Hardness = 4.50,
		Elasticity = 64,
		Conductivity = 14.68,
		Strength_Yield = 79,
		Strength_Ultimate = 239,
		Melting_Point = 658,
		Boiling_Point = 2581,
		Icon = {icon = dyworld_path_icon.."alloy/bronze.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/bronze.png"},
	},
	Billon = {
		-- mix of copper and silver
		Tier = 4,
		Density = 19.43,
		Hardness = 5.75,
		Elasticity = 27.5,
		Conductivity = 12.28,
		Strength_Yield = 125,
		Strength_Ultimate = 580,
		Melting_Point = 1023,
		Boiling_Point = 2387,
		Icon = {icon = dyworld_path_icon.."alloy/billon.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/billon.png"},
	},
	Copper_Tungsten = {
		-- mix of copper and tungsten
		Tier = 4,
		Density = 28.19,
		Hardness = 10.5,
		Elasticity = 57.50,
		Conductivity = 7.8,
		Strength_Yield = 570,
		Strength_Ultimate = 1220,
		Melting_Point = 2253,
		Boiling_Point = 3781,
		Icon = {icon = dyworld_path_icon.."alloy/copper-tungsten.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/copper-tungsten.png"},
	},
	Copper_Hydride = {
		-- mix of copper and hydrogen
		Tier = 4,
		Density = 13.41,
		Hardness = 4.5,
		Elasticity = 25.2,
		Conductivity = 8.97,
		Strength_Yield = 105,
		Strength_Ultimate = 330,
		Melting_Point = 1626,
		Boiling_Point = 3843,
		Icon = {icon = dyworld_path_icon.."alloy/copper-hydride.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/copper-hydride.png"},
	},
	-- Compex Alloy
	Elinvar = {
		-- mix of iron, chromium and nickel
		Tier = 5,
		Density = 23.97,
		Hardness = 16.5,
		Elasticity = 95.50,
		Conductivity = 15.23,
		Strength_Yield = 366,
		Strength_Ultimate = 680,
		Melting_Point = 1618,
		Boiling_Point = 2754,
		Icon = {icon = dyworld_path_icon.."alloy/elinvar.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/elinvar.png"},
	},
	Lithium_Titaniate = {
		Tier = 5,
		Density = 19.934,
		Hardness = 8.1,
		Elasticity = 60,
		Conductivity = 85.5,
		Strength_Yield = 204.9,
		Strength_Ultimate = 504.2,
		Melting_Point = 867,
		Boiling_Point = 3200,
		Icon = {icon = dyworld_path_icon.."plate/lithium.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/lithium.png"},
	},
	-- Super Alloy
	Stainless_Copilinvar_Tungstate = {
		-- mix of Elinvar and Copper_Tungsten and Stainless Steel
		Tier = 6,
		Density = 71.16,
		Hardness = 41.5,
		Elasticity = 231.75,
		Conductivity = 29.69,
		Strength_Yield = 1291,
		Strength_Ultimate = 2480,
		Melting_Point = 1838,
		Boiling_Point = 2750,
		Icon = {icon = dyworld_path_icon.."alloy/stainless-copilinvar-tungstate.png", scale= 0.6, shift = {8, 9}},
		Icon_Tech = {icon = dyworld_path_tech.."material-system/stainless-copilinvar-tungstate.png"},
	},
}

function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

Material_Table = {}