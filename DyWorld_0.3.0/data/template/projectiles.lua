require "data/prefix"

Data_Table_Projectiles = {
	-- Type 1 = bullets
	-- Type 2 = sniper bullets
	-- Type 3 = lightning
	-- Type 4 = lasers
	-- Type 5 = piercing lasers
	{
		Name = dyworld_prefix.."projectile-basic-01",
		Projectile_Type = 1,
		Dmg = 1,
		DmgType= "physical",
		Tint = {r=1.0, g=1.0, b=1.0}
	},
	{
		Name = dyworld_prefix.."projectile-basic-02",
		Projectile_Type = 1,
		Dmg = 3,
		DmgType= "physical",
		Tint = {r=1.0, g=1.0, b=1.0}
	},
	{
		Name = dyworld_prefix.."projectile-basic-03",
		Projectile_Type = 1,
		Dmg = 5,
		DmgType= "physical",
		Tint = {r=1.0, g=1.0, b=1.0}
	},
	{
		Name = dyworld_prefix.."projectile-basic-04",
		Projectile_Type = 1,
		Dmg = 8,
		DmgType= "physical",
		Tint = {r=1.0, g=1.0, b=1.0}
	},
	{
		Name = dyworld_prefix.."projectile-sniper-01",
		Projectile_Type = 2,
		Dmg = 5,
		DmgType= "physical",
		Tint = {r=1.0, g=1.0, b=1.0}
	},
	{
		Name = dyworld_prefix.."projectile-sniper-02",
		Projectile_Type = 2,
		Dmg = 10,
		DmgType= "physical",
		Tint = {r=1.0, g=1.0, b=1.0}
	},
	{
		Name = dyworld_prefix.."projectile-sniper-03",
		Projectile_Type = 2,
		Dmg = 15,
		DmgType= "physical",
		Tint = {r=1.0, g=1.0, b=1.0}
	},
	{
		Name = dyworld_prefix.."projectile-sniper-04",
		Projectile_Type = 2,
		Dmg = 30,
		DmgType= "physical",
		Tint = {r=1.0, g=1.0, b=1.0}
	},
	{
		Name = dyworld_prefix.."projectile-electric-01",
		Projectile_Type = 3,
		Dmg = 0.005,
		DmgType= "electric",
		Tint = {r=125, g=249, b=255}
	},
	{
		Name = dyworld_prefix.."projectile-laser-01",
		Projectile_Type = 4,
		Dmg = 15,
		DmgType= "laser",
		Tint = {r=125, g=0, b=0}
	},
	{
		Name = dyworld_prefix.."projectile-laser-02",
		Projectile_Type = 4,
		Dmg = 20,
		DmgType= "laser",
		Tint = {r=125, g=0, b=0}
	},
	{
		Name = dyworld_prefix.."projectile-laser-03",
		Projectile_Type = 5,
		Dmg = 60,
		DmgType= "laser",
		Tint = {r=125, g=0, b=0}
	},
	{
		Name = dyworld_prefix.."projectile-laser-04",
		Projectile_Type = 4,
		Dmg = 30,
		DmgType= "laser",
		Tint = {r=0, g=0, b=125}
	},
	{
		Name = dyworld_prefix.."projectile-laser-05",
		Projectile_Type = 4,
		Dmg = 40,
		DmgType= "laser",
		Tint = {r=0, g=0, b=125}
	},
	{
		Name = dyworld_prefix.."projectile-laser-06",
		Projectile_Type = 5,
		Dmg = 120,
		DmgType= "laser",
		Tint = {r=0, g=0, b=125}
	},
}

function DyWorld_Projectile_1(NAME, DMG, DMGTYPE, TINT)
	local result =
  {
    type = "projectile",
    name = NAME,
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = {amount = DMG, type = DMGTYPE}
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      tint = TINT,
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
	}
  }
  return result
end

function DyWorld_Projectile_2(NAME, DMG, DMGTYPE, TINT)
	local result =
  {
    type = "projectile",
    name = NAME,
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
    direction_only = true,
    piercing_damage = DMG,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = {amount = DMG, type = DMGTYPE}
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      tint = TINT,
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
	}
  }
  return result
end

function DyWorld_Projectile_3(NAME, DMG, DMGTYPE, TINT)
	local result =
  {
    type = "projectile",
    name = NAME,
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0.05,
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = DMG, type = DMGTYPE}
          }
        }
      }
    },
    light = {intensity = 0.75, size = 15},
    animation =
    {
      filename = "__base__/graphics/entity/laser/laser-to-tint-medium.png",
      tint = TINT,
      frame_count = 1,
      width = 12,
      height = 33,
      priority = "high",
      blend_mode = "additive"
    },
  }
  return result
end

function DyWorld_Projectile_4(NAME, DMG, DMGTYPE, TINT)
	local result =
  {
    type = "projectile",
    name = NAME,
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0.05,
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
       target_effects =
        {
          {
            type = "create-entity",
            entity_name = "laser-bubble"
          },
          {
            type = "damage",
            damage = { amount = DMG, type = DMGTYPE}
          }
        }
      }
    },
    light = {intensity = 0.5, size = 5},
    animation =
    {
      filename = "__base__/graphics/entity/laser/laser-to-tint-medium.png",
      tint = TINT,
      frame_count = 1,
      width = 12,
      height = 33,
      priority = "high",
      blend_mode = "additive"
    },
  }
  return result
end

function DyWorld_Projectile_5(NAME, DMG, DMGTYPE, TINT)
	local result =
  {
    type = "projectile",
    name = NAME,
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0.05,
    direction_only = true,
    piercing_damage = DMG,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
       target_effects =
        {
          {
            type = "create-entity",
            entity_name = "laser-bubble"
          },
          {
            type = "damage",
            damage = { amount = DMG, type = DMGTYPE}
          }
        }
      }
    },
    light = {intensity = 0.5, size = 5},
    animation =
    {
      filename = "__base__/graphics/entity/laser/laser-to-tint-medium.png",
      tint = TINT,
      frame_count = 1,
      width = 12,
      height = 33,
      priority = "high",
      blend_mode = "additive"
    },
  }
  return result
end

for k,v in pairs(Data_Table_Projectiles) do
	if v.Projectile_Type == 1 then
	data:extend(
	{
		DyWorld_Projectile_1(v.Name, v.Dmg, v.DmgType, v.Tint)
	})
	elseif v.Projectile_Type == 2 then
	data:extend(
	{
		DyWorld_Projectile_2(v.Name, v.Dmg, v.DmgType, v.Tint)
	})
	elseif v.Projectile_Type == 3 then
	data:extend(
	{
		DyWorld_Projectile_3(v.Name, v.Dmg, v.DmgType, v.Tint)
	})
	elseif v.Projectile_Type == 4 then
	data:extend(
	{
		DyWorld_Projectile_4(v.Name, v.Dmg, v.DmgType, v.Tint)
	})
	elseif v.Projectile_Type == 5 then
	data:extend(
	{
		DyWorld_Projectile_5(v.Name, v.Dmg, v.DmgType, v.Tint)
	})
	end
end