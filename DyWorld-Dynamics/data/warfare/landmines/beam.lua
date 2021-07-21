
data:extend({
  {
    type = "land-mine",
    name = "laser-land-mine-1",
    icon = "__base__/graphics/icons/land-mine.png",
    icon_size = 64, icon_mipmaps = 4,
    flags =
    {
      "placeable-player",
      "placeable-enemy",
      "player-creation",
      "placeable-off-grid",
      "not-on-map"
    },
    minable = {mining_time = 0.5, result = "laser-land-mine-1"},
    mined_sound = { filename = "__core__/sound/deconstruct-small.ogg" },
    max_health = 15,
    corpse = "land-mine-remnants",
    dying_explosion = "land-mine-explosion",
    collision_box = {{-0.4,-0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    picture_safe =
    {
      filename = "__base__/graphics/entity/land-mine/hr-land-mine.png",
      priority = "medium",
      width = 64,
      height = 64,
      scale = 0.5
    },
    picture_set =
    {
      filename = "__base__/graphics/entity/land-mine/hr-land-mine-set.png",
      priority = "medium",
      width = 64,
      height = 64,
      scale = 0.5
    },
    picture_set_enemy =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine-set-enemy.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    trigger_radius = 5,
    ammo_category = "landmine",
    action =
	{
      type = "cluster",
      cluster_count = 120,
      distance = 25,
	  action_delivery =
	  {
		type = "projectile",
		projectile = "laser-gun-basic-projectile",
		direction_deviation = 0.6,
		starting_speed = 0.25,
		starting_speed_deviation = 0.5,
        range_deviation = 0.3,
        max_range = 25,
	  }
	},
    --[[action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "nested-result",
            affects_target = true,
            action =
            {
              type = "area",
              radius = 6,
              force = "enemy",
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = { amount = 100, type = "explosion"}
                  },
                  {
                    type = "create-sticker",
                    sticker = "stun-sticker"
                  }
                }
              }
            }
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          },
          {
            type = "damage",
            damage = { amount = 500, type = "explosion"}
          },
        }
      }
    },
    final_action =
	{
      type = "cluster",
      cluster_count = 120,
      distance = 0.1,
	  action_delivery =
	  {
		type = "projectile",
		projectile = "laser-gun-basic-projectile",
		direction_deviation = 0.6,
		starting_speed = 0.25,
		starting_speed_deviation = 0.5,
        range_deviation = 0.3,
        max_range = 25,
	  }
	},]]
  },
  {
    type = "item",
    name = "laser-land-mine-1",
    icon = "__base__/graphics/icons/land-mine.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "f[land-mine]",
    place_result = "laser-land-mine-1",
    stack_size = 100
  },
  {
    type = "land-mine",
    name = "laser-land-mine-2",
    icon = "__base__/graphics/icons/land-mine.png",
    icon_size = 64, icon_mipmaps = 4,
    flags =
    {
      "placeable-player",
      "placeable-enemy",
      "player-creation",
      "placeable-off-grid",
      "not-on-map"
    },
    minable = {mining_time = 0.5, result = "laser-land-mine-2"},
    mined_sound = { filename = "__core__/sound/deconstruct-small.ogg" },
    max_health = 15,
    corpse = "land-mine-remnants",
    dying_explosion = "land-mine-explosion",
    collision_box = {{-0.4,-0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    picture_safe =
    {
      filename = "__base__/graphics/entity/land-mine/hr-land-mine.png",
      priority = "medium",
      width = 64,
      height = 64,
      scale = 0.5
    },
    picture_set =
    {
      filename = "__base__/graphics/entity/land-mine/hr-land-mine-set.png",
      priority = "medium",
      width = 64,
      height = 64,
      scale = 0.5
    },
    picture_set_enemy =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine-set-enemy.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    trigger_radius = 8,
    ammo_category = "landmine",
    action =
	{
      type = "cluster",
      cluster_count = 240,
      distance = 25,
	  action_delivery =
	  {
		type = "projectile",
		projectile = "laser-gun-basic-projectile",
		direction_deviation = 0.6,
		starting_speed = 0.25,
		starting_speed_deviation = 0.5,
        range_deviation = 0.3,
        max_range = 25,
	  }
	},
  },
  {
    type = "item",
    name = "laser-land-mine-2",
    icon = "__base__/graphics/icons/land-mine.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "f[land-mine]",
    place_result = "laser-land-mine-2",
    stack_size = 100
  },
  {
    type = "land-mine",
    name = "laser-land-mine-3",
    icon = "__base__/graphics/icons/land-mine.png",
    icon_size = 64, icon_mipmaps = 4,
    flags =
    {
      "placeable-player",
      "placeable-enemy",
      "player-creation",
      "placeable-off-grid",
      "not-on-map"
    },
    minable = {mining_time = 0.5, result = "laser-land-mine-3"},
    mined_sound = { filename = "__core__/sound/deconstruct-small.ogg" },
    max_health = 15,
    corpse = "land-mine-remnants",
    dying_explosion = "land-mine-explosion",
    collision_box = {{-0.4,-0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    picture_safe =
    {
      filename = "__base__/graphics/entity/land-mine/hr-land-mine.png",
      priority = "medium",
      width = 64,
      height = 64,
      scale = 0.5
    },
    picture_set =
    {
      filename = "__base__/graphics/entity/land-mine/hr-land-mine-set.png",
      priority = "medium",
      width = 64,
      height = 64,
      scale = 0.5
    },
    picture_set_enemy =
    {
      filename = "__base__/graphics/entity/land-mine/land-mine-set-enemy.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    trigger_radius = 12,
    ammo_category = "landmine",
    action =
	{
      type = "cluster",
      cluster_count = 480,
      distance = 25,
	  action_delivery =
	  {
		type = "projectile",
		projectile = "laser-gun-basic-projectile",
		direction_deviation = 0.6,
		starting_speed = 0.25,
		starting_speed_deviation = 0.5,
        range_deviation = 0.3,
        max_range = 25,
	  }
	},
  },
  {
    type = "item",
    name = "laser-land-mine-3",
    icon = "__base__/graphics/icons/land-mine.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "f[land-mine]",
    place_result = "laser-land-mine-3",
    stack_size = 100
  },
})