
  ----- Basic Repair Pack -----
data:extend({
  {
    type = "repair-tool",
    name = "basic-repair-pack",
    icon = "__base__/graphics/icons/repair-pack.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "1",
    subgroup = DyDs.."repair-pack",
    speed = 1,
    durability = 150,
    stack_size = 100,
  },
  {
    type = "recipe",
    name = "basic-repair-pack",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 1},
        {type = "item", name = "wood", amount = 1},
      },
      result = "basic-repair-pack",
	  result_count = 1,
	  energy_required = 1.5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "bronze-plate", amount = 5},
        {type = "item", name = "wood", amount = 3},
      },
      result = "basic-repair-pack",
	  result_count = 1,
	  energy_required = 6.5,
	  enabled = false,
    },
  },
})
  ----- Med Pack -----
data:extend({
  {
    type = "capsule",
    name = "med-pack",
    icon = DyDs_path_icon.."med-pack-2.png",
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
                  damage = {type = "physical", amount = -100}
                },
              }
            }
          }
        }
      }
    },
    order = "med-pack-2",
    subgroup = DyDs.."med-pack",
    stack_size = 100
  },
  {
    type = "recipe",
    name = "med-pack",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-plate", amount = 1},
        {type = "item", name = "basic-med-pack", amount = 1},
      },
      result = "med-pack",
	  result_count = 1,
	  energy_required = 2.5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "tin-plate", amount = 5},
        {type = "item", name = "basic-med-pack", amount = 2},
      },
      result = "med-pack",
	  result_count = 1,
	  energy_required = 12.5,
	  enabled = false,
    },
  },
})