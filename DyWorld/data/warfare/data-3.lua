
if settings.startup["DyWorld_Collision_Projectiles"].value then
require("data.warfare.collisions.add-collision")
end










for k, gun in pairs (data.raw.gun) do
	gun.stack_size = 1
	gun.attack_parameters.movement_slow_down_factor = 0
end

-- TEST: Leading gun turrets
--Make gun turrets lead the target
--[[
local make_turret_lead = function(turret_prototype, speed)

  turret_prototype.attack_parameters.lead_target_for_projectile_speed = speed
end

local turrets = data.raw["ammo-turret"]

local leads =
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

for name, speed in pairs (leads) do
  if turrets[name] then
    make_turret_lead(turrets[name], speed * 1.05) -- + 5% to workaround some too precise maths with projectile shooting positions.
  end
end]]--