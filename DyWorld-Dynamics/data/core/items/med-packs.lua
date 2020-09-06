
  ----- Basic Med Pack -----
data:extend({
  {
    type = "capsule",
    name = "basic-med-pack",
    icon = "__base__/graphics/icons/fish.png",
    icon_size = 64, icon_mipmaps = 4,
    capsule_action =
    {
      type = "use-on-self",
      attack_parameters =
      {
        type = "projectile",
        ammo_category = "capsule",
        cooldown = 10,
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
                {
                  type = "damage",
                  damage = {type = "physical", amount = -50}
                },
              }
            }
          }
        }
      }
    },
    order = "med-pack-1",
    subgroup = DyDs.."med-pack",
    stack_size = 100
  },
  {
    type = "recipe",
    name = "basic-med-pack",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "raw-fish", amount = 1},
      },
      result = "basic-med-pack",
	  result_count = 1,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "raw-fish", amount = 5},
      },
      result = "basic-med-pack",
	  result_count = 1,
	  enabled = false,
    },
  },
})