
data:extend(
{
  {
    type = "ammo",
    name = "atomic-artillery-shell",
    icon = "__base__/graphics/icons/artillery-shell.png",
    icon_size = 64,
    ammo_type =
    {
      category = "artillery-shell",
      target_type = "position",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "artillery",
          projectile = "atomic-artillery-projectile",
          starting_speed = 1,
          direction_deviation = 0,
          range_deviation = 0,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "artillery-cannon-muzzle-flash"
          }
        }
      }
    },
    subgroup = DyDs.."ammo-artillery",
    order = "d[explosive-cannon-shell]-d[artillery]",
    stack_size = 1
  },
  {
    type = "artillery-projectile",
    name = "atomic-artillery-projectile",
    flags = {"not-on-map"},
    reveal_map = true,
    map_color = {r=1, g=1, b=0},
    picture =
    {
      filename = "__base__/graphics/entity/artillery-projectile/hr-shell.png",
      width = 64,
      height = 64,
      scale = 0.5
    },
    shadow =
    {
      filename = "__base__/graphics/entity/artillery-projectile/hr-shell-shadow.png",
      width = 64,
      height = 64,
      scale = 0.5
    },
    chart_picture =
    {
      filename = "__base__/graphics/entity/artillery-projectile/artillery-shoot-map-visualization.png",
      flags = { "icon" },
      frame_count = 1,
      width = 64,
      height = 64,
      priority = "high",
      scale = 0.25
    },
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            smoke_name = "nuclear-smoke",
            offset_deviation = {{-1, -1}, {1, 1}},
            starting_frame = 3,
            starting_frame_deviation = 5,
            starting_frame_speed = 0,
            starting_frame_speed_deviation = 5,
            speed_from_center = 0.5,
            max_radius = 3.5,
            repeat_count = 4 * 4 * 15
          },
          {
            type = "set-tile",
            tile_name = "nuclear-ground",
            radius = 120,
            apply_projection = true,
            tile_collision_mask = { "water-tile" }
          },
          {
            type = "camera-effect",
            effect = "screen-burn",
            duration = 60,
            ease_in_duration = 5,
            ease_out_duration = 60,
            delay = 0,
            strength = 6,
            full_strength_max_distance = 200,
            max_distance = 800
          },
          {
            type = "play-sound",
            sound = 
			{
			  filename  = "__DyWorld-Dynamics__/sounds/explosion-2.ogg",
			},
          },
          {
            type = "create-entity",
            entity_name = "cluster-nuke-explosion"
          },
          {
            type = "damage",
            damage = {amount = 500000, type = "exotic-energy"}
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 4500,
              radius = 250,
              action_delivery =
              {
                type = "projectile",
                projectile = "atomic-bomb-wave-artillery-1",
                starting_speed = 0.5,
				acceleration = 0.15,
              }
            }
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 5000,
              radius = 300,
              action_delivery =
              {
                type = "projectile",
                projectile = "atomic-bomb-wave-artillery-2",
                starting_speed = 0.5
              }
            }
          },
          {
            type = "show-explosion-on-chart",
            scale = 8/32
          },
        }
      }
    },
    height_from_ground = 280 / 64
  },
  {
    type = "projectile",
    name = "atomic-bomb-wave-artillery-1",
    flags = {"not-on-map"},
    acceleration = 0,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
			{
			  type = "create-entity",
              entity_name = "nuke-explosion"
            },
          }
        }
      },
      {
        type = "area",
        radius = 10,
        action_delivery =
        {
          type = "instant",
          target_effects =
		  {
			{
		      type = "damage",
			  damage = {amount = 500, type = "exotic-energy"}
			},
		  }
        }
      }
    },
    animation =
    {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    },
    shadow =
    {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    }
  },
  {
    type = "projectile",
    name = "atomic-bomb-wave-artillery-2",
    flags = {"not-on-map"},
    acceleration = 0,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
			{
			  type = "create-entity",
              entity_name = "nuke-explosion"
            },
          }
        }
      },
      {
        type = "area",
        radius = 25,
        action_delivery =
        {
          type = "instant",
          target_effects =
		  {
			{
		      type = "damage",
			  damage = {amount = 250, type = "exotic-energy"}
			},
		  }
        }
      }
    },
    animation =
    {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    },
    shadow =
    {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    }
  },
})