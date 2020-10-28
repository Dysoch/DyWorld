
  ----- Basic Med Pack -----
data:extend({
  {
    type = "capsule",
    name = "basic-med-pack",
    icon = DyDs_path_icon.."med-pack-1.png",
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
	  energy_required = 1.5,
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
	  energy_required = 6.5,
	  enabled = false,
    },
  },
  ----- Med Pack -----
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
  ----- Death Pill -----
  {
    type = "capsule",
    name = "dead-pill",
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
                  damage = {type = "teleport", amount = 999999}
                },
              }
            }
          }
        }
      }
    },
    order = "dead-pill",
    subgroup = DyDs.."med-pack",
    stack_size = 100
  },
  {
    type = "recipe",
    name = "dead-pill",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "natural-gas", amount = 5},
        {type = "item", name = "tin-plate", amount = 1},
      },
      result = "dead-pill",
	  result_count = 1,
	  energy_required = 2.5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "fluid", name = "natural-gas", amount = 5*5},
        {type = "item", name = "tin-plate", amount = 1*5},
      },
      result = "dead-pill",
	  result_count = 1,
	  energy_required = 12.5,
	  enabled = false,
    },
  },
})