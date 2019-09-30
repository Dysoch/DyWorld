require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"


data:extend(
{
  {
    type = "ammo",
    name = "atomic-artillery-shell",
    icon = "__base__/graphics/icons/artillery-shell.png",
    icon_size = 32,
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
    subgroup = "ammo",
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
            repeat_count = 100,
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
            type = "create-trivial-smoke",
            smoke_name = "artillery-smoke",
            initial_height = 0,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.005,
            offset_deviation = {{-4, -4}, {4, 4}},
          },
          {
            type = "create-entity",
            entity_name = dy.."explosion-extreme"
          },
          {
            type = "create-fire",
            entity_name = dy.."fire-flame-extreme",
            show_in_tooltip = false,
            initial_ground_flame_count = 2
          },
          {
            type = "damage",
            damage = {amount = 25000, type = "nuclear"}
          },
          {
            type = "damage",
            damage = {amount = 5000, type = "explosion"}
          },
          {
            type = "damage",
            damage = {amount = 10000, type = "sonic"}
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
              repeat_count = 1000,
              radius = 75,
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
              repeat_count = 2000,
              radius = 100,
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
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          }
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
              entity_name = dy.."explosion-small"
            }
          }
        }
      },
      {
        type = "area",
        radius = 5,
        action_delivery =
        {
          type = "instant",
          target_effects =
		  {
			{
		      type = "damage",
			  damage = {amount = 100, type = "explosion"}
			},
			{
		      type = "damage",
			  damage = {amount = 100, type = "impact"}
			},
			{
		      type = "damage",
			  damage = {amount = 200, type = "sonic"}
			},
            {
              type = "create-sticker",
              sticker = dy.."fire-sticker-small"
            },
            {
              type = "create-fire",
              entity_name = dy.."fire-flame-small",
              show_in_tooltip = false,
              initial_ground_flame_count = 2
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
              entity_name = dy.."explosion-huge"
            }
          }
        }
      },
      {
        type = "area",
        radius = 15,
        action_delivery =
        {
          type = "instant",
          target_effects =
		  {
			{
		      type = "damage",
			  damage = {amount = 500, type = "explosion"}
			},
			{
		      type = "damage",
			  damage = {amount = 500, type = "impact"}
			},
			{
		      type = "damage",
			  damage = {amount = 2000, type = "nuclear"}
			},
            {
              type = "create-sticker",
              sticker = dy.."fire-sticker-huge"
            },
            {
              type = "create-fire",
              entity_name = dy.."fire-flame-huge",
              show_in_tooltip = true,
              initial_ground_flame_count = 2
            },
			{
			  type = "destroy-cliffs",
			  radius = 15,
			  explosion = "explosion"
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