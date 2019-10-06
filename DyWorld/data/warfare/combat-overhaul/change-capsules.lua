require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if data.raw.capsule["cluster-grenade"] then
	data.raw.capsule["cluster-grenade"].capsule_action.attack_parameters.ammo_type.action.action_delivery.direction_deviation = 0.25
	data.raw.capsule["cluster-grenade"].capsule_action.attack_parameters.ammo_type.action.action_delivery.range_deviation = 0.25
	data.raw.capsule["cluster-grenade"].capsule_action.attack_parameters.ammo_type.action.action_delivery.max_range = 25
end

if data.raw.capsule["grenade"] then
	data.raw.capsule["grenade"].capsule_action.attack_parameters.ammo_type.action.action_delivery.direction_deviation = 0.25
	data.raw.capsule["grenade"].capsule_action.attack_parameters.ammo_type.action.action_delivery.range_deviation = 0.25
	data.raw.capsule["grenade"].capsule_action.attack_parameters.ammo_type.action.action_delivery.max_range = 20
end

if data.raw["land-mine"]["land-mine"] then
	data.raw["land-mine"]["land-mine"].max_health = 50
	data.raw["land-mine"]["land-mine"].action =
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
              entity_name = dy.."explosion-medium",
		    },
          },
		},
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
                action_delivery =
                {
                  type = "instant",
                  target_effects =
                  {
                    {
                      type = "damage",
                      damage = { amount = 250, type = "explosion"}
                    },
                    {
                      type = "create-sticker",
                      sticker = "stun-sticker"
                    },
                    {
                      type = "create-explosion",
                      entity_name = "explosion-hit"
                    },
                  }
                }
              }
            },
		  },
		},
      }
    }
end
