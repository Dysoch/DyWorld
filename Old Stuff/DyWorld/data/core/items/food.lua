require "data/core/functions/prefix"
require "data/core/functions/colors"
-- Balancing here is just the tier in which is resides in the crafting menu (the number behind the =)

local Data_Table = {
	["carrot"] = 2,
}



for k,v in pairs(Data_Table) do
data:extend(
{
  {
    type = "capsule",
    name = k,
	icons = 
	{
	  {
		icon = dyworld_path_icon..k..".png",
	  }
	},
	icon_size = 32,
    subgroup = dy.."intermediates-tier-"..(v-1),
    stack_size = 200,
	order = k,
    capsule_action =
    {
      type = "use-on-self",
      attack_parameters =
      {
        type = "projectile",
        ammo_category = "capsule",
        cooldown = 2.5 * v,
        range = 0,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = {type = "physical", amount = (-10 * v)}
              }
            }
          }
        }
      }
    },
  },
})
end	