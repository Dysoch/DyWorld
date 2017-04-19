require "data/data-templates"
require "data/prefix"

function DyWorld_Projectile_1(NAME, DMG, DMGTYPE)
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
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
	}
  }
  return result
end

for k,v in pairs(Data_Table_Projectiles) do
	if v.Projectile_Type==1 then
	data:extend(
	{
		DyWorld_Projectile_1(v.Name, v.Dmg, v.DmgType)
	})
	end
end