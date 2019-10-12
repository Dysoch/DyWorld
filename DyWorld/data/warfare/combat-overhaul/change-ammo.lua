require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if data.raw.ammo["rocket"] then
	data.raw.ammo["rocket"].ammo_type.action.action_delivery.direction_deviation = 0.25
	data.raw.ammo["rocket"].ammo_type.action.action_delivery.range_deviation = 0.25
	data.raw.ammo["rocket"].ammo_type.action.action_delivery.max_range = 35
	data.raw.ammo["rocket"].ammo_type.target_type = "position"
	data.raw.ammo["rocket"].ammo_type.clamp_position = true
end

if data.raw.ammo["explosive-rocket"] then
	data.raw.ammo["explosive-rocket"].ammo_type.action.action_delivery.direction_deviation = 0.25
	data.raw.ammo["explosive-rocket"].ammo_type.action.action_delivery.range_deviation = 0.25
	data.raw.ammo["explosive-rocket"].ammo_type.action.action_delivery.max_range = 50
	data.raw.ammo["explosive-rocket"].ammo_type.target_type = "position"
	data.raw.ammo["explosive-rocket"].ammo_type.clamp_position = true
end

if data.raw.ammo["atomic-bomb"] then
	data.raw.ammo["atomic-bomb"].ammo_type.action.action_delivery.direction_deviation = 0.25
	data.raw.ammo["atomic-bomb"].ammo_type.action.action_delivery.range_deviation = 0.25
	data.raw.ammo["atomic-bomb"].ammo_type.action.action_delivery.max_range = 125
	data.raw.ammo["atomic-bomb"].ammo_type.target_type = "position"
	data.raw.ammo["atomic-bomb"].ammo_type.clamp_position = true
end

if data.raw.ammo["firearm-magazine"] then
	data.raw.ammo["firearm-magazine"].ammo_type =
    {
      category = "bullet",
      target_type = "direction",
      clamp_position = true,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            source_effects =
            {
              {
                type = "create-explosion",
                entity_name = "explosion-gunshot"
              }
            }
          }
        },
        {
          type = "direct",
          repeat_count = 1,
          action_delivery =
          {
            type = "projectile",
            projectile = "firearm-magazine-projectile",
            starting_speed = 1,
            direction_deviation = 0.1,
            range_deviation = 0.3,
            max_range = 15
          }
        }
      }
    }
end

if data.raw.ammo["piercing-rounds-magazine"] then
	data.raw.ammo["piercing-rounds-magazine"].ammo_type =
    {
      category = "bullet",
      target_type = "direction",
      clamp_position = true,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            source_effects =
            {
              {
                type = "create-explosion",
                entity_name = "explosion-gunshot"
              }
            }
          }
        },
        {
          type = "direct",
          repeat_count = 1,
          action_delivery =
          {
            type = "projectile",
            projectile = "piercing-rounds-magazine-projectile",
            starting_speed = 1,
            direction_deviation = 0.08,
            range_deviation = 0.3,
            max_range = 20
          }
        }
      }
    }
end

if data.raw.ammo["uranium-rounds-magazine"] then
	data.raw.ammo["uranium-rounds-magazine"].ammo_type =
    {
      category = "bullet",
      target_type = "direction",
      clamp_position = true,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            source_effects =
            {
              {
                type = "create-explosion",
                entity_name = "explosion-gunshot"
              }
            }
          }
        },
        {
          type = "direct",
          repeat_count = 1,
          action_delivery =
          {
            type = "projectile",
            projectile = "uranium-rounds-magazine-projectile",
            starting_speed = 1,
            direction_deviation = 0.05,
            range_deviation = 0.3,
            max_range = 25
          }
        }
      }
    }
end