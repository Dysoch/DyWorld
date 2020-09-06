
  ----- Basic Ballistic Ammo -----
data:extend({
  {
    type = "ammo",
    name = "ballistic-ammo-1",
    icon = "__base__/graphics/icons/firearm-magazine.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      category = "bullet",
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
                  damage = { amount = 5 , type = "ballistic"}
                }
              }
            }
          }
        }
      }
    },
    magazine_size = 25,
    subgroup = DyDs.."ammo-bullet-basic",
    order = "ballistic-ammo-1",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "ballistic-ammo-1",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "charcoal", amount = 1},
        {type = "item", name = "limestone", amount = 3},
      },
      result = "ballistic-ammo-1",
	  result_count = 1,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "charcoal", amount = 3},
        {type = "item", name = "limestone", amount = 10},
      },
      result = "ballistic-ammo-1",
	  result_count = 1,
	  enabled = false,
    },
  },
})