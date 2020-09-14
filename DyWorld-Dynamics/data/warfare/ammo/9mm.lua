

data:extend({
	----- Basic 9mm Ammo -----
  {
    type = "ammo",
    name = "9mm-bullet",
    icon = DyDs_path_icon.."bullet-9mm.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      category = "900mm",
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot"
                }
              },
              target_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "explosion-hit",
                  offsets = {{0, 1}},
                  offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
                },
                {
                  type = "damage",
                  damage = { amount = 5 , type = "physical"}
                }
              }
            }
          }
        }
      }
    },
    magazine_size = 1,
    subgroup = DyDs.."ammo-bullet-basic",
    order = "9mm",
    stack_size = 1000,
  },
  {
    type = "recipe",
    name = "9mm-bullet",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "charcoal", amount = 1},
        {type = "item", name = "limestone", amount = 3},
      },
      result = "9mm-bullet",
	  result_count = 5,
	  energy_required = 1,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "charcoal", amount = 3},
        {type = "item", name = "limestone", amount = 10},
      },
      result = "9mm-bullet",
	  result_count = 3,
	  energy_required = 5,
	  enabled = false,
    },
  },
	----- AP 9mm Ammo -----
  {
    type = "ammo",
    name = "9mm-bullet-ap",
    icon = DyDs_path_icon.."bullet-9mm.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      category = "900mm",
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot"
                }
              },
              target_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "explosion-hit",
                  offsets = {{0, 1}},
                  offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
                },
                {
                  type = "damage",
                  damage = { amount = 10 , type = "physical"}
                }
              }
            }
          }
        }
      }
    },
    magazine_size = 1,
    subgroup = DyDs.."ammo-bullet-piercing",
    order = "9mm",
    stack_size = 1000,
  },
  {
    type = "recipe",
    name = "9mm-bullet-ap",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "9mm-bullet", amount = 5},
        {type = "item", name = "tin-plate", amount = 1},
        {type = "item", name = "lignite", amount = 1},
      },
      result = "9mm-bullet-ap",
	  result_count = 5,
	  energy_required = 1.5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "9mm-bullet", amount = 7},
        {type = "item", name = "tin-plate", amount = 3},
        {type = "item", name = "lignite", amount = 2},
      },
      result = "9mm-bullet-ap",
	  result_count = 5,
	  energy_required = 7.5,
	  enabled = false,
    },
  },
})