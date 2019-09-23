local make_turret_lead = function(turret_prototype, speed)

  turret_prototype.attack_parameters.lead_target_for_projectile_speed = speed
end

local turrets = data.raw["ammo-turret"]

local Turrets_Changed =
{
  ["gun-turret"] = 1,

  --Rampant Arsenal turrets.
  ["rifle-ammo-turret-rampant-arsenal"] = 1,
  ["gun-ammo-turret-rampant-arsenal"] = 1,
  ["shotgun-ammo-turret-rampant-arsenal"] = 1,

  ["rocket-ammo-turret-rampant-arsenal"] = 0.5,
  ["rapid-rocket-ammo-turret-rampant-arsenal"] = 0.5,

  ["cannon-ammo-turret-rampant-arsenal"] = 0.5,
  ["rapid-cannon-ammo-turret-rampant-arsenal"] = 0.5,

}

for name, speed in pairs (Turrets_Changed) do
	if turrets[name] then
		make_turret_lead(turrets[name], speed * 1.05)
	end
end