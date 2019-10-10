require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

function DyWorld_Turret_Lead(turret_prototype, speed)
	turret_prototype.attack_parameters.lead_target_for_projectile_speed = speed
end

local Ammo_Turrets = data.raw["ammo-turret"]
local Electric_Turrets = data.raw["electric-turret"]
local Fluid_Turrets = data.raw["fluid-turret"]
local Artillery_Turrets = data.raw["artillery-turret"]

local Turrets_Changed_Leading =
{
	["gun-turret"] = 1,
	
	["stone-gun-turret"] = 1,
	["iron-gun-turret"] = 1,
	["lead-gun-turret"] = 1,
	["invar-gun-turret"] = 1,
	["arditium-gun-turret"] = 1,
	
	["nickel-shotgun-turret"] = 1,
	["bronze-shotgun-turret"] = 1,
	["cobalt-shotgun-turret"] = 1,
	["tungsten-shotgun-turret"] = 1,
	
	["sniper-turret"] = 1,
}

local Turrets_Changed_Rest =
{
	"gun-turret",
	
	"stone-gun-turret",
	"iron-gun-turret",
	"lead-gun-turret",
	"invar-gun-turret",
	"arditium-gun-turret",
	
	"nickel-shotgun-turret",
	"bronze-shotgun-turret",
	"cobalt-shotgun-turret",
	"tungsten-shotgun-turret",
	
	"sniper-turret",
	
	"laser-turret",
	
	"flamethrower-turret",
}

local Turrets_Changed_To_8_Ways =
{
	"gun-turret",
	
	"stone-gun-turret",
	"iron-gun-turret",
	"lead-gun-turret",
	"invar-gun-turret",
	"arditium-gun-turret",
	
	"nickel-shotgun-turret",
	"bronze-shotgun-turret",
	"cobalt-shotgun-turret",
	"tungsten-shotgun-turret",
	
	"sniper-turret",
	
	"laser-turret",
}

for name, speed in pairs (Turrets_Changed_Leading) do
	if Ammo_Turrets[name] then
		DyWorld_Turret_Lead(Ammo_Turrets[name], speed * 1.05)
	end
end

for index, name in pairs (Turrets_Changed_Rest) do
	if Ammo_Turrets[name] then
		Ammo_Turrets[name].max_health = Round(Ammo_Turrets[name].max_health * 25)
		if Ammo_Turrets[name].attack_parameters then
			if Ammo_Turrets[name].attack_parameters.range then
				Ammo_Turrets[name].attack_parameters.min_range = math.ceil(Ammo_Turrets[name].attack_parameters.range * 0.05)
			else
				Ammo_Turrets[name].attack_parameters.min_range = 2
			end
			Ammo_Turrets[name].attack_parameters.turn_range = 90 / 360
			Ammo_Turrets[name].turret_base_has_direction = true
		end
	end
	if Electric_Turrets[name] then
		Electric_Turrets[name].max_health = Round(Electric_Turrets[name].max_health * 25)
		if Electric_Turrets[name].attack_parameters then
			if Electric_Turrets[name].attack_parameters.range then
				Electric_Turrets[name].attack_parameters.min_range = math.ceil(Electric_Turrets[name].attack_parameters.range * 0.05)
			else
				Electric_Turrets[name].attack_parameters.min_range = 2
			end
			Electric_Turrets[name].attack_parameters.turn_range = 90 / 360
			Electric_Turrets[name].turret_base_has_direction = true
		end
	end
	if Fluid_Turrets[name] then
		Fluid_Turrets[name].max_health = Round(Fluid_Turrets[name].max_health * 25)
		if Fluid_Turrets[name].attack_parameters then
			if Fluid_Turrets[name].attack_parameters.range then
				Fluid_Turrets[name].attack_parameters.min_range = math.ceil(Fluid_Turrets[name].attack_parameters.range * 0.05)
			else
				Fluid_Turrets[name].attack_parameters.min_range = 2
			end
			Fluid_Turrets[name].attack_parameters.turn_range = 135 / 360
			Fluid_Turrets[name].turret_base_has_direction = true
		end
	end
end

for index, name in pairs (Turrets_Changed_To_8_Ways) do
	if Ammo_Turrets[name] then
		if Ammo_Turrets[name].flags then
			local INSERT = "building-direction-8-way"
			table.insert(Ammo_Turrets[name].flags, INSERT)
		end
	end
	if Electric_Turrets[name] then
		if Electric_Turrets[name].flags then
			local INSERT = "building-direction-8-way"
			table.insert(Electric_Turrets[name].flags, INSERT)
		end
	end
end
