require "data/core/functions/prefix"
require "data/core/functions/colors"

function DyWorld_ai_settings(Var1, Var2, Var3)
	return {destroy_when_commands_fail = Var1, allow_try_return_to_spawner = Var2, do_separation = Var3}
end

function DyWorld_scale_bounding_box(bb, scale)
  local orientation = bb[3] or 0
  return
  {
    {scale*bb[1][1], scale*bb[1][2]},
    {scale*bb[2][1], scale*bb[2][2]},
    orientation
  }
end

function DyWorld_make_unit_melee_ammo_type(DMG, TYPE)
  return
  {
    category = "melee",
    target_type = "entity",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = {amount = DMG, type = TYPE}
        }
      }
    }
  }
end